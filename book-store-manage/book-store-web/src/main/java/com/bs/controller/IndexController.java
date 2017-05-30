package com.bs.controller;

import com.bs.pojo.Category;
import com.bs.pojo.User;
import com.bs.service.BookService;
import com.bs.service.CategoryService;
import com.bs.service.UserService;
import com.bs.util.CookieUtil;
import com.bs.utils.VerifyCodeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/2/24.
 */
@Controller
@RequestMapping("bs")
public class IndexController {

    @Resource
    private UserService userService;
    @Resource
    private BookService bookService;
    @Resource
    private CategoryService categoryService;

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping("index")
    public String index(Model model) {
        logger.info("----------------index----------------");
        model.addAttribute("books", bookService.listBooksWithHot());
        List<Map<String, Object>> categories = categoryService.listParentCategories();
        for (Map<String, Object> c : categories) {
            List<Category> subCategories = categoryService.listCategoriesByParentId(Long.valueOf(c.get("id").toString()));
            c.put("subCategories", subCategories);
        }
        model.addAttribute("categories", categories);
        return "index";
    }

    @RequestMapping("loginUI")
    public String loginUI(Model model, HttpServletRequest request) {
        Map<String, Cookie> cookieMap = CookieUtil.ReadCookieMap(request);
        if (cookieMap != null && cookieMap.containsKey("webName")) {
            Cookie cookie = cookieMap.get("webName");
            model.addAttribute("tel", cookie.getValue());
            logger.info("----------------有cookie，值" + cookie.getValue() + "----------------");
        }
        return "login";
    }

    /**
     * 用户登录
     * @param user
     * @param isRTel
     * @param request
     * @param attributes
     * @param response
     * @return
     */
    @RequestMapping("login")
    public String login(User user, String isRTel, HttpServletRequest request, RedirectAttributes attributes, HttpServletResponse response) {
        logger.info("-------------------login-------------------");
        User userDB = userService.findUserByTelAndPsw(user);
        if(userDB == null) {
            attributes.addFlashAttribute("err_msg", "用户名或密码错误");
            return "redirect:/bs/loginUI";
        } else {
            // 把用户信息保存到session
            request.getSession().setAttribute("user", userDB);
            // 读取cookie
            Map<String, Cookie> cookieMap = CookieUtil.ReadCookieMap(request);
            if((cookieMap == null || cookieMap.get("webName") == null || !cookieMap.containsKey("webName")) && "1".equals(isRTel)) {
                logger.info("----------------没有cookie----------------");
                // 存入cookie
                Cookie cookie = new Cookie("webName", userDB.getTel());
                cookie.setMaxAge(30 * 24 * 60 * 60);
                //设置路径，这个路径即该工程下都可以访问该cookie 如果不设置路径，那么只有设置该cookie路径及其子路径可以访问
                cookie.setPath("/");
                response.addCookie(cookie);
            }  else if(null != cookieMap && null != cookieMap.get("webName") && cookieMap.containsKey("webName") && (null == isRTel || !isRTel.equals("1"))){
                Cookie cookie = cookieMap.get("webName");
                cookie.setValue(null);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            return "redirect:/bs/index";
        }
    }

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping(value = "/login/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/bs/loginUI";
    }

    /**
     * 生成验证码图片
     * @param response
     * @param code 验证码数字
     * @param width 宽
     * @param height 高
     */
    @RequestMapping("/login/getVerifyCode")
    public void getVerifyCode(HttpServletResponse response, String code, Integer width, Integer height) {
        try {
            OutputStream os = response.getOutputStream();
            VerifyCodeUtils.outputImage(width, height, os, code);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取四位验证码数字
     * @return
     */
    @ResponseBody
    @RequestMapping("/login/setVerifyCode")
    public String setVerifyCode() {
        return VerifyCodeUtils.generateVerifyCode(4);
    }

    /**
     * 异步验证用户名密码
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/confirmUser")
    public Object confirmUser(User user) {
        Map<String, Boolean> result = new HashMap<>();
        User userDB = userService.findUserByTelAndPsw(user);
        if(userDB != null) {
            result.put("valid", true);
        } else {
            result.put("valid", false);
        }
        return result;
    }
}

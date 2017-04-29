package com.backstage.controller;

import com.backstage.util.CookieUtil;
import com.bs.pojo.User;
import com.bs.service.MenuService;
import com.bs.service.UserService;
import com.bs.utils.VerifyCodeUtils;
import com.bs.utils.string.StringUtil;
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
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * Created by Kay on 2017/4/13.
 */

@Controller
@RequestMapping("admin")
public class IndexController {

    @Resource
    private MenuService menuService;
    @Resource
    private UserService userService;

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    /**
     * 重定向
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexInit(){
        return "redirect:/admin/loginUI";
    }

    /**
     * 后台首页
     * @param model
     * @return
     */
    @RequestMapping("index")
    public String index(Model model) {
        List<Map<String, Object>> menus = menuService.listOneMenu();
        for (Map<String, Object> menu : menus) {
            List<Map<String, Object>> twoMenus = menuService.listMenuByPid(Long.valueOf(menu.get("id").toString()));
            if (twoMenus != null && twoMenus.size() > 0) {
                menu.put("twoMenus", twoMenus);
            }
        }
        model.addAttribute("menus", menus);
        return "index";
    }

    @RequestMapping(value = "loginUI", method = RequestMethod.GET)
    public String loginUI(Model model, HttpServletRequest request) {
        Map<String, Cookie> cookieMap = CookieUtil.ReadCookieMap(request);
        if (cookieMap != null && cookieMap.containsKey("adminName")) {
            Cookie cookie = cookieMap.get("adminName");
            model.addAttribute("tel", cookie.getValue());
            logger.info("----------------有cookie，值" + cookie.getValue() + "----------------");
        }
        return "login";
    }

    /**
     * 用户登录
     * @param user 用户
     * @param isRTel 是否记住手机号 前端checkbox的值
     * @param request
     * @param attributes
     * @return
     */
    @RequestMapping("login")
    public String login(User user, String isRTel, HttpServletRequest request, RedirectAttributes attributes, HttpServletResponse response) {
        User userDB = userService.findUserByTelAndPsw(user);
        if(userDB == null) {
            attributes.addFlashAttribute("err_msg", "用户名或密码错误");
            return "redirect:/admin/login";
        } else {
            request.getSession().setAttribute("user", userDB);
            // 读取cookie
            Map<String, Cookie> cookieMap = CookieUtil.ReadCookieMap(request);
            if((cookieMap == null || cookieMap.get("adminName") == null || !cookieMap.containsKey("adminName")) && "1".equals(isRTel)) {
                logger.info("----------------没有cookie----------------");
                // 存入cookie
                Cookie cookie = new Cookie("adminName", userDB.getTel());
                cookie.setMaxAge(30 * 24 * 60 * 60);
                //设置路径，这个路径即该工程下都可以访问该cookie 如果不设置路径，那么只有设置该cookie路径及其子路径可以访问
                cookie.setPath("/");
                response.addCookie(cookie);
            }  else if(null != cookieMap && null != cookieMap.get("adminName") && cookieMap.containsKey("adminName") && (null == isRTel || !isRTel.equals("1"))){
                Cookie cookie = cookieMap.get("adminName");
                cookie.setValue(null);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            return "redirect:/admin/index";
        }
    }

    @RequestMapping("/login/logout")
    public String logout() {
        return null;
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
    public String confirmUser(User user) {
        User userDB = userService.findUserByTelAndPsw(user);
        if(userDB != null) {
            return "yes";
        } else {
            return "no";
        }
    }

    /**
     * 403页面
     * @return
     */
    @RequestMapping("403")
    public String err403() {
        return "403";
    }

}

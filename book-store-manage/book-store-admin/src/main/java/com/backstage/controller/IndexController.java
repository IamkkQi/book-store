package com.backstage.controller;

import com.backstage.util.CookieUtil;
import com.bs.pojo.User;
import com.bs.service.MenuService;
import com.bs.service.UserService;
import com.bs.utils.string.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping("loginUI")
    public String loginUI() {
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
                Cookie cookie = new Cookie("adminName", StringUtil.getMD5(userDB.getTel()));
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
}

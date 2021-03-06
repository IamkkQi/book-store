package com.backstage.controller;

import com.backstage.aop.SystemLogAop;
import com.backstage.util.CookieUtil;
import com.bs.pojo.Log;
import com.bs.pojo.User;
import com.bs.service.LogService;
import com.bs.service.MenuService;
import com.bs.service.UserService;
import com.bs.utils.VerifyCodeUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
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
import java.util.Date;
import java.util.HashMap;
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
    @Resource
    private LogService logService;

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
    public String index(Model model, HttpSession session) {
        logger.info("----------------index----------------");
        User user = (User) session.getAttribute("user");
        List<Map<String, Object>> menus = menuService.listOneMenu();
        for (Map<String, Object> menu : menus) {
            List<Map<String, Object>> twoMenus = menuService.listMenuByPid(Long.valueOf(menu.get("id").toString()));
            if (twoMenus != null && twoMenus.size() > 0) {
                menu.put("twoMenus", twoMenus);
            }
        }
        model.addAttribute("menus", menus);
        model.addAttribute("user", user);
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
        logger.info("-------------------login-------------------");
        User userDB = userService.findUserByTelAndPsw(user);
        if(userDB == null) {
            attributes.addFlashAttribute("err_msg", "用户名或密码错误");
            // 登录失败日志储存
            Log log = new Log();
            log.setUserTel(user.getTel());
            log.setTime(new Date());
            log.setType("登录");
            log.setContent("用户登录,登录失败");
            log.setResult("执行成功");
            log.setIp(SystemLogAop.getIp(request));
            logService.save(log);
            return "redirect:/admin/loginUI";
        } else {
            // shiro认证登录
            try {
                SecurityUtils.getSubject().login(new UsernamePasswordToken(userDB.getTel(), userDB.getPassword()));
            } catch (AuthenticationException e) {
                e.printStackTrace();
                attributes.addFlashAttribute("err_msg", "没有权限");
                return "redirect:/admin/loginUI";
            }
            // 登录成功日志储存
            Log log = new Log();
            log.setUserTel(user.getTel());
            log.setTime(new Date());
            log.setType("登录");
            log.setContent("用户登录,登录成功");
            log.setResult("执行成功");
            log.setIp(SystemLogAop.getIp(request));
            logService.save(log);
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

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping(value = "/login/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        SecurityUtils.getSubject().logout();
        return "redirect:/admin/loginUI";
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

    /**
     * 403页面
     * @return
     */
    @RequestMapping("403")
    public String err403() {
        return "403";
    }


}

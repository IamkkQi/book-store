package com.bs.controller;

import com.bs.pojo.Role;
import com.bs.pojo.User;
import com.bs.service.UserService;
import com.bs.utils.string.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/2/22.
 */

@Controller
@RequestMapping("bs/user")
public class UserController {

    @Resource
    private UserService userService;

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("test")
    public String test() {
        List<User> users = userService.listAll();
        for (User user : users) {
            System.out.println(user);
        }
        return "login";
    }

    /**
     * 手机号唯一验证
     * @param tel
     * @param userId
     * @return
     */
    @RequestMapping("unique")
    @ResponseBody
    public Object unique(String tel, Long userId) {
        Map<String, Boolean> result = new HashMap<>();
        User user = userService.findUserByTel(tel);
        if((user == null) || (user != null && userId != null && userId - user.getId() == 0)) {
            result.put("valid", true);
        }
        if (user != null && userId != null && user.getId() - userId != 0) {
            result.put("valid", false);
        }
        return result;
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping("register")
    public String register(User user) {
        user.setPassword(StringUtil.getMD5(user.getPassword()));
        userService.save(user);
        return "redirect:/bs/loginUI";
    }
}

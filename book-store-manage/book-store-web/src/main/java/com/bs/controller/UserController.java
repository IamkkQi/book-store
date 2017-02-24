package com.bs.controller;

import com.bs.pojo.User;
import com.bs.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by qkk on 2017/2/22.
 */

@Controller
@RequestMapping("user")
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
}

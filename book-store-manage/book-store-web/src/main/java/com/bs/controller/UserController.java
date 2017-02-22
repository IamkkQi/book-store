package com.bs.controller;

import com.bs.pojo.User;
import com.bs.service.UserService;
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

    @RequestMapping("test")
    public String test() {
        List<User> users = userService.listAll();
        for (User user : users) {
            System.out.println(user);
        }
        return "index";
    }
}

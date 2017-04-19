package com.backstage.controller;

import com.bs.pojo.User;
import com.bs.service.UserService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Kay on 2017/4/13.
 */
@RequestMapping("admin/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<User> users = userService.listAllUsers(pageNum);

        return "user/list";
    }
}

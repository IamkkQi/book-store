package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.User;
import com.bs.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Kay on 2017/4/13.
 */
@Controller
@RequestMapping("/admin/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<User> users = userService.listAllUsers(pageNum);
        PageBean<User> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, users, userService.countAllUsers());
        model.addAttribute("pageBean", pageBean);
        return "user/list";
    }
}

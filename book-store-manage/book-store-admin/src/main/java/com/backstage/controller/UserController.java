package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.User;
import com.bs.service.UserService;
import com.bs.utils.time.DateFormatUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.Date;
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
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String keys) {
        List<User> users = userService.listAllUsers(pageNum, keys);
        PageBean<User> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, users, userService.countAllUsers(keys));
        model.addAttribute("pageBean", pageBean);
        return "user/list";
    }

    @RequestMapping("/saveUser")
    public String saveUser(User user, String birthDateStr) throws ParseException {
        user.setCreateTime(new Date());
        user.setStatus(1);
        if(!StringUtils.isEmpty(birthDateStr)) {
            Date birthDate = DateFormatUtil.parseDate("yyyy-MM-dd", birthDateStr);
            user.setBirthDate(birthDate);
        }
        userService.save(user);
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/deleteUser/{uid}")
    public String deleteUser(@PathVariable("uid") Long uid) {
        User user = userService.getById(uid);
        if (user != null) {
            user.setIsDel(1);
            user.setDelTime(new Date());
        }
        userService.update(user);
        return "redirect:/admin/user/list";
    }

    @RequestMapping("/disUser")
    public String disUser(Long userId, Integer status) {
        User user = userService.getById(userId);
        if(user != null) {
            user.setStatus(status);
            user.setUpdateTime(new Date());
        }
        userService.update(user);
        return "redirect:/admin/user/list";
    }


}

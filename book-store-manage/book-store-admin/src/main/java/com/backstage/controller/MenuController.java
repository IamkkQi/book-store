package com.backstage.controller;

import com.bs.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Kay on 2017/4/18.
 */
@Controller
@RequestMapping("/admin/menu")
public class MenuController {
    @Resource
    private MenuService menuService;
}

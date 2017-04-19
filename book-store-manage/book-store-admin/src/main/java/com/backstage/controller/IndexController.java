package com.backstage.controller;

import com.bs.pojo.Menu;
import com.bs.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
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

    @RequestMapping("login")
    public String login() {

        return "login";
    }
}

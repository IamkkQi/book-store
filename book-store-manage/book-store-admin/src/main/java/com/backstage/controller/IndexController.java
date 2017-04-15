package com.backstage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Kay on 2017/4/13.
 */

@Controller
@RequestMapping("admin")
public class IndexController {

    @RequestMapping("index")
    public String index() {
        return "index";
    }

    @RequestMapping("login")
    public String login() {

        return "login";
    }
}

package com.bs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by qkk on 2017/2/24.
 */
@Controller
@RequestMapping("bs")
public class IndexController {

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping("home")
    public String home() {
        logger.info("----------------home----------------");
        return "home";
    }
}

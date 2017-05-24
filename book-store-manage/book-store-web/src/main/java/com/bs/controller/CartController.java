package com.bs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Kay on 2017/5/23.
 */
@Controller
@RequestMapping("bs/cart")
public class CartController {

    @RequestMapping("myCart")
    public String myCart() {
        return "cart/cart";
    }
}

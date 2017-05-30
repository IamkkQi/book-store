package com.backstage.controller;

import com.bs.pojo.Order;
import com.bs.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * Created by Kay on 2017/5/31.
 */
@Controller
@RequestMapping("admin/order")
public class OrderController {

    @Resource
    private OrderService orderService;

    /**
     * 订单只有时间筛选 下拉菜单 1周前 3天前
     * @param model
     * @param pageNum
     * @param keys
     * @return
     */
    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String keys) {

        return "order/list";
    }
}

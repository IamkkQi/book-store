package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.Order;
import com.bs.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
        List<Map<String, Object>> orders = orderService.listOrders(pageNum, keys);
        PageBean<Map<String, Object>> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, orders, orderService.countOrders(keys));
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("keys", keys);
        return "order/list";
    }

    /**
     * 删除订单
     * @param oid
     * @return
     */
    @RequestMapping("delOrder/{oid}")
    public String delOrder(@PathVariable("oid") Long oid) {
        Order order = orderService.getById(oid);
        order.setIsDel(1);
        order.setDeleteTime(new Date());
        orderService.update(order);
        return "redirect:/admin/order/list";
    }
}

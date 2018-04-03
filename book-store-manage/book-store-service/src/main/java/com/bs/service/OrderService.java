package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Order;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
public interface OrderService extends BaseDAO<Order> {

    /**
     * 用户订单
     * @param userId
     * @return
     */
    List<Map<String, Object>> listByUserId(Integer pageNum, Long userId);

    /**
     * 用户订单总数
     * @param userId
     * @return
     */
    int countByUserId(Long userId);

    /**
     * 查询订单
     * @param pageNum
     * @param keys
     * @return
     */
    List<Map<String, Object>> listOrders(Integer pageNum, String keys);

    /**
     * 订单总数
     * @param keys
     * @return
     */
    int countOrders(String keys);
}

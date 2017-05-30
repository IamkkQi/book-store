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

    int countByUserId(Long userId);
}

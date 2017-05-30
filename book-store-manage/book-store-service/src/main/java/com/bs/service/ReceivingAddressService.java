package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.ReceivingAddress;

import java.util.List;

/**
 * Created by Kay on 2017/5/29.
 */
public interface ReceivingAddressService extends BaseDAO<ReceivingAddress> {

    /**
     * 获取用户的收货信息
     * @param userId
     * @return
     */
    List<ReceivingAddress> listByUserId(Long userId);

    /**
     * 获取默认收货地址
     * @param userId
     * @return
     */
    ReceivingAddress getRAByWithDefault(Long userId);
}

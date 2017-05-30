package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.ReceivingAddress;
import com.bs.service.ReceivingAddressService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Kay on 2017/5/29.
 */
@Service
@Transactional
public class ReceivingAddressServiceImpl extends BaseDAOImpl<ReceivingAddress> implements ReceivingAddressService {
    @Override
    public List<ReceivingAddress> listByUserId(Long userId) {
        String hql = "FROM ReceivingAddress WHERE userId = ? ORDER BY isDefault DESC ";
        return getSession().createQuery(hql).setParameter(0, userId).list();
    }

    @Override
    public ReceivingAddress getRAByWithDefault(Long userId) {
        String hql = "FROM ReceivingAddress WHERE userId = ? AND isDefault = 1";
        return (ReceivingAddress) getSession().createQuery(hql).setParameter(0, userId).uniqueResult();
    }
}

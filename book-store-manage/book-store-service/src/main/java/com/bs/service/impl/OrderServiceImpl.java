package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Order;
import com.bs.service.OrderService;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class OrderServiceImpl extends BaseDAOImpl<Order> implements OrderService {

    @Override
    public List<Map<String, Object>> listByUserId(Integer pageNum, Long userId) {
        String sql = "SELECT o.* FROM bs_order o WHERE o.isDel = 0 AND o.userId = ? "
                + " ORDER BY o.createTime DESC " + " LIMIT " + ((pageNum - 1) * 10) + ", " + 10;
        return getSession().createSQLQuery(sql).setParameter(0, userId).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public int countByUserId(Long userId) {
        String sql = "SELECT COUNT(o.id) FROM bs_order o WHERE o.isDel = 0 AND o.userId = ? ";
        Number number = (Number) getSession().createSQLQuery(sql).setParameter(0, userId).uniqueResult();
        return number == null ? 0 : number.intValue();
    }
}

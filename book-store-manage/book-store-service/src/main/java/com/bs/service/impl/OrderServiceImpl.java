package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Order;
import com.bs.service.OrderService;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

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

    @Override
    public List<Map<String, Object>> listOrders(Integer pageNum, String keys) {
        String sql = "SELECT o.*,(SELECT u.userName FROM bs_user u WHERE u.id = o.userId) AS userName FROM bs_order o WHERE o.isDel = 0 " + getSqlString(keys)
                + " ORDER BY o.createTime DESC " + " LIMIT " + ((pageNum - 1) * Constants.PAGE_SIZE) + "," + Constants.PAGE_SIZE;
        return getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public int countOrders(String keys) {
        String sql = "SELECT COUNT(o.id) FROM bs_order o WHERE o.isDel = 0 " + getSqlString(keys);
        Number number = (Number) getSession().createSQLQuery(sql).uniqueResult();
        return number == null ? 0 : number.intValue();
    }

    private String getSqlString(String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            // 一周内
            if("week".equals(keys)) {
                sqlKeys = " AND DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= date(createTime) ";
            }
            // 三个月内
            if ("month".equals(keys)) {
                sqlKeys = " AND DATE_SUB(CURDATE(), INTERVAL 3 MONTH) <= date(createTime) ";
            }
            // 一年内
            if ("year".equals(keys)) {
                sqlKeys = " AND DATE_SUB(CURDATE(), INTERVAL 1 YEAR) <= date(createTime) ";
            }
        }
        return sqlKeys;
    }
}

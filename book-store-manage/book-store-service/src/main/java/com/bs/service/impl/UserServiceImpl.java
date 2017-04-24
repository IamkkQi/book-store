package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.User;
import com.bs.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by qkk on 2017/2/22.
 */
@Service
@Transactional
public class UserServiceImpl extends BaseDAOImpl<User> implements UserService {
    @Override
    public List<User> listAllUsers(Integer pageNum, String keys) {
        String sqlKeys = " ";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND (userName LIKE '%" + keys + "%' OR tel LIKE '%" + keys + "%')";
        }
        String hql = "FROM User WHERE isDel = 0 " + sqlKeys + " ORDER BY createTime DESC";
        return getSession().createQuery(hql).setFirstResult((pageNum - 1) * Constants.PAGE_SIZE).setMaxResults(Constants.PAGE_SIZE).list();
    }

    @Override
    public int countAllUsers(String keys) {
        String sqlKeys = " ";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND (userName LIKE '%" + keys + "%' OR tel LIKE '%" + keys + "%')";
        }

        String hql = "SELECT COUNT(id) FROM User WHERE isDel = 0 " + sqlKeys;
        Number number = (Number) getSession().createQuery(hql).uniqueResult();
        return number == null ? 0 : number.intValue();
    }
}

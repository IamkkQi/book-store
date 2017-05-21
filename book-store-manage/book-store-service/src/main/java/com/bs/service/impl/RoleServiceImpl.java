package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Role;
import com.bs.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by Kay on 2017/4/29.
 */
@Service
@Transactional
public class RoleServiceImpl extends BaseDAOImpl<Role> implements RoleService {
    @Override
    public List<Role> listRoles(Integer pageNum, String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND roleName LIKE '%" + keys + "%' OR description LIKE '%" + keys + "%' ";
        }

        String hql = "FROM Role WHERE 1 = 1 " + sqlKeys;
        return getSession().createQuery(hql).list();
    }

    @Override
    public int countRoles(String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND roleName LIKE '%" + keys + "%' OR description LIKE '%" + keys + "%' ";
        }
        String hql = "SELECT COUNT(id) FROM Role WHERE 1 = 1 " + sqlKeys;
        Number number = (Number) getSession().createQuery(hql).uniqueResult();
        return number == null ? 0 : number.intValue();
    }

    @Override
    public Role getRoleByRoleName(String roleName) {
        String hql = "FROM Role WHERE roleName = ?";
        return (Role) getSession().createQuery(hql).setParameter(0,roleName).uniqueResult();
    }
}

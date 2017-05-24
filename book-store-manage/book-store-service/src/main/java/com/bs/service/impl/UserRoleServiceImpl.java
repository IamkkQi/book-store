package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Role;
import com.bs.pojo.User;
import com.bs.pojo.UserRole;
import com.bs.service.UserRoleService;
import com.sun.tools.internal.jxc.ap.Const;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by Kay on 2017/4/30.
 */
@Service
@Transactional
public class UserRoleServiceImpl extends BaseDAOImpl<UserRole> implements UserRoleService {
    @Override
    public List<Role> listRolesByUserId(Long userId) {
        String sql = "SELECT r.* FROM bs_role r LEFT JOIN bs_user_role ur ON ur.roleId = r.id WHERE ur.userId = ?";
        return getSession().createSQLQuery(sql).addEntity(Role.class).setParameter(0, userId).list();
    }

    @Override
    public List<Map<String, Object>> listUsersByRoleId(Integer pageNum, Long roleId, String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = "AND (u.userName LIKE '%" + keys + "%' OR u.tel LIKE '%" + keys + "%') ";
        }
        String sql = "SELECT u.id AS userId, u.userName, u.tel, r.id AS roleId, r.roleName, ur.createTime FROM bs_user u "
                    + " LEFT JOIN bs_user_role ur ON ur.userId = u.id "
                    + " LEFT JOIN bs_role r ON r.id = ur.roleId "
                    + " WHERE ur.roleId = ? " + sqlKeys + "ORDER BY ur.id DESC "
                    + " LIMIT " + (pageNum - 1) * Constants.PAGE_SIZE + ", " + Constants.PAGE_SIZE;
        return getSession().createSQLQuery(sql).setParameter(0, roleId).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public int countUsersByRoleId(Long roleId, String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = "AND (u.userName LIKE '%" + keys + "%' OR u.tel LIKE '%" + keys + "%') ";
        }
        String sql = "SELECT COUNT(u.id) FROM bs_user u LEFT JOIN bs_user_role ur ON ur.userId = u.id "
                + " LEFT JOIN bs_role r ON r.id = ur.roleId WHERE ur.roleId = ? " + sqlKeys;
        Number number = (Number) getSession().createSQLQuery(sql).setParameter(0, roleId).uniqueResult();
        return number == null ? 0 : number.intValue();
    }

    @Override
    public void deleteUserRoleByRoleId(Long roleId) {
        getSession().createSQLQuery("DELETE FROM bs_user_role WHERE roleId = ?").setParameter(0, roleId).executeUpdate();
    }

    @Override
    public void deleteUserRoleByUserId(Long userId) {
        getSession().createSQLQuery("DELETE FROM bs_user_role WHERE userId = ?").setParameter(0, userId).executeUpdate();
    }

}

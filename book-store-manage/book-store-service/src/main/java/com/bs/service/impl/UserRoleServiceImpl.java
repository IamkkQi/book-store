package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Role;
import com.bs.pojo.UserRole;
import com.bs.service.UserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
}

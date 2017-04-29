package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Permission;
import com.bs.pojo.RolePermission;
import com.bs.service.RolePermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Kay on 2017/4/30.
 */
@Service
@Transactional
public class RolePermissionServiceImpl extends BaseDAOImpl<RolePermission> implements RolePermissionService {
    @Override
    public List<Permission> listPermissionsByRoleId(Long roleId) {
        String sql = "SELECT p.* FROM bs_permission p LEFT JOIN bs_role_permission rp ON rp.permissionId = p.id WHERE rp.roleId = ?";
        return getSession().createSQLQuery(sql).addEntity(Permission.class).setParameter(0, roleId).list();
    }

    @Override
    public List<String> listPermissionNameByRoleIds(List<Long> roleIds) {
        String sql = "SELECT p.permissionName FROM bs_permission p LEFT JOIN bs_role_permission rp ON rp.permissionId = p.id WHERE rp.roleId IN :ids";
        return getSession().createSQLQuery(sql).setParameterList("ids", roleIds).list();
    }

}

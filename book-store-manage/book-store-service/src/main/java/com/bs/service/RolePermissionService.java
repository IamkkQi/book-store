package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Permission;
import com.bs.pojo.RolePermission;

import java.util.List;

/**
 * Created by Kay on 2017/4/30.
 */
public interface RolePermissionService extends BaseDAO<RolePermission> {
    /**
     * 根据角色id查询该角色拥有的权限
     * @param roleId
     * @return
     */
    List<Permission> listPermissionsByRoleId(Long roleId);

    List<String> listPermissionNameByRoleIds(List<Long> roleIds);
}

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

    /**
     * 根据角色id集合，查询角色名称集合
     * @param roleIds
     * @return
     */
    List<String> listPermissionNameByRoleIds(List<Long> roleIds);

    /**
     * 根据角色id删除角色权限关系
     * @param roleId
     */
    void deleteRolePermissionByRoleId(Long roleId);
}

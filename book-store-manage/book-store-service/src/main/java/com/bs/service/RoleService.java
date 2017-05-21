package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Role;

import java.util.List;

/**
 * Created by Kay on 2017/4/29.
 */
public interface RoleService extends BaseDAO<Role> {

    /**
     * 分页查询所有角色
     * @param pageNum
     * @param keys
     * @return
     */
    List<Role> listRoles(Integer pageNum, String keys);

    /**
     * 分页总记录
     * @param keys
     * @return
     */
    int countRoles(String keys);

    /**
     * 根据角色名查询角色
     * @param roleName
     * @return
     */
    Role getRoleByRoleName(String roleName);
}

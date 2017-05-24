package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Role;
import com.bs.pojo.User;
import com.bs.pojo.UserRole;

import java.util.List;
import java.util.Map;

/**
 * Created by Kay on 2017/4/30.
 */
public interface UserRoleService extends BaseDAO<UserRole> {
    /**
     * 根据用户ia查询所有角色
     * @param userId
     * @return
     */
    List<Role> listRolesByUserId(Long userId);

    /**
     * 根据角色id查询所有的用户
     * @param pageNum
     * @param roleId
     * @param keys
     * @return
     */
    List<Map<String, Object>> listUsersByRoleId(Integer pageNum, Long roleId, String keys);

    /**
     * 该角色下用户的总数量
     * @param roleId
     * @param keys
     * @return
     */
    int countUsersByRoleId(Long roleId, String keys);

    /**
     * 根据角色id删除用户角色
     * @param roleId
     */
    void deleteUserRoleByRoleId(Long roleId);

    /**
     * 根据用户id删除用户角色
     * @param userId
     */
    void deleteUserRoleByUserId(Long userId);
}

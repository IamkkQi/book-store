package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Role;
import com.bs.pojo.UserRole;

import java.util.List;

/**
 * Created by Kay on 2017/4/30.
 */
public interface UserRoleService extends BaseDAO<UserRole> {
    List<Role> listRolesByUserId(Long userId);
}

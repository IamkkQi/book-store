package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.User;

import java.util.List;

/**
 * Created by qkk on 2017/2/22.
 */
public interface UserService extends BaseDAO<User> {

    /**
     * 分页查询所用用户
     * @param pageNum
     * @return
     */
    List<User> listAllUsers(Integer pageNum);

    /**
     * 分页用户的总页数
     * @return
     */
    int countAllUsers();
}

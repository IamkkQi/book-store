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
    List<User> listAllUsers(Integer pageNum, String keys);

    /**
     * 分页用户的总页数
     * @return
     */
    int countAllUsers(String keys);

    /**
     * 根据用户名和密码查询用户
     * @param user
     * @return
     */
    User findUserByTelAndPsw(User user);

    /**
     * 根据手机号查询用户信息
     * @param tel
     * @return
     */
    User findUserByTel(String tel);
}

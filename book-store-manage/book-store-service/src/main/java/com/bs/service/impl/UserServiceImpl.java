package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.User;
import com.bs.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by qkk on 2017/2/22.
 */
@Service
@Transactional
public class UserServiceImpl extends BaseDAOImpl<User> implements UserService {
}

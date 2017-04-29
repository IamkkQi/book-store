package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Role;
import com.bs.service.RoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Kay on 2017/4/29.
 */
@Service
@Transactional
public class RoleServiceImpl extends BaseDAOImpl<Role> implements RoleService {
}

package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Permission;
import com.bs.service.PermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Kay on 2017/4/30.
 */
@Service
@Transactional
public class PermissionServiceImpl extends BaseDAOImpl<Permission> implements PermissionService {
}

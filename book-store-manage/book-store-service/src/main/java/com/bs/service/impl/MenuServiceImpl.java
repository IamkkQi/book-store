package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Menu;
import com.bs.service.MenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class MenuServiceImpl extends BaseDAOImpl<Menu> implements MenuService {
}

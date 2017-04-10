package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.ShoppingCart;
import com.bs.service.ShoppingCartService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class ShoppingCartServiceImpl extends BaseDAOImpl<ShoppingCart> implements ShoppingCartService {
}

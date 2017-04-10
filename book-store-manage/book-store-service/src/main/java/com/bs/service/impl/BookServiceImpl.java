package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Book;
import com.bs.service.BookService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class BookServiceImpl extends BaseDAOImpl<Book> implements BookService {
}

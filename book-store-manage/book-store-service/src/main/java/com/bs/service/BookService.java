package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Book;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
public interface BookService extends BaseDAO<Book> {

    /**
     * 分页查询所有书籍
     * @param pageNum
     * @param keys
     * @return
     */
    List<Map<String, Object>> listAllBooks(Integer pageNum, String keys);

    /**
     * 图书的总记录数
     * @param keys
     * @return
     */
    int countAllBooks(String keys);

    /**
     * 根据id获取图书详情
     * @param bid
     * @return
     */
    Map<String, Object> getBooksDetailsById(Long bid);

    /**
     * 查询热门图书
     * @return
     */
    List<Map<String, Object>> listBooksWithHot();

    List<Map<String, Object>> listBooks(Long categoryId);
}

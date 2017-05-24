package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Image;

import java.util.List;

/**
 * Created by Kay on 2017/5/22.
 */
public interface ImageService extends BaseDAO<Image> {

    /**
     * 根据图书id查询图片
     * @param bookId 图书id
     * @return
     */
    List<Image> listByBookId(Long bookId);
}

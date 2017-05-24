package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Image;
import com.bs.service.ImageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Kay on 2017/5/22.
 */
@Service
@Transactional
public class ImageServiceImpl extends BaseDAOImpl<Image> implements ImageService {
    @Override
    public List<Image> listByBookId(Long bookId) {
        String hql = "FROM Image WHERE fkId = ?";
        return getSession().createQuery(hql).setParameter(0, bookId).list();
    }
}

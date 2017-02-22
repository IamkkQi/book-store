package com.bs.dao.impl;


import com.bs.dao.BaseDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 * 基础dao实现类
 * Created by qkk on 2017/2/20.
 */
public class BaseDAOImpl<T> implements BaseDAO<T> {

    private static Logger logger = LoggerFactory.getLogger(BaseDAOImpl.class);

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;
    private Class<?> clazz;

    /**
     * 获取实现类类型
     */
    public BaseDAOImpl() {
        ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
        Type[] types = parameterizedType.getActualTypeArguments();
        clazz = (Class<?>) types[0];
    }

    /**
     * 获取当前可用session
     * @return 返回session
     */
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void save(T entity) {
        getSession().save(entity);
    }

    @Override
    public void remove(Long id) {
        Object o = getSession().get(clazz, id);
        getSession().delete(o);
    }

    @Override
    public void update(T entity) {
        getSession().update(entity);
    }

    @Override
    public T getById(Long id) {
        return (T) getSession().get(clazz, id);
    }

    @Override
    public List<T> listAll() {
        return getSession().createQuery("FROM " + clazz.getSimpleName()).list();
    }

    @Override
    public void insertBatch(List<T> entities) {
        for (int i = 0; i < entities.size(); i++) {
            getSession().save(entities.get(i));
            if (i % 20 == 0) {
                getSession().flush();
                getSession().clear();
            }
        }
    }

    @Override
    public void updateBatch(List<T> entities) {
        for (int i = 0; i < entities.size(); i++) {
            getSession().update(entities.get(i));
            if (i % 20 == 0) {
                getSession().flush();
                getSession().clear();
            }
        }
    }
}

package com.bs.dao;

import java.util.List;

/**
 * DAO基础类
 * Created by qkk on 2017/2/20.
 */
public interface BaseDAO<T> {

    /**
     * 保存实体
     * @param entity 实体
     */
    void save(T entity);

    /**
     * 删除实体
     * @param id 实体id
     */
    void remove(Long id);

    /**
     * 更新实体
     * @param entity 实体
     */
    void update(T entity);

    /**
     * 根据id查询实体
     * @param id 实体id
     * @return Object
     */
    T getById(Long id);

    /**
     * 查询所有实体
     * @return 实体集
     */
    List<T> listAll();

    /**
     * 批量插入
     * @param entities 实体集
     */
    void insertBatch(List<T> entities);

    /**
     * 批量更新
     * @param entities 实体集
     */
    void updateBatch(List<T> entities);

}

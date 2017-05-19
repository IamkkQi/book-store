package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Category;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
public interface CategoryService extends BaseDAO<Category> {

    /**
     * 根据级别查询分类
     * @param level
     * @return
     */
    List<Category> listCategoriesByLevel(Integer level);

    /**
     * 分页查询所有分类
     * @param pageNum
     * @param keys
     * @return
     */
    List<Map<String, Object>> listAllCategories(Integer pageNum, String keys);

    /**
     * 分类查询的总记录数
     * @param keys
     * @return
     */
    int countAllCategories(String keys);

    /**
     * 根据父id查询所有分类
     * @param pid
     * @return
     */
    List<Category> listCategoriesByParentId(Long pid);
}

package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Category;
import com.bs.service.CategoryService;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class CategoryServiceImpl extends BaseDAOImpl<Category> implements CategoryService {
    @Override
    public List<Category> listCategoriesByLevel(Integer level) {
        String hql = "FROM Category WHERE level = ? AND isDel = 0";
        return getSession().createQuery(hql).setParameter(0, level).list();
    }

    @Override
    public List<Map<String, Object>> listAllCategories(Integer pageNum, String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND categoryName LIKE '%" + keys + "%'";
        }
        String sql = "SELECT c.*,(SELECT bc.categoryName FROM bs_category bc WHERE c.parentId = bc.id ) AS parentName, "
                + "(SELECT bc.id FROM bs_category bc WHERE c.parentId = bc.id ) AS pid "
                + "FROM bs_category c WHERE isDel = 0 " + sqlKeys + "ORDER BY c.updateTime DESC, c.createTime DESC "
                + " LIMIT " + (pageNum - 1) * Constants.PAGE_SIZE + ", " + Constants.PAGE_SIZE;

        return getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public int countAllCategories(String keys) {
        String sqlKeys = "";
        if (!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND categoryName LIKE '%" + keys + "%'";
        }
        String hql = "SELECT COUNT(id) FROM Category WHERE isDel = 0 " + sqlKeys;
        Number number = (Number) getSession().createQuery(hql).uniqueResult();
        return number == null ? 0 : number.intValue();
    }

    @Override
    public List<Category> listCategoriesByParentId(Long pid) {
        String hql = "FROM Category WHERE isDel = 0 AND parentId = ?";
        return getSession().createQuery(hql).setParameter(0, pid).list();
    }
}

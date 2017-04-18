package com.bs.service.impl;

import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Menu;
import com.bs.service.MenuService;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class MenuServiceImpl extends BaseDAOImpl<Menu> implements MenuService {
    @Override
    public List<Map<String, Object>> listOneMenu() {
        String sql = "SELECT id,menuName,level,pid,eventType,url,menuPinYin,sort FROM bs_menu WHERE level = 1";
        return getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public List<Map<String, Object>> listMenuByPid(Long pid) {
        String sql = "SELECT id,menuName,level,pid,eventType,url,menuPinYin,sort FROM bs_menu WHERE pid = ? AND level = 2";
        return getSession().createQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).setParameter(0, pid).list();
    }
}

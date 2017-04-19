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
        String sql = "SELECT m.id,m.menuName,m.level,pid,m.eventType,m.url,m.menuPinYin,m.sort,m.icon FROM bs_menu m WHERE m.level = 1";
        return getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public List<Map<String, Object>> listMenuByPid(Long pid) {
        String sql = "SELECT m.id,m.menuName,m.level,m.pid,m.eventType,m.url,m.menuPinYin,m.sort,m.icon FROM bs_menu m WHERE m.pid = ? AND m.level = 2";
        return getSession().createSQLQuery(sql).setParameter(0, pid).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }
}

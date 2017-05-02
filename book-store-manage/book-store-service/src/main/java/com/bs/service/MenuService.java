package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Menu;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
public interface MenuService extends BaseDAO<Menu> {

    /**
     * 查询一级菜单
     * @return
     */
    List<Map<String, Object>> listOneMenu();

    /**
     * 查询二级菜单
     * @param pid 父id
     * @return
     */
    List<Map<String, Object>> listMenuByPid(Long pid);
}

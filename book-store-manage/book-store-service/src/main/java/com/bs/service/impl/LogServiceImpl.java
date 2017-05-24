package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Log;
import com.bs.service.LogService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Kay on 2017/5/23.
 */
@Service
@Transactional
public class LogServiceImpl extends BaseDAOImpl<Log> implements LogService {
    @Override
    public List<Log> listLogs(Integer pageNum) {
        return getSession().createQuery("FROM Log").setFirstResult((pageNum - 1) * Constants.PAGE_SIZE).setMaxResults(Constants.PAGE_SIZE).list();
    }

    @Override
    public int countLogs() {
        Number number = (Number) getSession().createQuery("SELECT COUNT(id) FROM Log").uniqueResult();
        return number == null ? 0 : number.intValue();
    }
}

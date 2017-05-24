package com.bs.service;

import com.bs.dao.BaseDAO;
import com.bs.pojo.Log;

import java.util.List;

/**
 * Created by Kay on 2017/5/23.
 */
public interface LogService extends BaseDAO<Log> {

    /**
     * 日志列表
     * @param pageNum
     * @return
     */
    List<Log> listLogs(Integer pageNum);

    /**
     * 总记录数
     * @return
     */
    int countLogs();
}

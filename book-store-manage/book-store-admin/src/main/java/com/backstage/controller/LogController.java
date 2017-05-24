package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.Log;
import com.bs.service.LogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Kay on 2017/5/24.
 */
@Controller
@RequestMapping("admin/log")
public class LogController {

    @Resource
    private LogService logService;

    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<Log> logs = logService.listLogs(pageNum);
        PageBean<Log> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, logs, logService.countLogs());
        model.addAttribute("pageBean", pageBean);
        return "log/list";
    }
}

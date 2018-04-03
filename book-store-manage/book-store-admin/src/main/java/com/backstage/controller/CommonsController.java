package com.backstage.controller;

import com.bs.pojo.Role;
import com.bs.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Kay on 2017/5/20.
 */

@Controller
@RequestMapping("admin/commons")
public class CommonsController {

    @Resource
    private RoleService roleService;

    /**
     * 唯一性验证
     * @param field 要验证的字段
     * @param id 实体id
     * @param type 类型 tel 用户手机号  role 角色名
     * @return
     */
    @RequestMapping("unique")
    @ResponseBody
    public Object unique(String field, Long id, String type) {
        Map<String, Boolean> result = new HashMap<>();
        if ("role".equals(type)) {
            Role role = roleService.getRoleByRoleName(field);
            if ((role == null) || (role != null && id != null && id - role.getId() == 0)) {
                result.put("valid", true);
            }

            if(role != null && id != null && role.getId() - id != 0) {
                result.put("valid", false);
            }
        }
        return result;
    }
}

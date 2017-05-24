package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.*;
import com.bs.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by Kay on 2017/5/20.
 */
@Controller
@RequestMapping("admin/role")
public class RoleController {

    @Resource
    private RoleService roleService;
    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private RolePermissionService rolePermissionService;
    @Resource
    private PermissionService permissionService;

    /**
     * 角色列表
     * @param model
     * @param pageNum
     * @param keys
     * @return
     */
    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String keys) {

        PageBean<Role> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, roleService.listRoles(pageNum, keys), roleService.countRoles(keys));
        model.addAttribute("pageBean", pageBean);
        // 没有角色的用户
        List<User> usersWithNotRole = userService.listUsersWithNotRole();
        model.addAttribute("usersWithNotRole", usersWithNotRole);
        model.addAttribute("keys", keys);
        return "role/list";
    }

    /**
     * 角色添加
     * @param role
     * @return
     */
    @RequestMapping("addRole")
    public String addRole(Role role) {
        role.setType(1);
        role.setCreateTime(new Date());
        roleService.save(role);
        return "redirect:/admin/role/list";
    }

    /**
     * 删除角色
     * @param rid
     * @return
     */
    @RequestMapping("deleteRole/{rid}")
    public String deleteRole(@PathVariable("rid") Long rid) {
        // 删除角色
        roleService.remove(rid);
        // 删除用户角色关系
        userRoleService.deleteUserRoleByRoleId(rid);
        // 删除角色权限关系
        rolePermissionService.deleteRolePermissionByRoleId(rid);
        return "redirect:/admin/role/list";
    }

    /**
     * 修改角色
     * @param role
     * @return
     */
    @RequestMapping("editRole")
    public String editRole(Role role) {
        Role roleDB = roleService.getById(role.getId());
        if(roleDB != null) {
            roleDB.setRoleName(role.getRoleName());
            roleDB.setDescription(role.getDescription());
            roleService.update(roleDB);
        }
        return "redirect:/admin/role/list";
    }

    /**
     * 添加角色
     * @param userRole
     * @return
     */
    @RequestMapping("addUserRole")
    public String addUserRole(UserRole userRole) {
        userRole.setCreateTime(new Date());
        userRoleService.save(userRole);
        return "redirect:/admin/role/list";
    }

    /**
     * 获取所有权限以及角色拥有的权限
     * @param rid
     * @return
     */
    @RequestMapping("getPermissionsZNodes")
    @ResponseBody
    public Object getPermissionsZNodes(Long rid) {
        List<Map<String, Object>> zNodes = new ArrayList<>();
        List<Permission> allPermissions = permissionService.listAll();
        List<Permission> rolePermissions = rolePermissionService.listPermissionsByRoleId(rid);
        for (Permission p1 : allPermissions) {
            Map<String, Object> node = new HashMap<>();
            node.put("id", p1.getId());
            node.put("pId", p1.getParentId());
            node.put("name", p1.getDescription());
            if(p1.getParentId() == null) {
                node.put("open", true);
            }
            for (Permission p2 : rolePermissions) {
                if (p1.getId() == p2.getId()) {
                    node.put("checked", true);
                }
            }
            zNodes.add(node);
        }
        return zNodes;
    }


    /**
     * 分配权限
     * @param rid
     * @param pIds
     * @return
     */
    @RequestMapping("addPermissions")
    public String addPermissions(Long rid, String pIds) {
        // 先删除该角色拥有的权限
        rolePermissionService.deleteRolePermissionByRoleId(rid);
        // 再添加权限
        if(!StringUtils.isEmpty(pIds)) {
            String[] pidArray = pIds.split(",");
            for (String pid : pidArray) {
                rolePermissionService.save(new RolePermission(rid, Long.valueOf(pid), new Date()));
            }
        }
        return "redirect:/admin/role/list";
    }

    /**
     * 该角色下的所有用户
     * @param model
     * @param pageNum
     * @param rid
     * @param keys
     * @return
     */
    @RequestMapping("userWithRole")
    public String userWithRole(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Long rid, String keys) {
        List<Map<String, Object>> usersWithRole = userRoleService.listUsersByRoleId(pageNum, rid, keys);
        int recordCount = userRoleService.countUsersByRoleId(rid, keys);
        PageBean<Map<String, Object>> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, usersWithRole, recordCount);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("rid", rid);
        return "role/userRoleList";
    }

    /**
     * 删除用户角色
     * @param userId
     * @param roleId
     * @return
     */
    @RequestMapping("deleteUserRole")
    public String deleteUserRole(Long userId, Long roleId) {
        userRoleService.deleteUserRoleByUserId(userId);
        return "redirect:/admin/role/userWithRole?rid=" + roleId;
    }


}

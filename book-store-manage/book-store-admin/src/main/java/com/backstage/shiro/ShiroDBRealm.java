package com.backstage.shiro;

import com.backstage.controller.IndexController;
import com.bs.pojo.Role;
import com.bs.pojo.User;
import com.bs.service.RolePermissionService;
import com.bs.service.UserRoleService;
import com.bs.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 自定义shiroRelm
 * Created by Kay on 2017/4/29.
 */
public class ShiroDBRealm extends AuthorizingRealm {

    private static Logger logger = LoggerFactory.getLogger(ShiroDBRealm.class);

    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private RolePermissionService rolePermissionService;

    /**
     * 授权方法
     *  认证成功后不会立即进入授权方法
     *  进入授权方法的时机，第一次需要做授权操作的时候才会进入此方法
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 获取用户名
        String userName = (String) principalCollection.getPrimaryPrincipal();
        logger.info("----------------" + userName + ":授权----------------");
        // 从数据库中查找用户
        User user = userService.findUserByTel(userName);
        if (user != null) {
            // 查询角色集合
            List<Role> roles = userRoleService.listRolesByUserId(user.getId());
            // 角色名集合
            Set<String> roleNames = new HashSet<>();
            List<Long> roleIds = new ArrayList<>();
            if (roles != null && roles.size() != 0) {
                for (Role r : roles) {
                    roleNames.add(r.getRoleName());
                    roleIds.add(r.getId());
                }
            }
            // 权限集合
            List<String> permissionNames = rolePermissionService.listPermissionNameByRoleIds(roleIds);
            SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
            authorizationInfo.setRoles(roleNames);
            authorizationInfo.addStringPermissions(permissionNames);
            return authorizationInfo;

        }
        return null;
    }


    /**
     * 认证方法
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 获取用户名
        String userName = (String) authenticationToken.getPrincipal();
        // 查询用户
        User user = userService.findUserByTel(userName);
        if (user != null) {
            return new SimpleAuthenticationInfo(user.getTel(), user.getPassword(), getName());
        }
        return null;
    }
}

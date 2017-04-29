package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 角色权限
 * Created by Kay on 2017/4/27.
 */
@Entity
@Table(name = "bs_role_permission")
public class RolePermission implements Serializable {
    private Long id;
    // 角色id
    private Long roleId;
    // 权限id
    private Long permissionId;
    // 创建时间
    private Date createTime;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public RolePermission(Long roleId, Long permissionId, Date createTime) {
        this.roleId = roleId;
        this.permissionId = permissionId;
        this.createTime = createTime;
    }

    public RolePermission() {
    }
}

package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户角色关联
 * Created by Kay on 2017/4/27.
 */
@Entity
@Table(name = "bs_user_role")
public class UserRole implements Serializable {
    private Long id;
    // 用户id
    private Long userId;
    // 角色id
    private Long roleId;
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

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public UserRole(Long userId, Long roleId, Date createTime) {
        this.userId = userId;
        this.roleId = roleId;
        this.createTime = createTime;
    }

    public UserRole() {
    }
}

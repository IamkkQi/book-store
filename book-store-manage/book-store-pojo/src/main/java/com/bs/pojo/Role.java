package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 角色
 * Created by Kay on 2017/4/27.
 */
@Entity
@Table(name = "bs_role")
public class Role implements Serializable {
    // 角色id
    private Long id;
    // 角色名称
    private String roleName;
    // 角色说明
    private String description;
    //  0-默认 1-自定义
    private Integer type;
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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                ", description='" + description + '\'' +
                ", type=" + type +
                ", createTime=" + createTime +
                '}';
    }

    public Role() {
    }

    public Role(String roleName, String description, Integer type, Date createTime) {
        this.roleName = roleName;
        this.description = description;
        this.type = type;
        this.createTime = createTime;
    }
}

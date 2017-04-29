package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Kay on 2017/4/27.
 */
@Entity
@Table(name = "bs_permission")
public class Permission implements Serializable {
    // 权限id
    private Long id;
    // 权限名称
    private String permissionName;
    // 资源路径
    private String url;
    // 父id
    private Long parentId;
    // 创建时间
    private Date createTime;
    // 资源描述
    private String desp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getDesp() {
        return desp;
    }

    public void setDesp(String desp) {
        this.desp = desp;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", permissionName='" + permissionName + '\'' +
                ", url='" + url + '\'' +
                ", parentId=" + parentId +
                ", createTime=" + createTime +
                ", desp='" + desp + '\'' +
                '}';
    }
}

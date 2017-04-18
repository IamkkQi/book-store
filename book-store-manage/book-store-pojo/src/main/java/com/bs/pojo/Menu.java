package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by qkk on 2017/4/10.
 */
@Entity
@Table(name = "bs_menu")
public class Menu implements Serializable {
    private Long id;
    // 菜单名称
    private String menuName;
    // 菜单等级
    private Integer level;
    // 父id
    private Long pid;
    // 事件类型
    private Integer eventType;
    // url
    private String url;
    // 名称拼音
    private String menuPinYin;
    // 排序
    private Integer sort;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Integer getEventType() {
        return eventType;
    }

    public void setEventType(Integer eventType) {
        this.eventType = eventType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMenuPinYin() {
        return menuPinYin;
    }

    public void setMenuPinYin(String menuPinYin) {
        this.menuPinYin = menuPinYin;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", menuName='" + menuName + '\'' +
                ", level=" + level +
                ", pid=" + pid +
                ", eventType=" + eventType +
                ", url='" + url + '\'' +
                ", menuPinYin='" + menuPinYin + '\'' +
                ", sort=" + sort +
                '}';
    }
}

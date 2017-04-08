package com.bs.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * 全国城市
 * Created by qkk on 2017/4/8.
 */
public class City implements Serializable {

    private Long id;
    // 名称
    private String name;
    // 父id
    private Long parentId;
    // 简称
    private String shortName;
    // 级别:0,中国；1，省分；2，市；3，区、县
    private Integer levelType;
    // 城市代码
    private String cityCode;
    // 邮编
    private String zipCode;
    // 经度
    private String lng;
    // 维度
    private String lat;
    // 拼音
    private String pinyin;
    // 状态
    private String status;
    // 是否为热门
    private Integer isHot = 0;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public Integer getLevelType() {
        return levelType;
    }

    public void setLevelType(Integer levelType) {
        this.levelType = levelType;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parentId=" + parentId +
                ", shortName='" + shortName + '\'' +
                ", levelType=" + levelType +
                ", cityCode='" + cityCode + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", lng='" + lng + '\'' +
                ", lat='" + lat + '\'' +
                ", pinyin='" + pinyin + '\'' +
                ", status='" + status + '\'' +
                ", isHot=" + isHot +
                '}';
    }
}

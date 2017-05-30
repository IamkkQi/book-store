package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Kay on 2017/5/25.
 */
@Entity
@Table(name = "bs_receiving_address")
public class ReceivingAddress implements Serializable {

    private Long id;
    // 省
    private String province;
    // 市
    private String city;
    // 区
    private String district;
    // 详细地址
    private String details;
    // 邮编
    private String zipCode;
    // 收货人姓名
    private String receivingName;
    // 收货人手机号
    private String receivingTel;
    // 是否默认
    private Integer isDefault;
    // 用户id
    private Long userId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getReceivingName() {
        return receivingName;
    }

    public void setReceivingName(String receivingName) {
        this.receivingName = receivingName;
    }

    public String getReceivingTel() {
        return receivingTel;
    }

    public void setReceivingTel(String receivingTel) {
        this.receivingTel = receivingTel;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    @Override
    public String toString() {
        return "ReceivingAddress{" +
                "id=" + id +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", details='" + details + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", receivingName='" + receivingName + '\'' +
                ", receivingTel='" + receivingTel + '\'' +
                ", isDefault=" + isDefault +
                ", userId=" + userId +
                '}';
    }
}

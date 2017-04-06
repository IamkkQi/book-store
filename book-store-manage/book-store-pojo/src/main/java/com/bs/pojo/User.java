package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 用户
 * Created by qkk on 2017/2/20.
 */
@Entity
@Table(name = "bs_user")
public class User implements Serializable {

    private Long id;
    private String userName; // 用户名
    private String password; // 密码
    private String nickName; // 昵称
    private String imgSrc; // 头像
    private String tel; // 手机号
    private Integer gender; // 性别 1-男 2-女 0-未知
    private Date createTime; // 创建时间
    private Date updateTime; // 更新时间
    private Integer isDel = 0; // 是否删除 0-未删除 1-已删除
    private Date delTime; // 删除时间
    private Integer status = 1; // 状态 默认1可用
    private Date birthDate; // 出生日期
    private String email; // 电子邮箱
    private String address; // 地址

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(String imgSrc) {
        this.imgSrc = imgSrc;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Date getDelTime() {
        return delTime;
    }

    public void setDelTime(Date delTime) {
        this.delTime = delTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User() {
    }

    public User(Long id, String userName, String password, String nickName, String imgSrc, String tel, Integer gender, Date createTime, Date updateTime, Integer isDel, Date delTime, Integer status, Date birthDate, String email, String address) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.nickName = nickName;
        this.imgSrc = imgSrc;
        this.tel = tel;
        this.gender = gender;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.isDel = isDel;
        this.delTime = delTime;
        this.status = status;
        this.birthDate = birthDate;
        this.email = email;
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", nickName='" + nickName + '\'' +
                ", imgSrc='" + imgSrc + '\'' +
                ", tel='" + tel + '\'' +
                ", gender=" + gender +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", isDel=" + isDel +
                ", delTime=" + delTime +
                ", status=" + status +
                ", birthDate=" + birthDate +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}

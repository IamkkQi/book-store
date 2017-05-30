package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by qkk on 2017/4/8.
 */
@Entity
@Table(name = "bs_order")
public class Order implements Serializable {

    private Long id;
    // 订单号
    private String orderNum;
    // 用户id
    private Long userId;
    // 创建时间
    private Date createTime;
    // 总订单数量
    private int orderMount;
    // 留言
    private String message;
    // 送货方式
    private Integer postType;
    // 支付方式
    private Integer payType;
    // 收货人姓名
    private String receivingName;
    // 收货地址
    private String receivingAddress;
    // 收货人手机号
    private String receivingTel;
    // 备注
    private String description;
    // 订单总价钱
    private BigDecimal totalPrice;
    // 订单状态
    private Integer status;
    // 更新时间
    private Date updateTime;
    // 删除时间
    private Date deleteTime;
    // 是否删除
    private Integer isDel = 0;
    // 图书信息
    private String bookInfos;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getOrderMount() {
        return orderMount;
    }

    public void setOrderMount(int orderMount) {
        this.orderMount = orderMount;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getPostType() {
        return postType;
    }

    public void setPostType(Integer postType) {
        this.postType = postType;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getReceivingName() {
        return receivingName;
    }

    public void setReceivingName(String receivingName) {
        this.receivingName = receivingName;
    }

    public String getReceivingAddress() {
        return receivingAddress;
    }

    public void setReceivingAddress(String receivingAddress) {
        this.receivingAddress = receivingAddress;
    }

    public String getReceivingTel() {
        return receivingTel;
    }

    public void setReceivingTel(String receivingTel) {
        this.receivingTel = receivingTel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public String getBookInfos() {
        return bookInfos;
    }

    public void setBookInfos(String bookInfos) {
        this.bookInfos = bookInfos;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderNum='" + orderNum + '\'' +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", orderMount=" + orderMount +
                ", message='" + message + '\'' +
                ", postType=" + postType +
                ", payType=" + payType +
                ", receivingName='" + receivingName + '\'' +
                ", receivingAddress='" + receivingAddress + '\'' +
                ", receivingTel='" + receivingTel + '\'' +
                ", description='" + description + '\'' +
                ", totalPrice=" + totalPrice +
                ", status=" + status +
                ", updateTime=" + updateTime +
                ", deleteTime=" + deleteTime +
                ", isDel=" + isDel +
                '}';
    }
}

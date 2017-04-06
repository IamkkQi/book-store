package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 图书实体类
 * Created by qkk on 2017/4/6.
 */
@Entity
@Table(name = "bs_book")
public class Book implements Serializable {
    private Long id;
    private String bookName; // 书名
    private String bookAuthor;   // 作者
    private BigDecimal bookPrice; // 图书定价
    private String bookImgUrl; // 图片地址
    private String bookNumber; // 图书编号
    private Long categoryId; // 图书类别
    private Date createTime; // 创建时间
    private Date updateTime; // 更新时间
    private Date deleteTime; // 删除时间
    private Integer isDel = 0; // 是否删除 0-不删除 1-删除
    private Integer status = 0; // 状态
    private String bookPress; // 出版社
    private Date bookPubTime; // 出版日期
    private String bookSize; // 开本
    private Integer bookPages; // 图书页码
    private String bookOutline; // 图书简介
    private String bookCatalog; // 图书目录
    private BigDecimal bookMprice; // 市场价
    private BigDecimal bookPrprice; // 会员价
    private Integer bookDealmount; // 成交量
    private Integer bookLookmount; // 浏览次数
    private Integer bookStoremount; // 图书库存量
    private Date bookStoretime; // 入库时间

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public BigDecimal getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(BigDecimal bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getBookImgUrl() {
        return bookImgUrl;
    }

    public void setBookImgUrl(String bookImgUrl) {
        this.bookImgUrl = bookImgUrl;
    }

    public String getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(String bookNumber) {
        this.bookNumber = bookNumber;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress;
    }

    public Date getBookPubTime() {
        return bookPubTime;
    }

    public void setBookPubTime(Date bookPubTime) {
        this.bookPubTime = bookPubTime;
    }

    public String getBookSize() {
        return bookSize;
    }

    public void setBookSize(String bookSize) {
        this.bookSize = bookSize;
    }

    public Integer getBookPages() {
        return bookPages;
    }

    public void setBookPages(Integer bookPages) {
        this.bookPages = bookPages;
    }

    public String getBookOutline() {
        return bookOutline;
    }

    public void setBookOutline(String bookOutline) {
        this.bookOutline = bookOutline;
    }

    public String getBookCatalog() {
        return bookCatalog;
    }

    public void setBookCatalog(String bookCatalog) {
        this.bookCatalog = bookCatalog;
    }

    public BigDecimal getBookMprice() {
        return bookMprice;
    }

    public void setBookMprice(BigDecimal bookMprice) {
        this.bookMprice = bookMprice;
    }

    public BigDecimal getBookPrprice() {
        return bookPrprice;
    }

    public void setBookPrprice(BigDecimal bookPrprice) {
        this.bookPrprice = bookPrprice;
    }

    public Integer getBookDealmount() {
        return bookDealmount;
    }

    public void setBookDealmount(Integer bookDealmount) {
        this.bookDealmount = bookDealmount;
    }

    public Integer getBookLookmount() {
        return bookLookmount;
    }

    public void setBookLookmount(Integer bookLookmount) {
        this.bookLookmount = bookLookmount;
    }

    public Integer getBookStoremount() {
        return bookStoremount;
    }

    public void setBookStoremount(Integer bookStoremount) {
        this.bookStoremount = bookStoremount;
    }

    public Date getBookStoretime() {
        return bookStoretime;
    }

    public void setBookStoretime(Date bookStoretime) {
        this.bookStoretime = bookStoretime;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookName='" + bookName + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPrice=" + bookPrice +
                ", bookImgUrl='" + bookImgUrl + '\'' +
                ", bookNumber='" + bookNumber + '\'' +
                ", categoryId=" + categoryId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", deleteTime=" + deleteTime +
                ", isDel=" + isDel +
                ", status=" + status +
                ", bookPress='" + bookPress + '\'' +
                ", bookPubTime=" + bookPubTime +
                ", bookSize='" + bookSize + '\'' +
                ", bookPages=" + bookPages +
                ", bookOutline='" + bookOutline + '\'' +
                ", bookCatalog='" + bookCatalog + '\'' +
                ", bookMprice=" + bookMprice +
                ", bookPrprice=" + bookPrprice +
                ", bookDealmount=" + bookDealmount +
                ", bookLookmount=" + bookLookmount +
                ", bookStoremount=" + bookStoremount +
                ", bookStoretime=" + bookStoretime +
                '}';
    }
}

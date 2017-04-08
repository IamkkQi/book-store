package com.bs.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

/**
 * 图书评价表
 * Created by qkk on 2017/4/8.
 */
public class Comment implements Serializable {

    private Long id;
    private Long bookId; // 图书id
    private Long userId; // 用户id
    private Date createTime; // 创建时间
    private String content;  // 评价内容
    private Integer status;  // 审核标志 0-未通过 1-已通过
    private Date updateTime; // 更新实践
    private Date deleteTime; // 删除时间
    private Integer isDel = 0; // 是否删除

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", bookId=" + bookId +
                ", userId=" + userId +
                ", createTime=" + createTime +
                ", content='" + content + '\'' +
                ", status=" + status +
                ", updateTime=" + updateTime +
                ", deleteTime=" + deleteTime +
                ", isDel=" + isDel +
                '}';
    }
}

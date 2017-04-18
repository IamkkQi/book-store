package com.bs.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 留言回复
 * Created by qkk on 2017/4/8.
 */
@Entity
@Table(name = "bs_reply")
public class Reply implements Serializable {

    private Long id;
    // 用户id
    private Long userId;
    // 留言类型
    private Integer replyType;
    // 留言主题
    private String replyTitle;
    // 留言内容
    private String replyContent;
    // 创建时间
    private Date createTime;
    // 更新时间
    private Date updateTime;
    // 删除时间
    private Date deleteTime;
    // 删除时间
    private Integer isDel = 0;

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

    public Integer getReplyType() {
        return replyType;
    }

    public void setReplyType(Integer replyType) {
        this.replyType = replyType;
    }

    public String getReplyTitle() {
        return replyTitle;
    }

    public void setReplyTitle(String replyTitle) {
        this.replyTitle = replyTitle;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
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

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", userId=" + userId +
                ", replyType=" + replyType +
                ", replyTitle='" + replyTitle + '\'' +
                ", replyContent='" + replyContent + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", deleteTime=" + deleteTime +
                ", isDel=" + isDel +
                '}';
    }
}

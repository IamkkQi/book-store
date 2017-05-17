<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/4/22
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户详情</title>
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">用户详情</div>
    </section>

    <section class="content">
        <div class="basic-content">
            <%-- 基本信息 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span class="">基本信息</span>
                    <a href="#" class="b-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>用户名：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.userName}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>昵称：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.nickName}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>性别：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>
                            <c:if test="${u.gender == 0}">未知</c:if>
                            <c:if test="${u.gender == 1}">男</c:if>
                            <c:if test="${u.gender == 2}">女</c:if>
                        </span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>出生日期：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${u.birthDate}" pattern="yyyy-MM-dd"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>身份证号：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.idCard}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>籍贯：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.address}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>民族：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.nation}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>职业：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.occupation}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>邮箱：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.email}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>更新时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${u.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>注册时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${u.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                </div>
                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span></span>
                    </div>
                    <div class="basic-info-right">
                        <span></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span></span>
                    </div>
                    <div class="basic-info-right">
                        <span></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span></span>
                    </div>
                    <div class="basic-info-right">
                        <span></span>
                    </div>
                </div>
            </div>

            <%-- 账户信息 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span>账户信息</span>
                    <a href="#" class="a-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>手机号：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.tel}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>账户状态：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>
                            <c:if test="${u.status == 0}">禁用</c:if>
                            <c:if test="${u.status == 1}">正常</c:if>
                        </span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <ul class="basic-info-img">
                        <li><img src="/static/img/001-bg.jpg"/></li>
                        <li class="add-img">
                            <label for="addImg" class="icon-img"><i class="fa fa-plus"></i></label>
                            <input multiple="multiple" class="input-img" type="file" name="" id="addImg" value="" onchange="" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</body>
<jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
<script type="text/javascript">
    
    $(function () {
        initImgSize();
    });


    // 初始化图片大小方法
    function initImgSize() {
        var h, w, h1, w1, s;
        $(".basic-info-img li img").each(function() {
            h = $(this).height();
            w = $(this).width();
            if(h > w) {
                s = h;
                $(this).width(80);
                h1 = $(this).height();
                $(this).css("marginTop", (80 - h1) / 2);
            } else {
                s = w;
                $(this).height(80);
                w1 = $(this).width();
                $(this).css("marginLeft", (80 - w1) / 2);
            }
        });
    }
</script>
</html>

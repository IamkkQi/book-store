<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/30
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>我的订单</title>
    <jsp:include page="${bsw}/WEB-INF/bs/include/css.jsp"/>
    <jsp:include page="${bsw}/WEB-INF/bs/include/javascript.jsp"/>
</head>
<style type="text/css">
    .navbar-nav>li>a {
        padding-top:8px;
        padding-bottom: 8px;
    }
    .navbar {
        min-height: 36px;
    }
    .table {
        width: 100%;
        max-width: 100%;
        margin-bottom: 0px;
    }
    .table>tbody>tr>td, .table>thead>tr>th {
        border: 0px;
        padding: 8px;
        line-height: 1.42857143;
        width: 120px;
        text-align: center;
    }

</style>
<body>
    <form action="${bsw}/bs/cart/myOrder" method="post" id="oForm"></form>
    <nav class="navbar navbar-default navbar-static-top"  role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right" >
                    <c:choose>
                        <c:when test="${not empty user}">
                            <li><a href="#">${user.userName}</a></li>
                            <li><a href="${bsw}/bs/cart/myCart" target="_self"><i class="fa fa-shopping-cart"></i> 购物车</a></li>
                            <li><a href="${bsw}/bs/cart/myOrder" target="_blank">我的订单</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${bsw}/bs/loginUI">登录</a></li>
                            <li><a href="#">注册</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <div style="margin-top: 0px">
        <div class="container">
            <h1 class="title" style="margin-left: -15px;">我的订单</h1>
            <div class="row">
                <div class="col-md-11" style="border:thin solid #ddd;padding: 0px;border-bottom: 0px;background-color: #f1f5f8;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width: 120px;">&nbsp;</th>
                                <th style="width: 240px;">商品信息</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>实付款</th>
                                <th>交易状态</th>
                                <th style="width: 60px;"></th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 10px;">
        <div class="container">
            <div class="row">
                <div class="col-md-11" style="padding: 5px;">
                    <jsp:include page="/WEB-INF/bs/include/fenye.jsp"/>
                </div>
            </div>
        </div>
    </div>

    <c:forEach items="${pageBean.recordList}" var="order">
        <div style="margin-top: 10px">
            <div class="container">
                <div class="row">
                    <div class="col-md-11" style="border:thin solid #ddd;padding: 0px;">
                        <table class="table">
                            <tbody style="background-color: #f1f5f8;">
                                <tr>
                                    <td style="width: 120px;">
                                        <span style="padding-left: 10px;font-weight: 700"><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd"/></span>
                                    </td>
                                    <td style="width: 240px;"><span>订单号：</span><span>${order.orderNum}</span></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td style="text-align: right; width: 60px;"><a href="${bsw}/bs/cart/delOrder/${order.id}" style="margin-right: 20px;" class="fa fa-trash-o" data-oid="${order.id}"></a></td>
                                </tr>
                            </tbody>
                            <tbody>
                            <c:forEach items="${order.books}" var="b" varStatus="i">
                                <tr>
                                    <td style="width: 120px;">
                                        <img src="${b.imgUrl}" width="100px" height="100px">
                                    </td>
                                    <td style="width: 240px;">${b.bookName}</td>
                                    <td>￥${b.bookPrice}</td>
                                    <td style="border-right: 1px solid #ddd;">${b.num}</td>
                                    <c:choose>
                                        <c:when test="${order.rows == i.index + 1 and order.rows != 1}">
                                            <td rowspan="${order.rows}" style="border-right: 1px solid #ddd;"></td>
                                        </c:when>
                                        <c:otherwise><td style="border-right: 1px solid #ddd;"><c:if test="${i.index == 0}">${order.totalPrice}</c:if></td></c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${order.rows == i.index + 1 and order.rows != 1}}">
                                            <td rowspan="${order.rows}" style="border-right: 1px solid #ddd;"></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style="border-right: 1px solid #ddd;">
                                                <c:if test="${i.index == 0 and order.status == 1}">已完成</c:if>
                                                <c:if test="${i.index == 0 and order.status == 0}">未完成</c:if>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td style="width: 60px;"></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div style="margin-top: 10px;">
        <div class="container">
            <div class="row">
                <div class="col-md-11" style="padding: 5px;">
                    <jsp:include page="/WEB-INF/bs/include/fenye.jsp"/>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 80px;"></div>
    <footer class="footer navbar-fixed-bottom">
        <div class="container">
            <p>Book | 关于 | 联系 | 亓凯凯 @2017.05.31</p>
        </div>
    </footer>
</body>
<script type="text/javascript">

</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/30
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>生成订单</title>
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
</style>
<body>
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
            <h1 class="title" style="margin-left: -15px;">订单信息</h1>
            <div class="row">
                <div class="col-md-8" style="border:thin solid #ddd;padding: 0px;border-bottom: 0px;">
                    <div class="basic-info-content">
                        <div class="basic-info-left">
                            <span>商品名称：</span>
                        </div>
                        <div class="basic-info-right">
                            <c:forEach items="${settInfos}" var="sett">
                                <span>${sett.bookName}</span>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="basic-info-content">
                        <div class="basic-info-left">
                            <span>交易金额：</span>
                        </div>
                        <div class="basic-info-right">
                            <span>${order.totalPrice}</span>
                        </div>
                    </div>

                    <div class="basic-info-content">
                        <div class="basic-info-left">
                            <span>购买时间：</span>
                        </div>
                        <div class="basic-info-right">
                            <span><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        </div>
                    </div>

                    <div class="basic-info-content">
                        <div class="basic-info-left">
                            <span>送货地址：</span>
                        </div>
                        <div class="basic-info-right">
                            <span>${order.receivingAddress}</span>
                        </div>
                    </div>

                    <div class="basic-info-content">
                        <div class="basic-info-left">
                            <span>交易号：</span>
                        </div>
                        <div class="basic-info-right">
                            <span>${order.orderNum}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: -1px;">
        <div class="container">
            <div class="row">
                <div class="col-md-8" style="border:thin solid #ddd;padding: 5px;background-color: #f1f5f8;">
                    <div class="col-md-4">
                        <a href="javascript:void(0);" class="btn_blue" id="btn_cancel">取消订单</a>
                    </div>
                    <div class="col-md-8" style="text-align: right;">
                        <a href="${bsw}/bs/cart/completeOrder?oid=${order.id}&status=1" class="btn_blue" id="btn_submit">已完成支付</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 取消订单 --%>
    <div class="modal fade" id="AModal" tabindex="-1" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 20%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel">取消订单</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${bsw}/bs/cart/cancelOrder" method="post" id="AForm">
                        <input type="hidden" name="oid" value="${order.id}">
                        <input type="hidden" name="status" value="1">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">取消原因:</label>
                            <div class="col-sm-8">
                                <textarea name="description" class="form-control"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="A-btn">确定</button>
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
    $("#btn_cancel").click(function () {
        $("#AModal").modal('show');
    });
    $("#A-btn").click(function () {
        $("#AForm").submit();
    });
</script>
</html>

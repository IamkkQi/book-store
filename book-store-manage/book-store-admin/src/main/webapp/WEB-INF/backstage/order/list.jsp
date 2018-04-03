<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/31
  Time: 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>订单列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
</head>
<body>
<section class="content-header">
    <div class="paper-title">订单列表</div>
    <form action="${backstage}/admin/order/list" method="post" id="oForm">
        <input type="hidden" name="keys" id="keys" value="${keys}">
    </form>
    <div style="float: right; width: 10%;">
        <div class="input-group col-md-12" style="margin-bottom:10px; position: relative;float: right;">
            <select class="form-control" id="time_search">
                <option value="">时间筛选</option>
                <option value="week" <c:if test="${keys == 'week'}">selected</c:if>>最近一周</option>
                <option value="month" <c:if test="${keys == 'month'}">selected</c:if>>最近三月</option>
                <option value="year" <c:if test="${keys == 'year'}">selected</c:if>>最近一年</option>
            </select>
        </div>
    </div>
</section>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-info">
                <div class="box-header">
                    <%-- <h3 class="box-title">Data Table With Full Features</h3>--%>
                </div>
                <div class="box-body">
                    <table id="userTable" class="table table-bordered table-hover table-center">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>订单号</th>
                            <th>用户</th>
                            <th>订单量</th>
                            <th>配送方式</th>
                            <th>支付方式</th>
                            <th>收件人姓名</th>
                            <th>收件人电话</th>
                            <th>收件人地址</th>
                            <th>总金额</th>
                            <th>订单状态</th>
                            <th>购买时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageBean.recordList}" var="o" varStatus="i">
                            <tr>
                                <td>${i.index + 1}</td>
                                <td>${o.orderNum}</td>
                                <td></td>
                                <td>${o.orderMount}</td>
                                <td>
                                    <c:if test="${o.postType == 1}">送货上门</c:if>
                                    <c:if test="${o.postType == 2}">自提</c:if>
                                </td>
                                <td>
                                    <c:if test="${o.payType == 1}">支付宝支付</c:if>
                                    <c:if test="${o.payType == 2}">微信支付</c:if>
                                    <c:if test="${o.payType == 3}">货到付款</c:if>
                                </td>
                                <td>${o.receivingName}</td>
                                <td>${o.receivingTel}</td>
                                <td>${o.receivingAddress}</td>
                                <td>${o.totalPrice}</td>
                                <td>
                                    <c:if test="${o.status == 0}">已完成</c:if>
                                    <c:if test="${o.status == 1}">已取消</c:if>
                                </td>
                                <td><fmt:formatDate value="${o.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>
                                    <a href="javascript:void(0);" data-oid="${o.id}" class="deleteOrder">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="13">
                                <div class="td-right">
                                    <jsp:include page="/WEB-INF/backstage/include/fenye.jsp"/>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除订单 --%>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="deleteModalLabel">删除订单</h4>
                </div>
                <div class="modal-body">
                    你确定要删除此订单吗？
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="orderId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="orderDel-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

</section>
</body>
<script type="text/javascript">
    $("#time_search").change(function () {
       $("#keys").val($(this).val());
       $("#oForm").submit();
    });

    // 删除订单
    $(".deleteOrder").click(function () {
        $("#deleteModal").find('.orderId').val($(this).data('oid'));
        $("#deleteModal").modal('show');
    });
    $("#orderDel-btn").click(function () {
        $("#deleteModal").modal('hide');
        location.href = "${backstage}/admin/order/delOrder/" + $(this).prev().prev().val();
    });
</script>
</html>

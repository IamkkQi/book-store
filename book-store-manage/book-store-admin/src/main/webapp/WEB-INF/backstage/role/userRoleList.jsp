<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/22
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户角色列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
    <link href="${backstage}/static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<section class="content-header">
    <div class="paper-title">用户角色列表</div>
    <form action="${backstage}/admin/role/userWithRole" method="post" id="urForm">
        <input type="hidden" name="keys" id="keys" value="${keys}">
        <input type="hidden" name="rid" id="rid" value="${rid}">
    </form>
    <div style="float: right">
        <div class="input-group col-md-3" style="margin-bottom:10px; position: relative;float: right;">
            <input type="text" class="form-control" placeholder="角色名称" />
            <span class="input-group-btn">
                <button class="btn btn-info" id="sea-btn">搜索</button>
            </span>
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
                            <th>用户名</th>
                            <th>手机号</th>
                            <th>角色</th>
                            <th>添加角色时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageBean.recordList}" var="ur" varStatus="i">
                            <tr>
                                <td>${i.index + 1}</td>
                                <td>${ur.userName}</td>
                                <td>${ur.tel}</td>
                                <td>${ur.roleName}</td>
                                <td><fmt:formatDate value="${ur.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>
                                    <a href="javascript:;" data-rid="${ur.roleId}" data-uid="${ur.userId}" class="deleteUserRole">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="6">
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

    <%-- 删除角色 --%>
    <div class="modal fade" id="AModal" tabindex="-1" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 20%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel">删除用户角色</h4>
                </div>
                <div class="modal-body">
                    你确定要删除此用户角色吗？
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="roleId">
                    <input type="hidden" value="" class="userId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="A-btn">确定</button>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    // 搜索
    $("#sea-btn").click(function () {
        $("#keys").val($(this).parent().prev().val());
        $("#urForm").submit();
    });

    // 删除用户
    $(".deleteUserRole").click(function () {
        $("#AModal").find('.roleId').val($(this).data("rid"));
        $("#AModal").find('.userId').val($(this).data("uid"));
        $("#AModal").modal('show');
    });

    // 删除用户弹窗
    $("#A-btn").click(function () {
        var userId = $(this).prev().prev().val();
        var roleId = $(this).prev().prev().prev().val();
        location.href = "${backstage}/admin/role/deleteUserRole?userId=" + userId + "&roleId=" + roleId;
    });
</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/4/19
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">

</head>
<body>
    <section class="content-header">
        <h1>
            用户列表
            <small>user list</small>
        </h1>
        <form action="${backstage}/admin/user/list" method="post" id="uForm">
            <input type="hidden" name="keys" id="keys">
        </form>
        <div style="float: right">
            <button class="btn btn-info btn-search" data-toggle="modal" data-target="#myModal" style="margin-left:10px; float: right;">添加用户</button>
            <div class="input-group col-md-3" style="margin-bottom:10px; position: relative;float: right;">
                <input type="text" class="form-control" placeholder="请输入字段名" />
                <span class="input-group-btn">
                    <button class="btn btn-info btn-search" id="sea-btn">搜索</button>
                </span>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                       <%-- <h3 class="box-title">Data Table With Full Features</h3>--%>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="userTable" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>昵称</th>
                                    <th>手机号</th>
                                    <th>性别</th>
                                    <th>出生日期</th>
                                    <th>邮箱</th>
                                    <th>籍贯</th>
                                    <th>注册时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pageBean.recordList}" var="user">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.userName}</td>
                                        <td>${user.nickName}</td>
                                        <td>${user.tel}</td>
                                        <td>
                                            <c:if test="${user.gender == 0}">未知</c:if>
                                            <c:if test="${user.gender == 1}">男</c:if>
                                            <c:if test="${user.gender == 2}">女</c:if>
                                        </td>
                                        <td><fmt:formatDate value="${user.birthDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                        <td>${user.email}</td>
                                        <td>${user.address}</td>
                                        <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                        <td>
                                            <c:if test="${user.status == 1}">正常</c:if>
                                            <c:if test="${user.status == 0}">禁用</c:if>
                                        </td>
                                        <td><a href="#" data-uid="${user.id}">详情</a> |
                                            <c:if test="${user.status == 0}">
                                                <a href="javascript:;" data-uid="${user.id}" data-status="1" class="disUser">解禁</a>
                                            </c:if>
                                            <c:if test="${user.status == 1}">
                                                <a href="javascript:;" data-uid="${user.id}" data-status="0" class="disUser">禁用</a>
                                            </c:if>
                                             |
                                            <a href="javascript:;" data-uid="${user.id}" class="deleteUser">删除</a></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="12">
                                        <div class="td-right">
                                            <jsp:include page="/WEB-INF/backstage/include/fenye.jsp"/>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->

    <!-- 添加用户 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="/admin/user/saveUser" method="post" id="addForm">
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">用户名:</label>

                            <div class="col-sm-10">
                                <input type="text" name="userName" class="form-control" id="userName" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nickName" class="col-sm-2 control-label">昵称:</label>

                            <div class="col-sm-10">
                                <input type="text" name="nickName" class="form-control" id="nickName" placeholder="请输入昵称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-sm-2 control-label">手机号:</label>

                            <div class="col-sm-10">
                                <input type="text" name="tel" class="form-control" id="tel" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别:</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="gender">
                                    <option value="">请选择</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                        </div>

                        <%--<div class="form-group">
                            <label class="col-sm-2 control-label">添加时间:</label>

                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" readonly name="createTime" class="form-control pull-right form_date-createTime">
                                </div>
                            </div>
                        </div>--%>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">出生日期:</label>

                            <div class="col-sm-10">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" readonly name="birthDateStr" class="form-control pull-right form_date-birthDate">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱:</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input type="email" name="email" class="form-control" placeholder="Email">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">地址:</label>
                            <div class="col-sm-10" data-toggle="distpicker" id="address" data-placeholder="true">
                                <div class="col-sm-6" style="float: left">
                                    <select name="address" class="form-control"></select>
                                </div>
                                <div class="col-sm-6" style="float: left">
                                    <select name="address" class="form-control"></select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="userAdd-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除用户 --%>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="deleteModalLabel">删除用户</h4>
                </div>
                <div class="modal-body">
                    你确定要删除此用户吗？
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="userId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="userDel-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 禁用用户 --%>
    <div class="modal fade" id="disModal" tabindex="-1" role="dialog" aria-labelledby="disModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="disModalLabel">禁用用户</h4>
                </div>
                <div class="modal-body">
                    你确定要禁用此用户吗？
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="userId">
                    <input type="hidden" value="" class="userStatus">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="userDis-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

</body>
<jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
<script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script src="${backstage}/static/distpicker/dist/distpicker.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#sea-btn").click(function () {
        $("#keys").val($(this).parent().prev().val());
        $("#uForm").submit();
    });

    /*$('.form_date-createTime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 0,
        forceParse: 0
    });*/

    $('.form_date-birthDate').datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        minView:'month',
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0
    });

    $("#userAdd-btn").click(function () {
       $("#addForm").submit();
    });

    $(function () {
        $('#address').distpicker();
    })

    /* 删除用户 */
    $(".deleteUser").click(function () {
        $("#deleteModal").find('.userId').val($(this).data('uid'));
        $("#deleteModal").modal('show');
    });
    /* 删除用户弹窗 */
    $("#userDel-btn").click(function () {
        $("#deleteModal").modal('hide');
        location.href = "${backstage}/admin/user/deleteUser/" + $(this).prev().prev().val();
    });

    /* 禁用用户 */
    $('.disUser').click(function () {
        $('#disModal').find('.userId').val($(this).data('uid'));
        $('#disModal').find('.userStatus').val($(this).data('status'));
        $('#disModal').modal('show');
    });
    $('#userDis-btn').click(function () {
        $("#disModal").modal('hide');
        location.href = "${backstage}/admin/user/disUser?userId=" + $(this).parent().find('.userId').val() + "&status=" + $(this).parent().find('.userStatus').val();
    });
</script>
</html>

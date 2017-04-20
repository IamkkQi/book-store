<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/4/19
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<html>
<head>
    <title>用户列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
</head>
<body>
    <section class="content-header">
        <h1>
            用户列表
            <small>user list</small>
        </h1>

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
                        <table id="example1" class="table table-bordered table-striped">
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
                                        <td><a href="#">详情</a></td>
                                    </tr>
                                </c:forEach>
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

</body>
<script src="${backstage}/static/adminLTE-2.3.11/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${backstage}/static/adminLTE-2.3.11//plugins/datatables/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</html>

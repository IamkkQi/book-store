<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/24
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>日志列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
    <script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">日志列表</div>
        <form action="${backstage}/admin/log/list" method="post" id="lForm">
        </form>
        <div style="float: right">
        </div>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-info">
                    <div class="box-header">
                        <h3 class="box-title">日志列表</h3>
                    </div>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-bordered table-hover ctable">
                            <tr>
                                <th>序号</th>
                                <th>用户Id</th>
                                <th>用户名</th>
                                <th>手机号</th>
                                <th>操作类型</th>
                                <th>事件内容</th>
                                <th>事件结果</th>
                                <th>操作人IP</th>
                                <th>操作时间</th>
                            </tr>
                            <c:forEach items="${pageBean.recordList }" var="log" varStatus="i">
                                <tr>
                                    <td>${i.index + 1}</td>
                                    <td>${log.userId}</td>
                                    <td>${log.userName}</td>
                                    <td>${log.userTel}</td>
                                    <td>${log.type}</td>
                                    <td>${log.content}</td>
                                    <td>${log.result}</td>
                                    <td>${log.ip}</td>
                                    <td><fmt:formatDate value="${log.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="9">
                                    <div class="td-right">
                                        <jsp:include page="/WEB-INF/backstage/include/fenye.jsp"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>

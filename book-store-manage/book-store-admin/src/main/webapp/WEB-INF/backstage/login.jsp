<%--
  Created by IntelliJ IDEA.
  User: qkk
  Date: 2017/4/13
  Time: 17:44
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${backstage}/static/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-md-4 form-login">
                <form class="form-signin" action="/admin/login" method="post" id="uForm">
                    <h2 class="form-signin-heading">书林网后台管理系统</h2>
                    <label for="tel" class="sr-only">用户名</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i></span>
                        <input type="text" maxlength="11" value="${tel}" name="tel" id="tel" class="form-control input-lg" placeholder="手机号" required autofocus>
                    </div>

                    <label for="password" class="sr-only">密码</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key fa-lg fa-fw" aria-hidden="true"></i></span>
                        <input type="password" name="password" id="password" class="form-control input-lg" placeholder="密码" required>
                    </div>
                    <input type="hidden" name="isRTel" id="isRTelH">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="isRTel">记住我
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="button" id="btn-login">登录</button>
                </form>
            </div>
        </div>
    </div>
</body>
<jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        // 判断手机号是否存在
        if ("${tel}" != "") {
            $("#isRTel").prop('checked', true);
            $("#isRTelH").val(1);
        }
        // 清空密码
        $("#password").val('');

        var login_err = 1; // 登录错误次数
        $("#btn-login").click(function(){
            if(login_err >= 3) {
                // 登录错误失败大于3次，验证码显示
                $.get('${backstage}/admin/login/setVerifyCode', {}, function (data) {
                    alert(data);
                });

            }
            // 记住账户复选框
            if($("#isRTel").prop('checked')) {
                $('#isRTelH').val(1);
            } else {
                $('#isRTelH').val(0);
            }

            // 验证用户名和密码
            $.post('${backstage}/admin/confirmUser', {"tel" : $.trim($("#tel").val()), "password" : $.trim($("#password").val())}, function (data) {
                if (data == "yes") {
                    $("#uForm").submit();
                } else {
                    // 登录错误加1
                    login_err = login_err + 1;
                }
            });
        });

        // 绑定键盘按下事件
        $(document).keypress(function(e) {
            // 回车键事件
            if(e.which == 13) {
                $("#btn-login").click();
            }
        });
    });
</script>
</html>

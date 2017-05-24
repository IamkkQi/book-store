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
    <link href="${backstage}/static/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="login-err-msg"></div>
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-md-4 form-login">
                <form action="${backstage}/admin/login" method="post" id="uForm">
                    <div class="login-header-h1">
                        <h1>书林网后台管理系统</h1>
                    </div>

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
                    <div class="input-group" style="display: none" id="login-codeImg">
                        <input type="text" class="form-control input-lg input-code" style="width: 225px;" value="" placeholder="请输入验证码">
                        <span class="login-codeImg" style="cursor:pointer;"><img src="" alt="" id="codeImg"></span>
                    </div>
                    <input type="hidden" name="isRTel" id="isRTelH">
                    <input type="hidden" name="" class="code">
                    <div class="checkbox remember">
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

        //	验证手机号
        var regTel = /^[1][345678][0-9]{9}$/;
        $("#tel").blur(function () {
            if (regTel.test($("#tel").val())) {
                $(".login-err-msg").css("visibility","hidden");
            } else{
                $(".login-err-msg").text("账号格式有误，请重新输入。");
                $(".login-err-msg").css("visibility","visible");
            }
        })

        // 清空密码
        $("#password").val('');

        var login_err = 1; // 登录错误次数
        $("#btn-login").click(function(){
            // 如果验证码可见,判断验证码是否正确
            if ($("#login-codeImg").is(':visible') && $('.input-code').val().toUpperCase() != $('.code').val().toUpperCase()) {
                $(".login-err-msg").text("验证码错误");
                $(".login-err-msg").css("visibility","visible");
                getVerifyCode();
                return;
            }

            if(login_err >= 3) {
                // 登录错误失败大于3次，验证码显示
                $("#login-codeImg").show();
                getVerifyCode();

            }
            // 记住账户复选框
            if($("#isRTel").prop('checked')) {
                $('#isRTelH').val(1);
            } else {
                $('#isRTelH').val(0);
            }

            // 验证用户名和密码
            $.post('${backstage}/admin/confirmUser', {"tel" : $.trim($("#tel").val()), "password" : $.trim($("#password").val())}, function (data) {
                if (data.valid == true) {
                    $("#login-codeImg").hide();
                    $(".login-err-msg").css("visibility","hidden")
                    $("#uForm").submit();
                } else {
                    $(".login-err-msg").text("用户名或密码错误");
                    $(".login-err-msg").css("visibility","visible");
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

        // 点击验证码更换
        $('.login-codeImg').click(function () {
            getVerifyCode();
        });

        // 获取验证码
        function getVerifyCode() {
            $.get('${backstage}/admin/login/setVerifyCode', {}, function (data) {
                $(".code").val(data);
                $("#codeImg").prop("src", '${backstage}/admin/login/getVerifyCode?code=' + data + '&width=135&height=46')
                $(".input-code").val('');
            });
        }
    });
</script>
</html>

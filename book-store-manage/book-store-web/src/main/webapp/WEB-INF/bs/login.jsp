<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录</title>
	<jsp:include page="${bsw}/WEB-INF/bs/include/css.jsp"/>
	<jsp:include page="${bsw}/WEB-INF/bs/include/javascript.jsp"/>
	<link href="${bsw}/static/css/login.css" rel="stylesheet" type="text/css">
    
	<style type="text/css">

	</style>
</head>

<body>
	<div class="login-err-msg"></div>
	<div class="login-block" >
		<h2>登录</h2>
		<form class="form-horizontal" action="${bsw}/bs/login" method="post" id="uForm">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="tel">用户名</label>
				<div class="col-sm-9">
					<input type="text" maxlength="11" class="form-control" name="tel" id="tel" value="${tel}" placeholder="请输入名字">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-3 control-label" >密码</label>
				<div class="col-sm-9">
					<input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
				</div>
			</div>
			<div class="input-group" style="display: none;" id="login-codeImg">
				<input type="text" class="form-control input-code" style="width: 177px;" value="" placeholder="请输入验证码">
				<span class="login-codeImg" style="cursor:pointer;margin-left: 10px;"><img src="" alt="" id="codeImg"></span>
			</div>
			<input type="hidden" name="isRTel" id="isRTelH">
			<input type="hidden" name="" class="code">
			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" id="isRTel">记住账户
						</label>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-primary btn-block btn-lg" id="btn-login" style="margin-bottom: 10px;">登录</button>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<p><a href="#" >注册</a></p>
				</div>
				<div class="col-sm-6">
					<p><a href="#">忘记密码？</a></p>
				</div>
			</div>
		</form>
	</div>
</body>
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
            $.post('${bsw}/bs/confirmUser', {"tel" : $.trim($("#tel").val()), "password" : $.trim($("#password").val())}, function (data) {
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
            $.get('${bsw}/bs/login/setVerifyCode', {}, function (data) {
                $(".code").val(data);
                $("#codeImg").prop("src", '${bsw}/bs/login/getVerifyCode?code=' + data + '&width=122&height=34')
                $(".input-code").val('');
            });
        }
    });

</script>
</html>

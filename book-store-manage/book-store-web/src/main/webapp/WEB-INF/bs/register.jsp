<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>注册</title>
	<jsp:include page="${bsw}/WEB-INF/bs/include/css.jsp"/>
	<jsp:include page="${bsw}/WEB-INF/bs/include/javascript.jsp"/>
	<link href="${bsw}/static/bootstrap-validator/dist/css/bootstrapValidator.min.css" rel="stylesheet" type="text/css">
	<script src="${backstage}/static/bootstrap-validator/dist/js/bootstrapValidator.min.js" type="text/javascript"></script>
	<style type="text/css">
	.bBlock {
		height: 70%;
		width: 25%;
		padding: 40px;
		margin: 10% 0 0 40%;
		background-color: #dcdcf0;
		float: none;  /*div居中*/
		display: block;
		box-shadow:3px 0 3px #64508c; /*右边阴影*/
		box-shadow:0 -3px 3px #64508c; /*顶部阴影*/
		box-shadow:0 3px 3px #64508c; /*底边阴影*/
		box-shadow: 0 0 10px 5px #78a0dc;
	}
	body {
		background-color: #f0f0f0;
	}
</style>
</head>
<body>

<div class="bBlock">
	<h4 class="header green lighter bigger">
		<i class="ace-icon fa fa-users blue"></i>用户注册
	</h4>
	<hr align="center" size="7" color="#787878">
    <form class="form-horizontal" action="${bsw}/bs/user/register" method="post" role="form" id="regForm">
		<div class="form-group">
			<label class="control-label" for="tel" >手机号</label>
			<input type="text" name="tel" class="form-control" id="tel" placeholder="请输入手机号">
		</div>
		<div class="form-group">
			<label for="password" class="control-label" >密码</label>
			<input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
		</div>
		<div class="form-group">
			<label for="rePassword" class="control-label" >确认密码</label>
			<input type="password" name="rePassword" class="form-control" id="rePassword" placeholder="确认密码" />
		</div>
		<div class="form-group">
			<div class=" col-sm-4">
				<button class="btn btn-info btn-block btn-sm" type="reset" style="width:90px;color:#fff;">重置</button>
			</div>
			<div class="col-sm-8">
				<button class="btn btn-primary btn-block btn-sm" type="submit" style="width:170px;color:#fff;">注册</button>
			</div>
		</div>
	
		<div class="toolbar center">
			<a href="${bsw}/bs/loginUI">
				返回登录
			</a>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
	$(function () {
		$("#regForm").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                tel: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '角色名称不能为空'
                        },

                        remote: {
                            url:"${bsw}/bs/user/unique",
                            message: "手机号已存在",
                            delay: 1000, // 每一秒发送一次
                            type: "POST",
                            dataType: 'json',
                            data: function() {
                                return {
                                    tel: $("#tel").val(),
                                };
                            }
                        }
                    }
                },

                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
							/*长度提示*/
                            min: 6,
                            max: 30,
                            message: '密码长度必须在6到30之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码由数字字母下划线和.组成'
                        }
                    }
                },

                rePassword: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        },
                        identical: {//相同
                            field: 'password',
                            message: '两次密码不一致'
                        },
                        different: {//不能和用户名相同
                            field: 'loginName',
                            message: '不能和用户名相同'
                        },
                        regexp: {//匹配规则
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码由数字字母下划线和.组成'
                        }
                    }
                }
            }
        });

        /*$("#regForm").click(function () {
            var bootstrapValidator = $("#regForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()) {
                document.getElementById("regForm").submit();
            } else {
                return;
            }
        });*/
    });
</script>
</html>
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
                <form class="form-signin" action="/admin/login" method="post">
                    <h2 class="form-signin-heading">用户登录</h2>
                    <label for="userName" class="sr-only">用户名</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i></span>
                        <input type="text" name="userName" id="userName" class="form-control input-lg" placeholder="用户名" required autofocus>
                    </div>

                    <label for="password" class="sr-only">密码</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key fa-lg fa-fw" aria-hidden="true"></i></span>
                        <input type="password" name="password" id="password" class="form-control input-lg" placeholder="密码" required>
                    </div>
                    <input type="hidden" name="isRTel" id="">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="isRTel" value="">记住我
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
                </form>
            </div>
        </div>
    </div>
</body>
<jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
<script type="text/javascript">

</script>
</html>

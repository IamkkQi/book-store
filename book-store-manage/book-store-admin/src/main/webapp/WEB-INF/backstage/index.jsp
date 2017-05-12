<%--
  Created by IntelliJ IDEA.
  User: qkk
  Date: 2017/4/10
  Time: 17:49
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>书林网系统控制台</title>
    <%-- 告诉浏览器响应屏幕宽度 --%>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="include/css.jsp"></jsp:include>
</head>
<style type="text/css">

</style>
<body class="hold-transition skin-blue fixed sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <span class="logo-mini"><b>Book</b></span>
            <span class="logo-lg"><b>书林网</b></span>
        </a>
        <nav class="navbar navbar-static-top">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/static/adminLTE-2.3.11/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">${user.userName}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="/static/adminLTE-2.3.11/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    Alexander Pierce - Web Developer
                                    <small>Member since Nov. 2012</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </div>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>

    <!-- 左侧菜单 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <!-- 菜单列表 -->
            <ul class="sidebar-menu">
                <li class="header">主菜单</li>
                <c:forEach items="${menus}" var="menu">
                    <li class="treeview">
                        <a href="#">
                            <i class="${menu.icon}"></i>
                            <span>${menu.menuName}</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <c:forEach items="${menu.twoMenus}" var="tm">
                                <li><a href="${tm.url}" target="main-content"><i class="${tm.icon}"></i>${tm.menuName}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </section>
    </aside>

    <!-- ---------------------------------------------------------------- -->
    <div class="content-wrapper" style="height: 100%"><!-- 主内容 -->
        <section class="content">
            <iframe class="main-content" name="main-content" style="overflow:inherit;" scrolling="yes" frameborder="0" height="100%" width="100%">

            </iframe>
        </section>
    </div>

    <!-- 页脚 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.8
        </div>
        <strong>Copyright &copy; 2017-2017 <a href="#">Book-Store</a>.</strong> All rights
        reserved.
    </footer>

</div>
</body>

<jsp:include page="include/javascript.jsp"></jsp:include>
<script type="text/javascript">
    $(".main-content").height($(window).height());
</script>
</html>

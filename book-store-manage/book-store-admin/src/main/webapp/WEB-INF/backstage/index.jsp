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
    <link href="${backstage}/static/css/style.css" rel="stylesheet" type="text/css">
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                            <img src="/static/img/logo.png" class="user-image" alt="User Image">
                            <span class="hidden-xs">${user.userName}</span>
                            <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                               <a href="${backstage}/admin/login/logout"><i class="fa fa-power-off"></i>注销</a>
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

    <!-- --------------------------------主内容-------------------------------- -->
    <div class="content-wrapper" style="overflow: auto;">
        <iframe class="main-content" name="main-content" scrolling="yes" style="margin-left:0; width:100%; overflow-x:hidden;" frameborder="0" height="100%" width="100%">

        </iframe>
    </div>
</div>
</body>

<jsp:include page="include/javascript.jsp"></jsp:include>
<script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript">
    $(".main-content").height($(window).height() - 55);
</script>
</html>

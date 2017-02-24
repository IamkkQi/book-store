<%--
  Created by IntelliJ IDEA.
  User: qkk
  Date: 2017/2/24
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${bsw}/static/bootstrap-3.3.7/css/bootstrap.min.css">
    <script src="${bsw}/static/js/jquery-1.9.1.js"></script>
    <style type="text/css">
        html, body {
            width:100%;
            height:100%;
        }
        .bg {
            width: 100%;
            height: 100%;
            background: url(${bsw}/static/img/shu-010.jpg) no-repeat bottom center;
            background-size: cover;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-fixed-top my-navbar" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">首页</a>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">iOS</a></li>
                    <li><a href="#">SVN</a></li>
                    <li>
                        <a href="#">JAVA</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="bg"></div>
</body>
</html>

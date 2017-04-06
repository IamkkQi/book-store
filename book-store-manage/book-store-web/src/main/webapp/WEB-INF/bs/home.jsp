<%--
  Created by IntelliJ IDEA.
  User: qkk
  Date: 2017/2/24
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <link href="/static/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>

    <div class="search">
        <i></i>
        <div class="s-bar">
            <form>
                <input type="text" value="Search Template" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search Template';}">
                <input type="submit"  value="Search"/>
            </form>
        </div>


    </div>
    <div class="copyright">
        <p>2017 &copy Book Store | Author  <a href="#" target="_blank">  Kay </a></p>
    </div>
</body>
</html>

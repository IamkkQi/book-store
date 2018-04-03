<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>书林网购书系统</title>
	<jsp:include page="${bsw}/WEB-INF/bs/include/css.jsp"/>
	<jsp:include page="${bsw}/WEB-INF/bs/include/javascript.jsp"/>

	<style type="text/css">
		.navbar-nav>li>a {
			padding-top:8px;
			padding-bottom: 8px;
		}
		.navbar {
			min-height: 36px;
		}
		.input-group {
			margin-top: 25px;
		}
		.col {
			padding: 5px;
		}
		.list {
			position: absolute;
			top: 32%;
			left: 20%;
			width: 50%;
			height: 30%;
		}

		.list a {
			color:#a064b4;
			font-weight:800;
		}

		.navigation {
			border-bottom:2px solid #5050ff;
		}

	</style>
</head>
<body>

	<nav class="navbar navbar-default navbar-static-top"  role="navigation">
		<div class="container">
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav navbar-right" >
					<c:choose>
						<c:when test="${not empty user}">
							<li><a href="#">${user.userName}</a></li>
							<li><a href="${bsw}/bs/cart/myCart" target="_blank"><i class="fa fa-shopping-cart"></i> 购物车</a></li>
							<li><a href="${bsw}/bs/cart/myOrder" target="_blank">我的订单</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${bsw}/bs/loginUI">登录</a></li>
							<li><a href="${bsw}/bs/registerUI">注册</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

<div class="find">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col">
				<div class="logo">
					<img src="/static/img/8.jpg" class="img-rounded" style="width:330px;height:90px" >
					<div class="center center-block">书林网</div>
				</div>
			</div>
			<div class="col-md-6 col">
				<div class="input-group">
					<form action="${bsw}/bs/book/searchBooks" target="main-content" method="post" id="searchForm">
						<input type="text" class="form-control input-lg" name="keys" id="keys" placeholder="请输入书名或作者">
					</form>
					<a class="input-group-addon btn btn-default" style="background: #3c78b4;color: #fff;" id="search_book">搜索</a>
				</div>
			</div>

			<%--<div class="col-md-2 col">
				<a href="#" class="btn btn-default btn-lg" role="button" style="background:#a0b4dc;color:#eee;margin:25px 140px;">购物车</a>
			</div>--%>
		</div>
	</div>
</div>

<div class="navigation">
	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li class="active"><a href="#">首页</a></li>
			<li class="dropdown">
				<a class="dropdown-toggle" id="shop-category" data-submenu data-toggle="dropdown" aria-expanded="true" href="#">
					商品分类<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a tabindex="0" href="${bsw}/bs/book/books" target="main-content" class="shop-category">全部分类</a></li>
					<li class="divider"></li>
					<c:forEach items="${categories}" var="c">
						<li class="dropdown-submenu"><a tabindex="0" href="#" data-cid="${c.id}">${c.categoryName}</a>
							<ul class="dropdown-menu" style="top: 0;left: 100%;margin-top: -6px;border-top-left-radius: 0;">
								<c:forEach items="${c.subCategories}" var="sub">
									<li><a href="${bsw}/bs/book/books?categoryId=${sub.id}" data-cid="${sub.id}" target="main-content" class="shop-category">${sub.categoryName}</a></li>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li><a href="${bsw}/bs/book/books" target="main-content">购物</a></li>
			<li><a href="${bsw}/bs/cart/myCart" target="_blank">购物车</a></li>
			<li><a href="${bsw}/bs/cart/myOrder" target="_blank">我的订单</a></li>
			<li><a href="#">联系</a></li>
			<li><a href="#">关于</a></li>
		</ul>
		</div>
	</div>

	<%--<div class="list">
		<img src="image/1.jpg" style="height:600px">
	</div>--%>

	<div class="book">
		<iframe class="main-content" name="main-content" scrolling="yes" style="margin-left:0; width:100%; overflow-x:hidden;" frameborder="0" height="100%" width="100%">
		</iframe>
	</div>

	<div style="margin-top: 80px;"></div>

	<footer class="footer navbar-fixed-bottom">
		<div class="container">
			<p>Book | 关于 | 联系 | 亓凯凯 @2017.05.31</p>
		</div>
	</footer>

</body>
<script type="text/javascript">
    $('[data-submenu]').submenupicker();
    $(".main-content").height($(window).height() - 55);

    $(".shop-category").click(function(){
        $("#shop-category").html($(this).text() + '<span class="caret"></span>')
	});

    $("#search_book").click(function () {
		$("#searchForm").submit();
    });
</script>
</html>
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
/*.navbar-brand {
height: 36px;
padding-top: 8px;
}*/
.navbar {
	min-height: 36px;
}
.navbar-toggle {
	margin-top: 4px;
	margin-bottom: 4px;
}
.dropdown-submenu {  
	position: relative;  
}  
.dropdown-submenu > .dropdown-menu {  
	top: 0;  
	left: 100%;  
	margin-top: -6px;  
	margin-left: -1px;  
	-webkit-border-radius: 0 6px 6px 6px;  
	-moz-border-radius: 0 6px 6px;  
	border-radius: 0 6px 6px 6px;  
}  
.dropdown-submenu:hover > .dropdown-menu {  
	display: block;  
}  
.dropdown-submenu > a:after {  
	display: block;  
	content: " ";  
	float: right;  
	width: 0;  
	height: 0;  
	border-color: transparent;  
	border-style: solid;  
	border-width: 5px 0 5px 5px;  
	border-left-color: #ccc;  
	margin-top: 5px;  
	margin-right: -10px;  
}  
.dropdown-submenu:hover > a:after {  
	border-left-color: #fff;  
}  
.dropdown-submenu.pull-left {  
	float: none;  
}  
.dropdown-submenu.pull-left > .dropdown-menu {  
	left: -100%;  
	margin-left: 10px;  
	-webkit-border-radius: 6px 0 6px 6px;  
	-moz-border-radius: 6px 0 6px 6px;  
	border-radius: 6px 0 6px 6px;  
}    
.logo .center {
	position: absolute;
	top: 17%;
	right: 30%;
	width: 50%;
	height: 30%;
	text-align: center;
	line-height: 70px;
	font-size: 30px;

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
.list {
	background: #a064b4;
	font-size:20px;
	text-align:center;
}
/*.list a {
	color:#a064b4;
	font-weight:800;
}*/
.daohang {
	margin: 20px;
	border-bottom:2px solid #5050ff;
}
.row_img {
	width: 220px;
	height: 210px;
}
.row_name {
	width: 200px;
}

</style>
</head>
<body>

	<nav class="navbar navbar-default navbar-static-top"  role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">

			<ul class="nav navbar-nav navbar-right" >
				<c:choose>
					<c:when test="${not empty user}">
						<li><a href="#">${user.userName}</a></li>
						<li><a href="${bsw}/bs/cart/myCart">我的购物车</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${bsw}/bs/loginUI">登录</a></li>
						<li><a href="#">注册</a></li>
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
					<img src="/static/img/8.jpg"  class="img-rounded" style="width:330px;height:90px" >
					<div class="center center-block">书林网</div>
				</div>
			</div>
			<div class="col-md-6 col">
				<div class="input-group">
					<input type="text" class="form-control input-lg" placeholder="请输入书名">
					<span class="input-group-addon btn btn-primary" style="background:#3c78b4;color:#fff">搜索</span>
				</div>  
			</div>

		</div>
	</div>
</div>

<div class="daohang">
	<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li class="active"><a href="#">首页</a></li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					商品分类<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li class="dropdown-submenu"> <a href="#">小说</a>  
						<ul class="dropdown-menu pull-right">  
							<li><a href="#">中国当代小说</a></li>  
							<li><a href="#">中国古典小说</a></li>  
							<li><a href="#">四大名著</a></li>  
						</ul>  
					</li>  
					<li><a href="#">文艺</a></li>
					<li><a href="#">青春</a></li>
					<li><a href="#">励志</a></li>
					<li><a href="#">童书</a></li>
					<li><a href="#">生活</a></li>
					<li><a href="#">科技</a></li>
					<li><a href="#">人文社科</a></li>
					<li><a href="#">经管</a></li>
					<li><a href="#">教育</a></li>
					<li class="divider"></li>
					<li><a href="#">分离的链接</a></li>
				</ul>
			</li>
			<li><a href="#">购物车</a></li>
			<li><a href="#">关于</a></li>
			<li><a href="#">购物</a></li>
			<li><a href="#">联系</a></li>
			<li><a href="#">结算</a></li>
		</ul>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-1 col">

			</div>

			<div  class="col-md-10 col" style="border:thin solid #ddd;">
				<table class="table">
					<thead>
					<tr>
						<th></th>
						<th>商品 </th>
						<th></th>
						<th> 价格</th>
						<th> 数量</th>
						<th> 合计</th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<label>
								<input type="checkbox">
							</label>
						</td>
						<td class="row_img">
							<a href="#" target="_blank" dd_name="查看详情">
								<img src="image/8.jpg" class="img-responsive" width="200px" height="200px"> <!-- 响应式图片 -->
							</a>
						</td>
						<td class="row_name">
							<div class="name">
								<a href="#" title="书名" target="_blank" dd_name="查看详情">书名</a>
							</div>
						</td>
						<td class="row3">￥100.01</td>
						<td class="row3">
							<input type="button" value="-" onclick="disNum(this)"/><input id="num2" value="0" type="text" style="width:30px;text-align:center"><input type="button" value="+" onclick="incNum(this)"/>
						</td>
						<td class="row4">￥100.01</td>
						<td class="row5">
									<span>
										<a href="#">收藏</a>
									</span><br>
							<span>
										<a href="#">删除</a>
									</span>
						</td>
					</tr>

					</tbody>
				</table>
				<div class="" style="padding-top:50px">
					<a href="#" class="btn btn-default  btn-block" role="button" style="background:#3ca0dc;width:140px;height:45px;color:#fff;font-size:20px">继续购物</a>
				</div>

			</div>
			<div class="col-md-1 col">

			</div>

		</div>

	</div>
	<div class="jiesuan" style="margin-top:10px">
		<div class="container">
			<div class="row">
				<div class="col-md-1 col">

				</div>
				<div class="col-md-10 col"  style="border:thin solid #ddd;">

					<div class="col-md-6 col">
						<div class="col-md-4 col">
							<label>
								<input type="checkbox">全选
							</label>
						</div>
						<div class="col-md-4 col">
							<a href="#">批量删除</a>
						</div>
						<div class="col-md-4 col">
							<p>已选择 件商品</p>
						</div>

					</div>
					<div class="col-md-6 col">
						<div class="col-md-4 col">

						</div>
						<div class="col-md-4 col">
							<p>总计：</p>
						</div>
						<div class="col-md-4 col">
							<a href="#" class="btn btn-default btn-lg" role="button"  style="background:#3c78b4;color:#fff">结算</a>
						</div>

					</div>


				</div>
				<div class="col-md-1 col">

				</div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
		function disNum(dom){
			if(parseInt($(dom).next().val()) == 0) {
				return false;
			}
			$(dom).next().val(parseInt($(dom).next().val()) - 1);
		}


		function incNum(dom){
			$(dom).prev().val(parseInt($(dom).prev().val()) + 1);
		}


	</script>
</body>
</html>
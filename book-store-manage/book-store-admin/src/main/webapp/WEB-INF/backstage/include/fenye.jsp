<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp" %>
<c:if test="${empty pageBean.recordList}">
	<div class="no-td"><span class="iconfont icon-i1"></span><span class="no-record-span">没有查询到符合条件的记录</span></div>
	<script type="text/javascript">
	$(".no-td").parent().parent().find(".td-left").remove();
	$(".no-td").parent().css("float","none");
	$(".table-tools").css({
		"textAlign":"center"
	});
	$(".table-tools").height($(".table-tools").width()/2);
	</script>
</c:if>
<c:if test="${not empty pageBean.recordList}">
	<style type="text/css">
		.center {
			float: right;
		}
		
		.clear {
			clear: both;
		}
		
		.pagination {
			display: inline-block;
			padding-left: 0;
			margin: 0 !important;
			border-radius: 4px;
		}
		
		.pagination li {
			display: inline;
		}
		
		.pagination li a {
			font-size: 12px;
			display: inline-block;
			width: 32px;
			height: 32px;
			text-align: center;
			line-height: 30px;
			text-decoration: none;
			color: #666;
			border: 1px solid #ccc;
			background-color: #f6f6f6;
			margin-left: -1px;
		}
		.pagination li a.page-first{
			width: 48px;
		}
		
		.pagination li a:hover{
			z-index: 2;
			color: #fff;
			background-color: #33b2ff;
			border-color: #33b2ff;
		}
		.pagination li a:focus,
		.pagination li a:focus{
			z-index: 2;
			color: #fff;
			background-color: #66c6ff;
			border-color: #66c6ff;
		}
		
		.pagination .active a{
			z-index: 3;
			color: #fff;
			background-color: #00a0fe;	
			border-color: #00a0fe;
			cursor: default;
		}
		.pagination .li-input input{
			width: 48px;
			height: 32px;
			border: 1px solid #ccc;
			padding: 0;
			margin-left: 40px;
			margin-right: 20px;
		}
	</style>
	<div class="center">
		<div class="pagination">
			<ul style="list-style: none; margin: 0px;">
				<li style="float: left;">
					<a class="page-first" href="javascript: gotoPage(1)">首页</a>
				</li>
				<c:if test="${pageBean.currentPage != 1}">
					<li style="float: left;">
						<a href="javascript: gotoPage(${pageBean.currentPage - 1})"><i class="glyphicon glyphicon-menu-left" style="padding-top: 8px;"></i></a>
					</li>
				</c:if>
				<c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex}" var="wp">
					<c:if test="${pageBean.currentPage == wp}">

						<li class="active" style="float: left;">
							<a href="#"><span style="color: white"><b>${wp }</b> </span> </a>
						</li>

					</c:if>
					<c:if test="${pageBean.currentPage != wp}">
						<li style="float: left;">
							<a href="javascript:gotoPage('${wp}')">${wp }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.currentPage != pageBean.endPageIndex}">
					<li style="float: left;">
						<a href="javascript: gotoPage(${pageBean.currentPage + 1})" style="cursor: hand;"><i class="glyphicon glyphicon-menu-right" style="padding-top: 8px;"></i></a>
					</li>
				</c:if>
				<li style="float: left;">
					<a class="page-first" href="javascript: gotoPage(${pageBean.pageCount})">尾页</a>
				</li>
				
				<li class="li-input" style="float: left;"><input maxNum="${pageBean.pageCount}" type="text" name="" id="toPageNum" value="" /></li>
				<li style="float: left; margin-right: 10px;" id="toPage"><a href="javascript:toPage()">GO</a></li>
			</ul>
		</div>

	</div>
	<div class="clear"></div>
	<script type="text/javascript">
		var maxNum = document.getElementById("toPageNum").getAttribute("maxNum");
		function gotoPage(pageNum) {
			$(document.forms[0]).append(
				"<input type='hidden' name='pageNum' value='" + pageNum + "'/>");
			document.forms[0].submit(); // 提交表单
		}
		
		function toPage(){
			var num = document.getElementById("toPageNum").value;
			if(num - 1 >= 0 && num - maxNum <= 0) {
				gotoPage(num)
			} else {
				alert('输入页码不合法');
			}
		}
		if (maxNum <= 1) {
			$(".pagination").remove();
			if ($(".td-left").length == 0) {
				$(".td-right").parent().remove();
			}
		}
	</script>
</c:if>
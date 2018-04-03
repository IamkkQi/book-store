<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>我的购物车</title>
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
		.col {
			padding: 5px;
		}
		.cc {
			padding: 20px 10px 10px 10px;
		}
		.cb {
			padding: 9px 10px 10px 10px;
		}
		.row_img {
			width: 220px;
			height: 210px;
		}
		.row_name {
			width: 200px;
		}
		.table>tbody>tr>td, .table>tbody>tr>th, .table>thead>tr>td, .table>thead>tr>th {
			padding: 8px;
			line-height: 1.42857143;
			vertical-align: middle;
			border-top: 1px solid #ddd;
			text-align: center;
		}
		.table {
			width: 100%;
			max-width: 100%;
			margin-bottom: 0px;
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
							<li><a href="#">注册</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-md-1 col"></div>
			<div class="col-md-10 col" style="border:thin solid #ddd;">
				<table class="table">
					<thead>
					<tr>
						<th></th>
						<th>商品</th>
						<th></th>
						<th>价格</th>
						<th>数量</th>
						<th>合计</th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${not empty cartInfos}">
						<c:forEach items="${cartInfos}" var="cart">
							<tr>
								<td>
									<label>
										<input type="checkbox" data-cid="${cart.id}" class="per_check">
									</label>
								</td>
								<td class="row_img">
									<a href="javascript:void(0);" target="_blank">
										<img src="${cart.imgUrl}" class="img-responsive" width="200px" height="200px">
									</a>
								</td>
								<td class="row_name">
									<div class="name">
										<a href="javascript:void(0);" title="书名" target="_blank">${cart.bookName}</a>
									</div>
								</td>
								<td data-bp="${cart.bookPrice}">￥${cart.bookPrice}</td>
								<td data-bid="${cart.id}">
									<input type="button" value="-" onclick="disNum(this)" style="width: 24px;"/><input id="num2"
																													   value="<c:if test="${empty cart.num}">0</c:if><c:if test="${not empty cart.num}">${cart.num}</c:if>" type="text"
																													   style="width: 36px; text-align: center;margin-left: -2px; margin-right: -2px;"><input type="button" value="+" onclick="incNum(this)" style="width: 24px;"/>
								</td>
								<td>￥${cart.totalPrice}
									<input type="hidden" value="${cart.totalPrice}" class="total_price">
								</td>
								<td>
									<span><a href="javascript:void(0);" data-cid="${cart.id}" class="deleteOne">删除</a></span>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty cartInfos}">
						<tr>
							<td colspan="7" style="text-align: center;">购物车空空如也~~</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div style="margin-top: 10px">
		<div class="container">
			<div class="row">
				<div class="col-md-1 col"></div>
				<div class="col-md-10 col" style="border:thin solid #ddd;">
					<div class="col-md-6 col">
						<div class="checkbox col-md-4 cb">
							<label>
								<input type="checkbox" class="all_check"> 全选
							</label>
						</div>
						<div class="col-md-4 cc">
							<a href="javascript:void(0);" class="batch_delete">批量删除</a>
						</div>
						<div class="col-md-4 cc">
							<p>已选择<span class="book_num red">0</span>件商品</p>
						</div>
					</div>
					<div class="col-md-6 col">
						<div class="col-md-4 cc"></div>
						<div class="col-md-4 cc">
							<p class="cartTotal">总计：<span class="red">0</span> 元</p>
						</div>
						<div class="col-md-4 col">
							<a href="javascript:void(0);" class="btn btn-primary btn-lg btn-block" target="_blank" role="button" id="cart_sett">结算</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 80px;"></div>

	<footer class="footer navbar-fixed-bottom">
		<div class="container">
			<p>Book | 关于 | 联系 | 亓凯凯 @2017.05.31</p>
		</div>
	</footer>
</body>
<script type="text/javascript">
    function disNum(dom){
        if(parseInt($(dom).next().val()) == 0) {
            return false;
        }
        $(dom).next().val(parseInt($(dom).next().val()) - 1);
        // 合计
        var total_price = $(dom).next().val() * $(dom).parent().prev().data("bp");
        $(dom).parent().next().find('.total_price').val($(dom).next().val()*  total_price);
        $(dom).parent().next().html("￥" + total_price
            + '<input type="hidden" value="'+ total_price +'" class="total_price">');
        cartTotal();
        changeNum($(dom).parent().data('bid'), $(dom).next().val());
    }
    function incNum(dom){
        $(dom).prev().val(parseInt($(dom).prev().val()) + 1);
        var total_price = $(dom).prev().val() * $(dom).parent().prev().data("bp");
        $(dom).parent().next().html("￥" + total_price
            + '<input type="hidden" value="'+ total_price +'" class="total_price">');
        cartTotal();
        changeNum($(dom).parent().data('bid'), $(dom).prev().val());
    }

    // 全选按钮
    $(".all_check").click(function() {
        if($(this).prop('checked')) {
            $(".book_num").text($(".per_check").length);
            $(".per_check").each(function(){
                $(this).prop('checked', true);
            });
        } else {
            $(".book_num").text(0);
            $(".per_check").each(function(){
                $(this).prop('checked', false);
            });
        }
        cartTotal();
    });

    // 每个选中按钮
    $(".per_check").click(function(){
        $(".book_num").text($(".per_check:checked").length);
        // 全选按钮
        if($(".per_check:checked").length == $(".per_check").length) {
            $(".all_check").prop('checked', true);
        } else {
            $(".all_check").prop('checked', false);
        }
        cartTotal();
    });

    // 总计
    function cartTotal () {
        var cartTotal = 0;
        $(".per_check:checked").parent().parent().parent().find(".total_price").each(function () {
            cartTotal += $(this).val() * 1;
        });
        $(".cartTotal span").text(cartTotal);
    }

    // 删除
    $(".deleteOne").click(function () {
        var _this = $(this);
        $.getJSON('${bsw}/bs/cart/deleteCart/' + _this.data("cid"),{},function (data) {
            if (data.flag == 'yes') {
                _this.parent().parent().parent().remove();
            } else {
                alert('删除失败');
            }
        });
        cartTotal();
    });

    // 批量删除
    $(".batch_delete").click(function(){
        var ids = '';
        var len = $(".per_check:checked").length;
        // 所有选中
        $(".per_check:checked").each(function (i) {
            if(i == len - 1) {
                ids += $(this).data("cid");
            } else {
                ids = ids + $(this).data("cid") + ",";
            }
        });
        $.getJSON('${bsw}/bs/cart/deleteBatchCart', {'ids':ids}, function (data) {
            if (data.flag == 'yes') {
                $(".per_check:checked").parent().parent().parent().remove();
                if($('.table tbody tr').length == 0) {
                    $('.table tbody').append('<tr><td colspan="7" style="text-align: center;">购物车空空如也~~</td></tr>');
                }
                cartTotal();
            } else {
                alert('删除失败');
            }
        });
    });

    // 结算
    $("#cart_sett").click(function () {
        var len = $(".per_check:checked").length;
        if(len > 0) {
            var ids = '';
            // 所有选中
            $(".per_check:checked").each(function (i) {
                if(i == len - 1) {
                    ids += $(this).data("cid");
                } else {
                    ids = ids + $(this).data("cid") + ",";
                }
            });
            window.open('${bsw}/bs/cart/settlement?ids=' + ids, '_self');
        } else {
            alert("请选择要结算的商品");
        }
    });

    function changeNum(bid, num) {
        $.getJSON("${bsw}/bs/cart/addNum", {'bid':bid,'num':num}, function(data){
            if(data.msg == "no") {
                alert("添加失败");
            }
        });
    }
</script>
</html>
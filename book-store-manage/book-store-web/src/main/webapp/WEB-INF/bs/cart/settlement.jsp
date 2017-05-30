<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/29
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>结算</title>
    <jsp:include page="${bsw}/WEB-INF/bs/include/css.jsp"/>
    <jsp:include page="${bsw}/WEB-INF/bs/include/javascript.jsp"/>
</head>
<style type="text/css">
    .navbar-nav>li>a {
        padding-top:8px;
        padding-bottom: 8px;
    }
    .navbar {
        min-height: 36px;
    }
    .table {
        width: 100%;
        max-width: 100%;
        margin-bottom: 0px;
    }
    .table>tbody>tr>td, .table>thead>tr>th {
        border: 0px;
        padding: 8px;
        line-height: 1.42857143;
        vertical-align: middle;
        text-align: center;
    }

    .form-horizontal .label-sm2 {
        position: relative;
        min-height: 1px;
        padding-right: 10px;
        padding-left: 0px;
    }
</style>
<body>
    <form action="${bsw}/bs/cart/generateOrder" method="post" id="submitOrder">
        <input type="hidden" name="raId" id="raId">
        <input type="hidden" name="postType" id="postType">
        <input type="hidden" name="payType" id="payType">
        <input type="hidden" name="totalPrice" value="${total}">
        <input type="hidden" name="orderMount" value="${bookMount}">
    </form>

    <nav class="navbar navbar-default navbar-static-top"  role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav navbar-right" >
                    <c:choose>
                        <c:when test="${not empty user}">
                            <li><a href="#">${user.userName}</a></li>
                            <li><a href="${bsw}/bs/cart/myCart" target="_self"><i class="fa fa-shopping-cart"></i> 购物车</a></li>
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

    <div class="container">
        <div class="row">
            <div id="address_div" class="address" style="display: block;">
                <h1 class="title">收货人信息</h1>
                <div class="address_list" id="address_content">
                    <ul>
                        <c:forEach items="${raList}" var="ra">
                            <li data-raid="${ra.id}" class="address address_block_li <c:if test="${ra.isDefault == 1}">active</c:if>">
                                <h1>${ra.receivingName}<span>${ra.receivingTel}</span></h1>
                                <p>${ra.province} ${ra.city} ${ra.district} </p>
                                <p>${ra.details}</p>
                                <div class="address_edit_default" style="display: none; margin-top: 2px;">
                                    <a href="javascript:void(0);" data-raid="${ra.id}" class="edit">编辑</a>
                                    <a href="javascript:void(0);" data-raid="${ra.id}" class="set_default">设为默认地址</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <p><a href="javascript:void(0);" class="address_btn" id="btn_add_address">新增收货地址<i class="fa fa-plus"></i></a></p>
            </div>
        </div>
    </div>

    <div style="margin-top: 0px">
        <div class="container">
            <h1 class="title" style="margin-left: -15px;">商品信息</h1>
            <div class="row">
                <div class="col-md-12" style="border:thin solid #ddd;padding: 0px;border-bottom: 0px;">
                    <div class="col-md-4" style="padding: 10px;">
                        <p class="" style="color:black;margin-bottom: 10px;"><span class="" style="display:none;"></span>请选择配送方式</p>
                        <div>
                            <ul class="method">
                                <li><a href="javascript:void(0);" class="current" data-pt="1">送货上门</a></li>
                                <li><a href="javascript:void(0);" data-pt="2">自提</a></li>
                            </ul>
                        </div>
                    </div>
                    <table class="table" style="border-left:thin solid #ddd;width: 66.66666667%;">
                        <thead>
                            <tr>
                                <th>&nbsp;</th>
                                <th>商品名称</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>总价</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty settInfos}">
                            <c:forEach items="${settInfos}" var="sett">
                                <tr>
                                    <td style="width: 70px;">
                                        <img src="${sett.imgUrl}" class="img-responsive" width="70px" height="70px">
                                    </td>
                                    <td style="width: 200px;">
                                        <div>
                                            <a href="javascript:void(0);" title="书名" target="_blank">${sett.bookName}</a>
                                        </div>
                                    </td>
                                    <td data-bp="${sett.bookPrice}">${sett.bookPrice}</td>
                                    <td>${sett.num}</td>
                                    <td>${sett.totalPrice}
                                        <input type="hidden" value="${sett.totalPrice}" class="total_price">
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty settInfos}">
                            <tr>
                                <td colspan="7" style="text-align: center;">购物车空空如也~~</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div style="margin-top: -1px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="border:thin solid #ddd;padding: 5px;background-color: #f1f5f8;">
                    <div class="col-md-10">
                    </div>
                    <div class="col-md-2">
                        <p>商品总计：<span class="red">${total}</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 支付方式 --%>
    <div style="margin-top: 10px;">
        <div class="container">
            <h1 class="title" style="margin-left: -15px;">支付方式</h1>
            <div class="row">
                <div class="col-md-12" style="padding-left: 0px;">
                    <ul class="payType">
                        <li><a href="javascript:void(0);" class="current" data-pt="1">支付宝支付</a></li>
                        <li><a href="javascript:void(0);" data-pt="2">微信支付</a></li>
                        <li><a href="javascript:void(0);" data-pt="3">货到付款</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-top: 10px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="border:thin solid #ddd;padding: 5px;background-color: #f1f5f8;">
                    <div class="submit_div">
                        共 <span class="red">${bookMount}</span> 件商品
                        <span class="price">应付金额：<span class="red">${total}</span></span>
                        <a class="btn_blue" id="btn_submit">提交订单</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 新增收货地址 --%>
    <div class="modal fade" id="AModal" tabindex="-1" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 20%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel">收货人信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${bsw}/bs/cart/saveRa" method="post" id="AForm">
                        <input type="hidden" name="ids" value="${ids}">
                        <div class="form-group">
                            <label for="receivingName" class="col-sm-2 control-label label-sm2">收货人:</label>
                            <div class="col-sm-4">
                                <input type="text" name="receivingName" class="form-control" id="receivingName" placeholder="请输入收货人">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="receivingTel" class="col-sm-2 control-label label-sm2">联系方式:</label>
                            <div class="col-sm-4">
                                <input type="text" name="receivingTel" class="form-control" id="receivingTel" placeholder="请输入联系方式">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在区：</label>
                            <div class="col-sm-10" data-toggle="distpicker" id="address" data-placeholder="true">
                                <select name="province" class="form-control" style="width: 31%; float: left; margin-right: 3.3%;"></select>
                                <select name="city" class="form-control" style="width: 31%; float: left; margin-right: 3.3%"></select>
                                <select name="district" class="form-control" style="width: 31%; float: left"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="details" class="col-sm-2 control-label label-sm2">详细地址:</label>
                            <div class="col-sm-10">
                                <input type="text" name="details" class="form-control" id="details" placeholder="请输入详细地址">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="zipCode" class="col-sm-2 control-label label-sm2">邮编:</label>
                            <div class="col-sm-4">
                                <input type="text" name="zipCode" class="form-control" id="zipCode" placeholder="请输入邮编">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="A-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑收获地址 --%>
    <div class="modal fade" id="BModal" role="dialog" aria-labelledby="BModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 20%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="BModalLabel">收货人信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${bsw}/bs/cart/editRa" method="post" id="BForm">
                        <input type="hidden" name="ids" value="${ids}">
                        <input type="hidden" name="id" value="" id="idB">
                        <div class="form-group">
                            <label for="receivingNameB" class="col-sm-2 control-label label-sm2">收货人:</label>
                            <div class="col-sm-4">
                                <input type="text" name="receivingName" class="form-control" id="receivingNameB" placeholder="请输入收货人">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="receivingTelB" class="col-sm-2 control-label label-sm2">联系方式:</label>
                            <div class="col-sm-4">
                                <input type="text" name="receivingTel" class="form-control" id="receivingTelB" placeholder="请输入联系方式">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所在区：</label>
                            <div class="col-sm-10" data-toggle="distpicker" id="addressB" data-placeholder="true">
                                <select name="province" id="province" class="form-control" style="width: 31%; float: left; margin-right: 3.3%;"></select>
                                <select name="city" id="city" class="form-control" style="width: 31%; float: left; margin-right: 3.3%"></select>
                                <select name="district" id="district" class="form-control" style="width: 31%; float: left"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="detailsB" class="col-sm-2 control-label label-sm2">详细地址:</label>
                            <div class="col-sm-10">
                                <input type="text" name="details" class="form-control" id="detailsB" placeholder="请输入详细地址">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="zipCodeB" class="col-sm-2 control-label label-sm2">邮编:</label>
                            <div class="col-sm-4">
                                <input type="text" name="zipCode" class="form-control" id="zipCodeB" placeholder="请输入邮编">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="B-btn">确定</button>
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
<script src="${bsw}/static/distpicker/dist/distpicker.min.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        $('#address').distpicker();

        // 收获信息弹窗
        //alert("${empty raList}");
        if("${empty raList}" == true) {
            $("#AModal").modal('show');
        }
        $("#A-btn").click(function () {
            $("#AForm").submit();
        });


        $(".address_block_li").each(function () {
            if($(this).hasClass("active")) {
                $("#raId").val($(this).data("raid"));
            }
        });
        $(".method a").each(function () {
            if($(this).hasClass("current")) {
                $("#postType").val($(this).data("pt"));
            }
        });
        $(".payType a").each(function () {
            if($(this).hasClass("current")) {
                $("#payType").val($(this).data("pt"));
            }
        });
    });

    // 鼠标经过
    $(".address_block_li").hover(function () {
        event.stopPropagation();
        $(this).find('.address_edit_default').show();
    }, function(){
        event.stopPropagation();
        $(this).find('.address_edit_default').hide();
    });

    // 选取收货地址
    $(".address_block_li").click(function () {
        $(".address_block_li").removeClass('active');
        $(this).addClass('active');
        $("#raId").val($(this).data("raid"));
    });

    // 配送方式
    $(".method a").click(function () {
        $(".method a").removeClass('current');
        $(this).addClass('current');
        $("#postType").val($(this).data("pt"));
    });

    // 支付方式
    $(".payType a").click(function () {
        $(".payType a").removeClass('current');
        $(this).addClass('current');
        $("#payType").val($(this).data("pt"));
    });

    // 新增收货地址
    $("#btn_add_address").click(function () {
        if($(".address_block_li").length >= 5) {
            alert("只能添加5个收货地址");
        } else {
            $("#AModal").modal('show');
        }
    });

    // 设为默认地址
    $(".set_default").click(function () {
        $.getJSON('${bsw}/bs/cart/setDefault', {'raId':$(this).data('raid')},function (data) {
            if(data.flag == "yes") {
                alert("设置成功");
            } else {
                alert("设置失败");
            }
        });
    });
    // 获取编辑信息
    $(".edit").click(function () {
        $.getJSON('${bsw}/bs/cart/getRAInfo/' + $(this).data('raid'),{},function (data) {
            console.log(data);
            alert(data.id);
            $("#idB").val(data.id);
            $("#receivingNameB").val(data.receivingName);
            $("#receivingTelB").val(data.receivingTel);
            $("#detailsB").val(data.details);
            $("#zipCodeB").val(data.zipCode);
            // 地址回显
            $("#province").val(data.province);
            $("#province").trigger("change");
            $("#city").val(data.city);
            $("#city").trigger("change");
            $("#district").val(data.district);
            $("#district").trigger("change");

            $("#BModal").modal('show');
        });
    });
    $("#B-btn").click(function () {
        $("#BForm").submit();
    });

    // 确定提交
    $("#btn_submit").click(function () {
        $("#submitOrder").submit();
    });

    //

</script>
</html>

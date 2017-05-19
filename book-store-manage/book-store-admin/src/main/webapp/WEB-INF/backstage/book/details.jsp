<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/19
  Time: 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>图书详情</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
    <script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">图书详情</div>
    </section>

    <section class="content">
        <div class="book-basic-content">
            <%-- 基本信息 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span class="">基本信息</span>
                    <a href="#" class="a-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>图书名称：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookName}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>作者：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookAuthor}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>编号（ISBN）：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookNumber}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>图书类别：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.categoryName}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>出版社：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookPress}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>开本：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookSize}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>图书页码：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookPages}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>定价：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><i class="fa fa-rmb"></i> ${book.bookPrice}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>市场价：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><i class="fa fa-rmb"></i> ${book.bookMarketPrice}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>会员价：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><i class="fa fa-rmb"></i> ${book.bookMarketPrice}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>出版日期：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${book.bookPubTime}" pattern="yyyy-MM-dd"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>添加时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${book.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>更新时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${book.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span></span>
                    </div>
                    <div class="basic-info-right">
                        <span></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span></span>
                    </div>
                    <div class="basic-info-right">
                        <span></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span></span>
                    </div>
                    <div class="basic-info-right">
                        <span></span>
                    </div>
                </div>
            </div>

            <%-- 库存相关 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span>库存信息</span>
                    <a href="#" class="b-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>是否上架：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>
                            <c:if test="${book.status == 0}">未上架</c:if>
                            <c:if test="${book.status == 1}">已上架</c:if>
                        </span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>库存量：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookStoreMount}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>成交量：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookDealMount}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>入库时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${book.bookStoreTime}" pattern="yyyy-MM-dd"/></span>
                    </div>
                </div>


                <div class="basic-info-content">
                    <ul class="basic-info-img">
                        <li>
                            <img src="/static/img/001-bg.jpg" />
                        </li>
                        <li class="add-img">
                            <label for="addImg" class="icon-img"><i class="fa fa-plus"></i></label>
                            <input multiple="multiple" class="input-img" type="file" name="" id="addImg" value="" onchange="" />
                        </li>
                    </ul>
                </div>
            </div>

            <%-- 简介 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span>图书简介</span>
                    <a href="#" class="c-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>简介：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookOutline}</span>
                    </div>
                </div>
            </div>

            <%-- 目录 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span>图书目录</span>
                    <a href="#" class="d-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>目录：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${book.bookCatalog}</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- 编辑基本信息 --%>
    <div class="modal fade" id="AModal" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel">编辑基本信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/book/editJBBook" method="post" id="JBForm">
                        <input type="hidden" name="id" value="${book.id}">
                        <div class="form-group">
                            <label for="bookName" class="col-sm-4 control-label">书名:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookName" class="form-control" id="bookName" value="${book.bookName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookAuthor" class="col-sm-4 control-label">作者:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookAuthor" class="form-control" id="bookAuthor" value="${book.bookAuthor}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookNumber" class="col-sm-4 control-label">编号（ISBN）:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookNumber" class="form-control" id="bookNumber" value="${book.bookNumber}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">图书类别:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="categoryId" id="category_select" style="width: 100%;">
                                    <option value="">请选择</option>
                                    <c:forEach items="${categories}" var="c">
                                        <option value="${c.id}" <c:if test="${book.categoryId == c.id}">selected</c:if>>${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookPress" class="col-sm-4 control-label">出版社:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookPress" class="form-control" id="bookPress" value="${book.bookPress}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">出版日期:</label>
                            <div class="col-sm-6">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" readonly name="bookPubTimeStr" class="form-control pull-right form_date-bookPubTime" value="<fmt:formatDate value="${book.bookPubTime}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">开本:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="bookSize">
                                    <option value="2开" <c:if test="${book.bookSize == '2开'}">selected</c:if>>2开</option>
                                    <option value="3开" <c:if test="${book.bookSize == '3开'}">selected</c:if>>3开</option>
                                    <option value="4开" <c:if test="${book.bookSize == '4开'}">selected</c:if>>4开</option>
                                    <option value="6开" <c:if test="${book.bookSize == '6开'}">selected</c:if>>6开</option>
                                    <option value="8开" <c:if test="${book.bookSize == '8开'}">selected</c:if>>8开</option>
                                    <option value="16开" <c:if test="${book.bookSize == '16开'}">selected</c:if>>16开</option>
                                    <option value="32开" <c:if test="${book.bookSize == '32开'}">selected</c:if>>32开</option>
                                    <option value="64开" <c:if test="${book.bookSize == '64开'}">selected</c:if>>64开</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookPages" class="col-sm-4 control-label">图书页码:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookPages" class="form-control" id="bookPages" value="${book.bookPages}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">图书定价:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                    <input type="number" class="form-control rmb-input" name="bookPrice" value="${book.bookPrice}">
                                    <span class="input-group-addon rmb-span" style="border-left: 0px;">元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">市场价:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                    <input type="number" class="form-control rmb-input" name="bookMarketPrice" value="${book.bookMarketPrice}">
                                    <span class="input-group-addon rmb-span">元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员价:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                    <input type="number" class="form-control rmb-input" name="bookVIPPrice" value="${book.bookVIPPrice}">
                                    <span class="input-group-addon rmb-span">元</span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="bookBasicEdit-btn">确定</button>
                </div>
            </div>
        </div>
    </div>


    <%-- 编辑库存信息 --%>
    <div class="modal fade" id="BModal" role="dialog" aria-labelledby="BModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="BModalLabel">编辑库存信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/book/editKCBook" method="post" id="KCForm">
                        <input type="hidden" name="id" value="${book.id}">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">是否上架:</label>
                            <div class="col-sm-6">
                                <select name="status" class="form-control">
                                    <option value="1" <c:if test="${book.status == 1}">selected</c:if>>已上架</option>
                                    <option value="0" <c:if test="${book.status == 0}">selected</c:if>>已下架</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookStoreMount" class="col-sm-4 control-label">库存量:</label>
                            <div class="col-sm-6">
                                <input type="number" name="bookStoreMount" class="form-control" id="bookStoreMount" value="${book.bookStoreMount}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookDealMount" class="col-sm-4 control-label">成交量:</label>
                            <div class="col-sm-6">
                                <input type="number" name="bookDealMount" class="form-control" id="bookDealMount" value="${book.bookDealMount}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">入库时间:</label>
                            <div class="col-sm-6">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" readonly name="bookStoreTimeStr" class="form-control pull-right form_date-bookPubTime" value="<fmt:formatDate value="${book.bookStoreTime}" pattern="yyyy-MM-dd"/>">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="bookKCEdit-btn">确定</button>
                </div>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">

    $('.form_date-bookPubTime').datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        minView:'month',
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0
    });

    $("#category_select").select2({
        tags: false,
        "language": {
            "noResults": function(){
                return "无此分类";
            }
        }
    });

    /* 基本信息modal */
    $(".a-edit-btn").click(function () {
        $("#AModal").modal("show");
    });
    $("#bookBasicEdit-btn").click(function () {
        $("#AModal").modal("hide");
        $("#JBForm").submit();
    });

    /* 库存 */
    $(".b-edit-btn").click(function () {
        $("#BModal").modal('show');
    });
    $("#bookKCEdit-btn").click(function () {
        $("#BModal").modal("hide");
        $("#KCForm").submit();
    });
</script>
</html>

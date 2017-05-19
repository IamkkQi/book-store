<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/18
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>图书列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
    <script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">图书列表</div>
        <form action="${backstage}/admin/book/list" method="post" id="bForm">
            <input type="hidden" name="keys" id="keys">
        </form>
        <div style="float: right">
            <button class="btn btn-info" data-toggle="modal" data-target="#BModal" style="margin-left:10px; float: right;">添加图书</button>
            <div class="input-group col-md-3" style="margin-bottom:10px; position: relative;float: right;">
                <input type="text" class="form-control" placeholder="书名/作者" />
                <span class="input-group-btn">
                    <button class="btn btn-info" id="sea-btn">搜索</button>
                </span>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-info">
                    <div class="box-header">
                        <%-- <h3 class="box-title">Data Table With Full Features</h3>--%>
                    </div>
                    <div class="box-body">
                        <table id="userTable" class="table table-bordered table-hover table-center">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>图书名</th>
                                <th>作者</th>
                                <th>定价</th>
                                <th>图书编号（ISBN）</th>
                                <th>图书类别</th>
                                <th>出版社</th>
                                <th>库存</th>
                                <th>是否上架</th>
                                <th>更改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageBean.recordList}" var="b" varStatus="i">
                                <tr>
                                    <td>${i.index + 1}</td>
                                    <td>${b.bookName}</td>
                                    <td>${b.bookAuthor}</td>
                                    <td>${b.bookPrice}</td>
                                    <td>${b.bookNumber}</td>
                                    <td>${b.categoryName}</td>
                                    <td>${b.bookPress}</td>
                                    <td>${b.bookStoreMount}</td>
                                    <td>
                                        <c:if test="${b.status == 1}">已上架</c:if>
                                        <c:if test="${b.status == 0}">已下架</c:if>
                                    </td>
                                    <td><fmt:formatDate value="${b.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    <td>
                                        <a href="${backstage}/admin/book/details/${b.id}" data-bid="${b.id}">详情</a> |
                                        <c:if test="${b.status == 0}">
                                            <a href="javascript:;" data-bid="${b.id}" data-status="1" class="upBook">上架</a>
                                        </c:if>
                                        <c:if test="${b.status == 1}">
                                            <a href="javascript:;" data-bid="${b.id}" data-status="0" class="upBook">下架</a>
                                        </c:if>
                                        |
                                        <a href="javascript:;" data-bid="${b.id}" class="deleteBook">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="11">
                                    <div class="td-right">
                                        <jsp:include page="/WEB-INF/backstage/include/fenye.jsp"/>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 图书上下架 -->
    <div class="modal fade" id="AModal" tabindex="-1" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel"></h4>
                </div>
                <div class="modal-body" id="BookA">
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="bookId">
                    <input type="hidden" value="" class="bookStatus">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="bookA-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 图书添加 --%>
    <div class="modal fade" id="BModal" role="dialog" aria-labelledby="BModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="BModalLabel">添加图书</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/book/addBook" method="post" id="AddForm">
                        <div class="form-group">
                            <label for="bookName" class="col-sm-4 control-label">书名:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookName" class="form-control" id="bookName" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookAuthor" class="col-sm-4 control-label">作者:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookAuthor" class="form-control" id="bookAuthor" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookNumber" class="col-sm-4 control-label">编号（ISBN）:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookNumber" class="form-control" id="bookNumber" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">图书类别:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="categoryId" id="category_select" style="width: 100%;">
                                    <option value="">请选择</option>
                                    <c:forEach items="${categories}" var="c">
                                        <option value="${c.id}">${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookPress" class="col-sm-4 control-label">出版社:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookPress" class="form-control" id="bookPress" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">出版日期:</label>
                            <div class="col-sm-6">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" readonly name="bookPubTimeStr" class="form-control pull-right form_date-bookPubTime" value="">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">开本:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="bookSize">
                                    <option value="2开">2开</option>
                                    <option value="3开">3开</option>
                                    <option value="4开">4开</option>
                                    <option value="6开">6开</option>
                                    <option value="8开">8开</option>
                                    <option value="16开">16开</option>
                                    <option value="32开">32开</option>
                                    <option value="64开">64开</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookPages" class="col-sm-4 control-label">图书页码:</label>
                            <div class="col-sm-6">
                                <input type="text" name="bookPages" class="form-control" id="bookPages" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">图书定价:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                    <input type="number" class="form-control rmb-input" name="bookPrice" value="">
                                    <span class="input-group-addon rmb-span" style="border-left: 0px;">元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">市场价:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                    <input type="number" class="form-control rmb-input" name="bookMarketPrice" value="">
                                    <span class="input-group-addon rmb-span">元</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">会员价:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-rmb"></i></span>
                                    <input type="number" class="form-control rmb-input" name="bookVIPPrice" value="">
                                    <span class="input-group-addon rmb-span">元</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">是否上架:</label>
                            <div class="col-sm-6">
                                <select name="status" class="form-control">
                                    <option value="1">上架</option>
                                    <option value="0">下架</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="bookStoreMount" class="col-sm-4 control-label">库存量:</label>
                            <div class="col-sm-6">
                                <input type="number" name="bookStoreMount" class="form-control" id="bookStoreMount" value="">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="bookAddEdit-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除图书 --%>
    <div class="modal fade" id="CModal" tabindex="-1" role="dialog" aria-labelledby="CModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="CModalLabel">删除图书</h4>
                </div>
                <div class="modal-body">
                    你确定要删除此图书吗？
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="bookId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-danger" id="bookDel-btn">确定</button>
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

    /* 搜索 */
    $("#sea-btn").click(function () {
        $("#keys").val($(this).parent().prev().val());
        $("#bForm").submit();
    });

    /* 下架图书 */
    $('.upBook').click(function () {
        if($(this).data('status') == 0) {
            $("#AModalLabel").text("图书下架");
            $("#BookA").text("你确定要下架此图书吗？");
        } else {
            $("#AModalLabel").text("图书上架");
            $("#BookA").text("你确定要上架此图书吗？");
        }
        $('#AModal').find('.bookId').val($(this).data('bid'));
        $('#AModal').find('.bookStatus').val($(this).data('status'));
        $('#AModal').modal('show');
    });
    /* 下架图书弹窗  */
    $('#bookA-btn').click(function () {
        $("#AModal").modal('hide');
        location.href = "${backstage}/admin/book/shelvesBook?bid=" + $(this).parent().find('.bookId').val() + "&status=" + $(this).parent().find('.bookStatus').val();
    });

    /* 添加图书 */
    $("#bookAddEdit-btn").click(function () {
        $("#AddForm").submit();
    });

    /* 删除图书 */
    $(".deleteBook").click(function () {
        $("#CModal").find('.bookId').val($(this).data('bid'));
        $("#CModal").modal('show');
    });
    /* 删除图书弹窗 */
    $("#bookDel-btn").click(function () {
        $("#CModal").modal('hide');
        location.href = "${backstage}/admin/book/deleteBook/" + $(this).prev().prev().val();
    });
</script>
</html>

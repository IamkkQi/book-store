<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/19
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>类别列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">类别列表</div>
        <form action="${backstage}/admin/category/list" method="post" id="cForm">
            <input type="hidden" name="keys" id="keys">
        </form>
        <div style="float: right">
            <button class="btn btn-info" data-toggle="modal" data-target="#AModal" style="margin-left:10px; float: right;">添加类别</button>
            <div class="input-group col-md-3" style="margin-bottom:10px; position: relative;float: right;">
                <input type="text" class="form-control" placeholder="类名" />
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
                                <th>类别编号</th>
                                <th>类别名称</th>
                                <th>父类名称</th>
                                <th>级别</th>
                                <th>更改时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pageBean.recordList}" var="c" varStatus="i">
                                    <tr>
                                        <td>${i.index + 1}</td>
                                        <td class="number">${c.categoryNumber}</td>
                                        <td class="name">${c.categoryName}</td>
                                        <td class="parentName">${c.parentName}</td>
                                        <td>${c.level}</td>
                                        <td><fmt:formatDate value="${c.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                        <td>
                                            <a href="javascript:;" data-cid="${c.id}" data-level="${c.level}" data-pid="${c.pid}" class="editCategory">修改</a> |
                                            <a href="javascript:;" data-cid="${c.id}" data-level="${c.level}" class="deleteCategory">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="7">
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

    <!-- 添加分类 -->
    <div class="modal fade" id="AModal" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel">添加分类</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/category/addCategory" method="post" id="addForm">
                        <div class="form-group">
                            <label for="categoryNumber" class="col-sm-4 control-label">分类编号:</label>
                            <div class="col-sm-6">
                                <input type="text" name="categoryNumber" class="form-control" id="categoryNumber" placeholder="请输入编号">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="categoryName" class="col-sm-4 control-label">分类名称:</label>
                            <div class="col-sm-6">
                                <input type="text" name="categoryName" class="form-control" id="categoryName" required placeholder="请输入名称">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">级别:</label>
                            <div class="col-sm-6">
                                <select name="level" class="form-control" id="level" style="width: 49%; float: left; margin-right: 2%;">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                                <span style="width: 49%; float: left; display: none">
                                    <select name="" class="parent_select" style="width: 100%;">
                                        <option value="">请选择父类</option>
                                        <c:forEach items="${oneCategories}" var="one">
                                            <option value="${one.id}">${one.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="cAdd-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改分类 -->
    <div class="modal fade" id="BModal" role="dialog" aria-labelledby="BModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="BModalLabel">修改分类</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/category/editCategory" method="post" id="editForm">
                        <input type="hidden" name="id" id="categoryId">
                        <input type="hidden" name="level" id="editLevel">
                        <div class="form-group">
                            <label for="categoryNumberEdit" class="col-sm-4 control-label">分类编号:</label>
                            <div class="col-sm-6">
                                <input type="text" name="categoryNumber" class="form-control" id="categoryNumberEdit" placeholder="请输入编号">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="categoryNameEdit" class="col-sm-4 control-label">分类名称:</label>
                            <div class="col-sm-6">
                                <input type="text" name="categoryName" class="form-control" id="categoryNameEdit" required placeholder="请输入名称">
                            </div>
                        </div>

                        <div class="form-group" id="editParent" style="display: none">
                            <label class="col-sm-4 control-label">父类名:</label>
                            <div class="col-sm-6">
                                <select name="" class="parent_select" style="width: 100%;">
                                    <option value="">请选择父类</option>
                                    <c:forEach items="${oneCategories}" var="one">
                                        <option value="${one.id}">${one.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="edit-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删分类 --%>
    <div class="modal fade" id="CModal" tabindex="-1" role="dialog" aria-labelledby="CModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 30%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="CModalLabel">删除分类</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="cId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-danger" id="cDel-btn">确定</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    /* 搜索 */
    $("#sea-btn").click(function () {
        $("#keys").val($(this).parent().prev().val());
        $("#cForm").submit();
    });

    /* 级别选择 */
    $("#level").change(function () {
        if($(this).val() == 1) {
            $(this).parent().find('span').hide();
            $(this).parent().find(".parent_select").attr('name', '');
        } else {
            $(this).parent().find(".parent_select").select2().val("").trigger('change');
            $(this).parent().find(".parent_select").attr('name', 'parentId');
            $(this).parent().find('span').show();
        }

    });


    $(function () {
        // 表单验证
        $('#addForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                categoryNumber: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '编号不能为空'
                        },
                    }
                },
                categoryName: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '名称不能为空'
                        },
                    }
                },
            }
        });

        // 验证之后提交表单
        $("#cAdd-btn").click(function () {
            var bootstrapValidator = $("#addForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()) {
                document.getElementById("addForm").submit();
            } else {
                return;
            }
        });


        // 修改表单验证
        $('#editForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                categoryNumber: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '编号不能为空'
                        },
                    }
                },
                categoryName: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '名称不能为空'
                        },
                    }
                },
            }
        });

        // 验证之后提交表单
        $("#edit-btn").click(function () {
            var bootstrapValidator = $("#editForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()) {
                document.getElementById("editForm").submit();
            } else {
                return;
            }
        });
    });

    /* 分类 */
    $(".parent_select").select2({
        tags: false,
        "language": {
            "noResults": function(){
                return "无此分类";
            }
        }
    });

    // 修改
    $(".editCategory").click(function () {
        $("#BModal").find("#categoryNumberEdit").val($(this).parent().parent().find(".number").text());
        $("#BModal").find("#categoryNameEdit").val($(this).parent().parent().find(".name").text());
        $("#BModal").find(".parent_select").select2().val($(this).data('pid')).trigger('change');
        if($(this).data('level') == 2) {
            $("#editLevel").val(2);
            $("#editParent").find(".parent_select").attr('name', 'parentId');
            $("#editParent").show();
        } else {
            $("#editLevel").val(1);
            $("#editParent").find(".parent_select").attr('name', '');
            $("#editParent").hide();
        }
        $("#categoryId").val($(this).data('cid'));
        $("#BModal").modal('show');
    });

    // 删除
    $(".deleteCategory").click(function () {
        if ($(this).data('level') == 1) {
            $("#CModalLabel").text("删除父级分类");
            $("#CModal").find('.modal-body').text("你确定要删除此父级分类吗？删除父级分类后子类也会被删除！！！");
        } else {
            $("#CModalLabel").text("删除子分类");
            $("#CModal").find('.modal-body').text("你确定要删除子分类吗？");
        }
        $("#CModal").find(".cId").val($(this).data('cid'));
        $("#CModal").modal("show");
    });
    $("#cDel-btn").click(function () {
        $("#CModal").modal('hide');
        location.href = "${backstage}/admin/category/deleteCategory/" + $(this).prev().prev().val();
    });
</script>
</html>

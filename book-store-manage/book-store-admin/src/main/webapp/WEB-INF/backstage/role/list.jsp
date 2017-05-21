<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/20
  Time: 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>角色列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
    <link href="${backstage}/static/adminLTE-2.3.11/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
    <link href="${backstage}/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
    <script src="${backstage}/static/zTree/js/jquery.ztree.core.min.js" type="text/javascript"></script>
    <script src="${backstage}/static/zTree/js/jquery.ztree.excheck.min.js" type="text/javascript"></script>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">角色列表</div>
        <form action="${backstage}/admin/role/list" method="post" id="rForm">
            <input type="hidden" name="keys" id="keys">
        </form>
        <div style="float: right">
            <button class="btn btn-info" data-toggle="modal" data-target="#AModal" style="margin-left:10px; float: right;">添加角色</button>
            <div class="input-group col-md-3" style="margin-bottom:10px; position: relative;float: right;">
                <input type="text" class="form-control" placeholder="角色名称" />
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
                                <th>角色名称</th>
                                <th>角色描述</th>
                                <th>创建方式</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageBean.recordList}" var="r" varStatus="i">
                                <tr>
                                    <td>${i.index + 1}</td>
                                    <td class="roleName">${r.roleName}</td>
                                    <td class="description">${r.description}</td>
                                    <td>
                                        <c:if test="${r.type == 0}">系统创建</c:if>
                                        <c:if test="${r.type == 1}">管理员创建</c:if>
                                    </td>
                                    <td><fmt:formatDate value="${r.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <a href="javascript:;" data-rid="${r.id}" class="detailsRole">查看</a> |
                                        <a href="javascript:;" data-rid="${r.id}" class="editRole">修改</a> |
                                        <a href="javascript:;" data-rid="${r.id}" class="addUserRole">添加用户</a> |
                                        <a href="javascript:;" data-rid="${r.id}" class="distributePer">分配权限</a> |
                                        <a href="javascript:;" data-rid="${r.id}" class="deleteRole">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="6">
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

    <%-- 添加角色 --%>
    <div class="modal fade" id="AModal" role="dialog" aria-labelledby="AModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="AModalLabel">添加角色</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/role/addRole" method="post" id="addForm">
                        <div class="form-group">
                            <label for="roleName" class="col-sm-4 control-label">角色名称:</label>
                            <div class="col-sm-6">
                                <input type="text" name="roleName" class="form-control" id="roleName" placeholder="角色名称">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="description" class="col-sm-4 control-label">角色描述</label>
                            <div class="col-sm-6">
                                <input type="text" name="description" class="form-control" id="description" required placeholder="角色描述">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="A-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 修改角色 --%>
    <div class="modal fade" id="BModal" role="dialog" aria-labelledby="BModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="BModalLabel">修改角色</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/role/editRole" method="post" id="editForm">
                        <input type="hidden" name="id" value="" id="editId">
                        <div class="form-group">
                            <label for="roleNameEdit" class="col-sm-4 control-label">角色名称:</label>
                            <div class="col-sm-6">
                                <input type="text" name="roleName" class="form-control" id="roleNameEdit" placeholder="角色名称">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="descriptionEdit" class="col-sm-4 control-label">角色描述</label>
                            <div class="col-sm-6">
                                <input type="text" name="description" class="form-control" id="descriptionEdit" required placeholder="角色描述">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="B-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 为角色添加用户 --%>
    <div class="modal fade" id="CModal" role="dialog" aria-labelledby="CModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="CModalLabel">为角色添加用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/role/addUserRole" method="post" id="urForm">
                        <input type="hidden" name="roleId" value="" id="urId">
                        <div class="form-group">
                            <label for="roleNameEdit" class="col-sm-4 control-label">角色名称:</label>
                            <div class="col-sm-6">
                                <select name="userId" class="user_select" style="width: 100%;">
                                    <option value="">请选择用户</option>
                                    <c:forEach items="${usersWithNotRole}" var="u">
                                        <option value="${u.id}">${u.userName}(${u.tel})</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="C-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 分配权限 --%>
    <div class="modal fade" id="DModal" role="dialog" aria-labelledby="DModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 36%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="DModalLabel">分配权限</h4>
                </div>
                <div class="modal-body">
                    <form action="${backstage}/admin/role/addPermissions" method="post" id="addPermissionForm">
                        <input type="hidden" name="rid" id="rid">
                        <input type="hidden" name="pIds" id="pIds">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="zTreeDemoBackground left">
                                    <ul id="treeDemo" class="ztree"></ul>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="D-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 删除角色 --%>
    <div class="modal fade" id="EModal" tabindex="-1" role="dialog" aria-labelledby="EModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="top: 20%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="EModalLabel">删除角色</h4>
                </div>
                <div class="modal-body">
                    你确定要删除此角色吗？
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="" class="roleId">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="E-btn">确定</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    // 设置树
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };

    // 用户编辑
    $(".editRole").click(function () {
        $("#BModal").find("#editId").val($(this).data("rid"));
        $("#BModal").find("#roleNameEdit").val($(this).parent().parent().find('.roleName').text());
        $("#BModal").find("#descriptionEdit").val($(this).parent().parent().find('.description').text());
        $("#BModal").modal('show');
    });

    // 添加用户
    $(".addUserRole").click(function () {
        $("#CModal").find("#urId").val($(this).data("rid"));
        $("#CModal").modal('show');
    });
    $("#C-btn").click(function () {
        $("#CModal").modal('hide');
        $("#urForm").submit();
    });
    
    // 用户
    $(".user_select").select2({
        tags: false,
        "language": {
            "noResults": function(){
                return "无此用户";
            }
        }
    });
    
    var zTreeObj;
    function initZTree(zNodes) {
        zTreeObj = $.fn.zTree.init($('#treeDemo'), setting, zNodes);
    }
    
    // 分配权限
    $(".distributePer").click(function () {
        // 获取zNodes
        $.ajax({
            type : "get",
            url : "${backstage}/admin/role/getPermissionsZNodes",
            data : {'rid':$(this).data("rid")},
            dataType : "json",
            success : initZTree
        });
        $("#rid").val($(this).data("rid"));
        $("#DModal").modal('show');
    });
    // 添加权限确定按钮
    $("#D-btn").click(function () {
        // 权限id字符串
        var permissionIds = "";
        // 获取选中的节点
        var nodes = zTreeObj.getCheckedNodes(true);
        console.log(nodes);
        $.each(nodes, function (i, node) {
            if (permissionIds != "") {
                permissionIds += ",";
            }
            permissionIds += node.id;
        });
        $("#pIds").val(permissionIds);
        $("#addPermissionForm").submit();
    });

    // 删除角色
    $(".deleteRole").click(function () {
        $("#EModal").find('.roleId').val($(this).data('rid'));
        $("#EModal").modal('show');
    });
    // 删除角色弹框
    $("#E-btn").click(function () {
        $("#EModal").modal('hide');
        location.href = "${backstage}/admin/role/deleteRole/" + $(this).prev().prev().val();
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
                roleName: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '角色名称不能为空'
                        },
                        remote: {
                            url:"${backstage}/admin/commons/unique",
                            message: "角色已存在",
                            delay: 1000, // 每一秒发送一次
                            type: "POST",
                            dataType: 'json',
                            data: function() {
                                return {
                                    field: $("#roleName").val(),
                                    id: '',
                                    type: "role"
                                };
                            }
                        }
                    }
                },
                description: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '角色描述不能为空'
                        },
                    }
                },
            }
        });

        // 验证之后提交表单
        $("#A-btn").click(function () {
            var bootstrapValidator = $("#addForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()) {
                document.getElementById("addForm").submit();
            } else {
                return;
            }
        });

        // 编辑表单验证
        $('#editForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                roleName: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '角色名称不能为空'
                        },

                        remote: {
                            url:"${backstage}/admin/commons/unique",
                            message: "角色已存在",
                            delay: 1000, // 每一秒发送一次
                            type: "POST",
                            dataType: 'json',
                            data: function() {
                                return {
                                    field: $("#roleNameEdit").val(),
                                    id: $("#editId").val(),
                                    type: "role"
                                };
                            }
                        }
                    }
                },
                description: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '角色描述不能为空'
                        },
                    }
                },
            }
        });

        $("#B-btn").click(function () {
            var bootstrapValidator = $("#editForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()) {
                document.getElementById("editForm").submit();
            } else {
                return;
            }
        });
    })
</script>
</html>

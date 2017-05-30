<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/4/22
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/backstage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户详情</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="${backstage}/WEB-INF/backstage/include/css.jsp"></jsp:include>
</head>
<body>
    <section class="content-header">
        <div class="paper-title">用户详情</div>
    </section>

    <section class="content">
        <div class="user-basic-content">
            <%-- 基本信息 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span class="">基本信息</span>
                    <a href="#" class="b-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>用户名：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.userName}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>昵称：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.nickName}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>性别：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>
                            <c:if test="${u.gender == 0}">未知</c:if>
                            <c:if test="${u.gender == 1}">男</c:if>
                            <c:if test="${u.gender == 2}">女</c:if>
                        </span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>出生日期：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${u.birthDate}" pattern="yyyy-MM-dd"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>身份证号：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.idCard}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>籍贯：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.province} ${u.city}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>民族：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.nation}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>职业：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.occupation}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>邮箱：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.email}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>更新时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${u.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>注册时间：</span>
                    </div>
                    <div class="basic-info-right">
                        <span><fmt:formatDate value="${u.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
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

            <%-- 账户信息 --%>
            <div class="basic-info">
                <div class="basic-info-title">
                    <span>账户信息</span>
                    <a href="#" class="a-edit-btn">编辑</a>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>手机号：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>${u.tel}</span>
                    </div>
                </div>

                <div class="basic-info-content">
                    <div class="basic-info-left">
                        <span>账户状态：</span>
                    </div>
                    <div class="basic-info-right">
                        <span>
                            <c:if test="${u.status == 0}">禁用</c:if>
                            <c:if test="${u.status == 1}">正常</c:if>
                        </span>
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
        </div>
    </section>

    <!-- 编辑基本用户 -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="editModalLabel">编辑基本信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/user/editBasicUser" method="post" id="basicForm">
                        <input type="hidden" name="id" value="${u.id}">
                        <div class="form-group">
                            <label for="userName" class="col-sm-4 control-label">用户名:</label>
                            <div class="col-sm-6">
                                <input type="text" name="userName" class="form-control" id="userName" value="${u.userName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nickName" class="col-sm-4 control-label">昵称:</label>
                            <div class="col-sm-6">
                                <input type="text" name="nickName" class="form-control" id="nickName" value="${u.nickName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">性别:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="gender">
                                    <option value="">请选择</option>
                                    <option value="1" <c:if test="${u.gender == 1}">selected</c:if>>男</option>
                                    <option value="2" <c:if test="${u.gender == 2}">selected</c:if>>女</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">出生日期:</label>
                            <div class="col-sm-6">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" readonly name="birthDateStr" class="form-control pull-right form_date-birthDate" value="${u.birthDate}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="idCard" class="col-sm-4 control-label">身份证号:</label>
                            <div class="col-sm-6">
                                <input type="text" name="idCard" class="form-control" id="idCard" value="${u.idCard}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">邮箱:</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                    <input type="email" name="email" class="form-control" value="${u.email}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">籍贯:</label>
                            <div class="col-sm-6" data-toggle="distpicker" id="address">
                                <select name="province" id="province" class="form-control" style="width: 49%; float: left; margin-right: 2%;"></select>
                                <select name="city" id="city" class="form-control" style="width: 49%; float: left"></select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">民族:</label>
                            <div class="col-sm-6">
                                <select name="nation" class="form-control">
                                    <option value="汉族" <c:if test="${u.nation == '汉族'}">selected</c:if>>汉族</option>
                                    <option value="满族" <c:if test="${u.nation == '满族'}">selected</c:if>>满族</option>
                                    <option value="回族" <c:if test="${u.nation == '回族'}">selected</c:if>>回族</option>
                                    <option value="苗族" <c:if test="${u.nation == '苗族'}">selected</c:if>>苗族</option>
                                    <option value="其他" <c:if test="${u.nation == '其他'}">selected</c:if>>其他</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="occupation" class="col-sm-4 control-label">职业:</label>
                            <div class="col-sm-6">
                                <input type="text" name="occupation" class="form-control" id="occupation" value="${u.occupation}">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="userBasicEdit-btn">确定</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editZHModal" tabindex="-1" role="dialog" aria-labelledby="editZHModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="editZHModalLabel">编辑账户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="${backstage}/admin/user/editZHUser" method="post" id="zhForm">
                        <input type="hidden" name="id" value="${u.id}">
                        <div class="form-group">
                            <label for="tel" class="col-sm-4 control-label">手机号:</label>
                            <div class="col-sm-6">
                                <input type="text" name="tel" class="form-control" id="tel" value="${u.tel}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">用户状态:</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="status">
                                    <option value="0" <c:if test="${u.status == 0}">selected</c:if>>禁用</option>
                                    <option value="1" <c:if test="${u.status == 1}">selected</c:if>>正常</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="userZHEdit-btn">确定</button>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="${backstage}/WEB-INF/backstage/include/javascript.jsp"></jsp:include>
<script src="${backstage}/static/distpicker/dist/distpicker.min.js" type="text/javascript"></script>
<script type="text/javascript">
    
    $(function () {
        initImgSize();

        $("#province").val("${u.province}");
        $("#province").trigger("change");
        $("#city").val("${u.city}");
        $("#city").trigger("change");

    });


    // 初始化图片大小方法
    function initImgSize() {
        var h, w, h1, w1, s;
        $(".basic-info-img li img").each(function() {
            h = $(this).height();
            w = $(this).width();
            if(h > w) {
                s = h;
                $(this).width(80);
                h1 = $(this).height();
                $(this).css("marginTop", (80 - h1) / 2);
            } else {
                s = w;
                $(this).height(80);
                w1 = $(this).width();
                $(this).css("marginLeft", (80 - w1) / 2);
            }
        });
    }

    /* 编辑基本信息 */
    $(".b-edit-btn").click(function () {
        $("#editModal").modal("show");
    });

    $("#userBasicEdit-btn").click(function () {
        $("#editModal").modal("hide");
        $("#basicForm").submit();
    });

    /* 编辑账户信息 */
    $(".a-edit-btn").click(function () {
        $("#editZHModal").modal('show');
    });
    $("#userZHEdit-btn").click(function () {
        $("#editZHModal").modal('hide');
        $("#zhForm").submit();
    });
</script>
</html>

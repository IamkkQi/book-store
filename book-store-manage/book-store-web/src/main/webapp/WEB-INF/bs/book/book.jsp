<%--
  Created by IntelliJ IDEA.
  User: Kay
  Date: 2017/5/28
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/bs/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <jsp:include page="${bsw}/WEB-INF/bs/include/css.jsp"/>
    <jsp:include page="${bsw}/WEB-INF/bs/include/javascript.jsp"/>
</head>
<body>
    <div class="container" style="margin-top: 20px;>
        <div class="row">
            <div class="col-md-12" >
                <c:forEach items="${books}" var="book">
                    <div class="col-md-3">
                        <div class="media">
                            <div class="media-center media-top">
                                <a href="#" data-bid="${book.id}"><img class="media-object center-block" src="${book.imgUrl}" style="width:200px;height:260px"/></a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${book.bookName}</h4>
                                <p class="media-heading">${book.bookAuthor}</p>
                                <p class="media-heading">￥${book.bookPrice}元</p>
                            </div>
                            <div class="">
                                <button type="button" class="btn btn-primary addCart" data-bid="${book.id}">加入购物车</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(".addCart").click(function () {
        $.getJSON('${bsw}/bs/cart/addCart', {'bookId' : $(this).data('bid')}, function(data){
            console.log(data.flag)
            if (data.flag == 'yes') {
                alert('添加成功');
            } else {
                alert('添加失败');
            }
        });
    });
</script>
</html>

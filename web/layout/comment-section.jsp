<%-- 
    Document   : commentSection.jsp
    Created on : Aug 15, 2016, 6:09:40 PM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query dataSource="${ds}" var="allComments">
    select * from comment where post_id = ${param.postId} and status = 'approved';
</sql:query>

<h3>Comments</h3><hr/>
<c:forEach items="${allComments.rows}" var="row">
    <div class='comment'>
        <b>${row.user}</b> : ${row.content}
    </div>
</c:forEach>

<hr/>

<div class="form-group">
    <textarea class="form-control" id="commentBox"></textarea></br>
    <button id='sendBtn' class='btn btn-danger' id='ajaxComment'>Comment</button>
    <b id='ajaxResult'></b>
</div>

<script src='js/jquery-3.1.0.min.js'></script>
<script>
    function sendComment() {
        $.ajax({
            type: "post",
            url: "layout/add-comment.jsp",
            data: {
                user: '${sessionScope['loginUser']}',
                postId: ${param.postId},
                datetime: getCurrentDate(),
                content: $('#commentBox').val()
            },
            success: function (html) {
                $('#ajaxResult').text('Comment sent !');
            },
            error: function (xhr, ajaxOptions, err) {
                $('#ajaxResult').text("Failed to comment !");
            }
        });
    }

    function getCurrentDate() {
        var date = new Date();
        return date.getYear() + "-" + date.getMonth() + "-" + date.getDay() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
    }

    $(document).ready(function () {
        $('#sendBtn').on('click', sendComment);
    });
</script>
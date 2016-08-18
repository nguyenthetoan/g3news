<%-- 
    Document   : page-post
    Created on : Aug 17, 2016, 8:53:46 AM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:if test="${empty param.postId}">
    <c:redirect url="index.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Post</title>
    </head>

    <body class='container'>
        <header>
            <jsp:include page="layout/page-header.jsp"/>
            <sql:query dataSource="${ds}" var='foundPost'>
                select * from post join user on post.user_id = user.id where post.id=${param.postId};
            </sql:query>

            <c:set var="thisPost" value="${foundPost.rows[0]}"/>
        </header>

        <div style="visibility: hidden" id="hiddenDiv">
            ${thisPost.title}
        </div>

        <main class="row">
            <div class="col-md-10 col-md-offset-1">
                <section id='headingSection' class="row">
                    <div class="row">
                        <h5 style="text-align: right" class="col-md-2 col-md-offset-6">${thisPost.post_date}</h5>
                    </div>
                    <div class="col-md-8">
                        <h1>${thisPost.title}</h1>
                    </div>                
                </section>

                <section id="contentSection" class="row">
                    <div class="col-md-7">
                        ${thisPost.content}
                    </div>                
                </section>

                <section id="writerSection" class="row">
                    <b style="text-align: right" class="col-md-2 col-md-offset-6">${thisPost.user_realname}</b>
                </section>

                <section id="commentSection" class="row">
                    <div class="col-md-6">
                        <jsp:include page='layout/comment-section.jsp'>
                            <jsp:param name="postId" value="${param.postId}"/>
                        </jsp:include>
                    </div>
                </section>
            </div>
        </main>

        <script>
            $(document).ready(function () {
                $('title').text($('#hiddenDiv').text());
            });
        </script>
    </body>
</html>


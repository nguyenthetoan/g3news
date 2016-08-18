<%-- 
    Document   : cat
    Created on : Aug 17, 2016, 6:16:53 PM
    Author     : rofl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty param.catID}">
    <c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="container">
        <header>
            <%@include file="layout/page-header.jsp" %>
        </header>
        <sql:query dataSource="${ds}" var="result">
            select * from post where ${param.catID} = post.post_category
        </sql:query>
        <main>
            <c:forEach items="${result.rows}" var="r">
                <a href="page-post.jsp?postId=${r.id}">${r.title}</a> <br/>
            </c:forEach>
        </main>
    </body>
</html>

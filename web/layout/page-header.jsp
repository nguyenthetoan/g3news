<%-- 
    Document   : pageHeader
    Created on : Aug 17, 2016, 8:39:31 AM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="../css/styles.css" type="text/css" />
<script src="../js/jquery-3.1.0.min.js" type="text/javascript"></script>

<c:if test="${empty ds}">
    <sql:setDataSource var="ds" scope="session" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://210.245.85.214:3306/news?characterEncoding=utf8&useUnicode=true"
                       user="admin" password="password"/>
</c:if>

<sql:query dataSource="${ds}" var="allCategories">
    select id, name from category;
</sql:query>



<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="http://localhost:8080/g3news/">G3News</a>
        </div>
        
        <ul class="nav navbar-nav">
            <c:forEach items="${allCategories.rows}" var="row">
                <li><a href="cat.jsp?catID=${row.id}">${row.name}</a></li>
            </c:forEach>
        </ul>
    </div>
</nav>

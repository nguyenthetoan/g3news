<%-- 
    Document   : index
    Created on : Aug 17, 2016, 9:09:53 AM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <title>JSP Page</title>
    </head>
    <body class="container">
        <header>
            <jsp:include page="layout/page-header.jsp"/>
        </header>
        
        <div hidden>
            <sql:query dataSource="${ds}" var="tenNewestPost">
                SELECT * FROM post order by id desc limit 10;
            </sql:query>
        </div>
    </body>
</html>

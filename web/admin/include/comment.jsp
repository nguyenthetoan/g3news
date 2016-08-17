<%-- 
    Document   : comment
    Created on : Aug 17, 2016, 7:31:03 PM
    Author     : rofl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:update dataSource="${ds}" var="result">
            update comment set status = ${param.status} where id = ${param.comId}
        </sql:update>
    </body>
</html>

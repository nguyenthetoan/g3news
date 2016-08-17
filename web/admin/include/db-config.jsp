<%-- 
    Document   : db-config
    Created on : Aug 18, 2016, 1:38:16 AM
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
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://210.245.85.214:3306/news?useUnicode=true&characterEncoding=UTF-8"
                           user="admin" password="password"/>
    </body>
</html>

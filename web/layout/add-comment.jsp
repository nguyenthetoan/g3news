<%-- 
    Document   : addComment
    Created on : Aug 16, 2016, 4:42:53 PM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:update dataSource="${ds}">
            Insert into comment(post_id, user, datetime, content, status)
            value (${param.postId}, '${param.user}', '${param.datetime}', '${param.content}', 'pending');
        </sql:update>
    </body>
</html>

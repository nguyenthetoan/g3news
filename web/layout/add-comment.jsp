<%-- 
    Document   : addComment
    Created on : Aug 16, 2016, 4:42:53 PM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update dataSource="${ds}">
    Insert into comment(post_id, user, datetime, content, status)
    value (${param.postId}, '${param.user}', '${param.datetime}', '${param.content}', 'pending');
</sql:update>

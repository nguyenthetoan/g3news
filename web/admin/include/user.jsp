<%-- 
    Document   : user
    Created on : Aug 16, 2016, 1:29:16 AM
    Author     : rofl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:update dataSource="${ds}">
    insert into user(username, user_status, user_realname, password) 
    value("${param.u_name}" ,${param.u_role}, "${param.u_nicename}", "${param.u_password}")
</sql:update>

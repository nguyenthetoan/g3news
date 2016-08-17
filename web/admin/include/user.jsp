<%-- 
    Document   : user
    Created on : Aug 16, 2016, 1:29:16 AM
    Author     : rofl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <c:if test="${not empty param.u_name or not empty param.u_password}">
            <sql:update dataSource="${ds}" var="result">
                insert into user(username, user_status, user_realname, password) value("${param.u_name}" ,${param.u_role}, "${param.u_nicename}", "${param.u_password}")
            </sql:update>
            <%--redirect back to index --%>
            <c:redirect url="../index.jsp" />
        </c:if>
    </body>
</html>

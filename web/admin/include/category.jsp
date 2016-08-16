<%-- 
    Document   : category
    Created on : Aug 16, 2016, 1:29:07 AM
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
        
        <c:if test="${not empty param.cat_name}">
            <sql:update dataSource="${ds}" var="result">
                insert into category(name, user_id) value("${param.cat_name}" ,${param.userid})
            </sql:update>
            <%--redirect back to index --%>
            <c:redirect url="../index.jsp" />
        </c:if>
    </body>
</html>

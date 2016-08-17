<%-- 
    Document   : checklogin
    Created on : Aug 15, 2016, 10:33:19 PM
    Author     : rofl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="include/db-config.jsp" %>
        <c:if test="${ empty param.username or empty param.password}">
            <c:redirect url="login.jsp" >
                <c:param name="errMsg" value="Please Enter UserName and Password" />
            </c:redirect>

        </c:if>

        <c:if test="${not empty param.username and not empty param.password}">

            <sql:query dataSource="${ds}" var="selectQ">
                select count(*) as kount from User
                where username='${param.username}'
                and password='${param.password}'
            </sql:query>

            <c:forEach items="${selectQ.rows}" var="r">
                <c:choose>
                    <c:when test="${r.kount gt 0}">
                        <sql:query dataSource="${ds}" var="getRole">
                            select user_status from User where username='${param.username}' and '${param.password}'
                        </sql:query>
                        <c:set scope="session" var="userRole" value="${getRole.rows[0].user_status}" />
                        <c:set scope="session"
                               var="loginUser"
                               value="${param.username}"/>
                        <c:redirect url="index.jsp"/>
                    </c:when>
                    <c:otherwise>
                        <c:redirect url="login.jsp" >
                            <c:param name="errMsg" value="Username/password does not match" />
                        </c:redirect>
                    </c:otherwise>
                </c:choose>

            </c:forEach>

        </c:if>
    </body>
</html>

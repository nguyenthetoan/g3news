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
        <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://210.245.85.214:3306/news?useUnicode=true&characterEncoding=UTF-8"
                           user="admin" password="password"/>
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

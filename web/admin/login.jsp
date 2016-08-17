<%-- 
    Document   : index
    Created on : Aug 15, 2016, 10:09:33 PM
    Author     : rofl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>G3 News CMS Login</title>
    </head>
    <body>

        <div id="login-box">
            <h1>Sign In Please</h1>
            <form method="POST" action="checklogin.jsp" >
                Username: <input type="text" name="username"/><br/>
                Password: <input type="password" name="password"/><br/>
                <input value="Login" type="submit" />
            </form>
            <font color="red"><c:if test="${not empty param.errMsg}">
                <c:out value="${param.errMsg}" />
            </c:if></font>
        </div>
    </body>
</html>

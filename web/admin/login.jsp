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
        <link rel="stylesheet" media="screen" href="../css/bootstrap.min.css"/>
        <link href="../css/styles.css" rel="stylesheet"/>
        <title>G3 News CMS Login</title>
    </head>
    <body class="container">
        <div id="login-box" class="row">

            <div id="formlogin" class="col-md-offset-4 col-md-4">
                <h1>Sign In Please</h1>
                <form method="POST" action="checklogin.jsp" >
                    Username: <input type="text" name="username" id="boxUser"/><br/>
                    Password: <input type="password" name="password" id="boxPass"/><br/>
                    <input value="Login" type="submit" />
                </form>
                <font color="red"><c:if test="${not empty param.errMsg}">
                    <c:out value="${param.errMsg}" />
                </c:if>
                </font>
            </div>
        </div>
    </div>
</div>
</body>
</html>

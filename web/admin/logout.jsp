<%-- 
    Document   : logout
    Created on : Aug 16, 2016, 5:04:35 PM
    Author     : rofl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("loginUser");
            response.sendRedirect("login.jsp");
        %>  
    </body>
</html>

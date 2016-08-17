<%-- 
    Document   : post
    Created on : Aug 16, 2016, 1:29:32 AM
    Author     : rofl
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <c:if test="${not empty param.p_title and not empty param.p_content}">
            <% if (session.getAttribute("loginUser") == null) { %>
            You're not logged in. <a href="login.jsp">login here</a>
            <% } else {%>
            <sql:query var="getUserID" dataSource="${ds}" maxRows="1">
                select * from user where username = "<%= session.getAttribute("loginUser")%>"
            </sql:query>
            <c:forEach items="${getUserID.rows}" var="u">
                <c:set
                       var="tmpUID"
                       value="${u.id}" />
            </c:forEach>
            <fmt:formatDate pattern="yyyy-MM-dd" value="${curDate}" />
            <sql:update var="result" dataSource="${ds}" >
                insert into post(title, post_date, content, status, post_category, user_id) 
                value('${param.p_title}', '<fmt:formatDate pattern="yyyy-MM-dd" value="${curDate}" />', '${param.p_content}', 'publish', ${param.p_cat}, ${tmpUID} ) 
            </sql:update>
            <c:redirect url="../index.jsp" />
            <%-- end condition --%>
            <% }%>
        </c:if>
    </body>
</html>

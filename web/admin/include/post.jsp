<%-- 
    Document   : db-config
    Created on : Aug 18, 2016, 1:38:16 AM
    Author     : rofl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% if (session.getAttribute("loginUser") == null) { %>
You're not logged in. <a href="login.jsp">login here</a>
<% } else {%>

<sql:query var="getUserID" dataSource="${ds}" maxRows="1">
    select * from user where username = "<%= session.getAttribute("loginUser")%>"
</sql:query>
<c:set var="tmpUID"
       value="${getUserID.rows[0].id}" />
<fmt:formatDate pattern="yyyy-MM-dd" value="${curDate}" />

<sql:update dataSource="${ds}" >
    insert into post(title, post_date, content, status, post_category, user_id) 
    value('${param.p_title}', '<fmt:formatDate pattern="yyyy-MM-dd" value="${curDate}" />', '${param.p_content}', 'publish', ${param.p_cat}, ${tmpUID} )
</sql:update>
<% }%>

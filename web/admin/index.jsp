<%-- 
    Document   : index
    Created on : Aug 15, 2016, 10:35:49 PM
    Author     : rofl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="include/category.jsp" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if ((session.getAttribute("loginUser") == null)) { %>
        Youre not logged in. <a href="login.jsp">login here</a>
        <% } else {%>
        
        <h1>Welcome, <%=session.getAttribute("loginUser")%> <%= session.getAttribute("userRole") %> </h1>
        <a href="logout.jsp">log out</a>
        <%@include file="include/db-config.jsp" %>
        <c:set scope="application" var="curDate" value="<%= new java.util.Date()%>" />

        <div class="box-create-category">
            <sql:query dataSource="${ds}" var="users">
                select * from User
            </sql:query>
            <div class="add-new-cat">
                <h1>Create new category</h1>
                <form action="include/category.jsp">
                    name: <input name="cat_name" type="text" /> <br/>
                    user can post in: <select name="userid">
                        <c:forEach var="u" items="${users.rows}">
                            <option value="${u.id}">${u.username}</option>
                        </c:forEach> 
                    </select>
                    <br/>
                    <input type="submit" value="add"/>
                </form>
            </div>
            <div class="add-new-user">
                <h1>Create user section </h1>
                <form action="include/user.jsp">
                    username: <input name="u_name" type="text" /> <br/>
                    user nice name: <input name="u_nicename" type="text" /> <br/>
                    password: <input name="u_password" type="password" /> <br/>
                    user role: <select name="u_role">
                        <option value="0">root</option>
                        <option value="1">editor</option>

                    </select>
                    <br/>
                    <input type="submit" value="Create user"/>
                </form>
            </div>
            <div class="add-new-post">
                <h1>Publish new post</h1>
                <form action="include/post.jsp">
                    title: <input name="p_title" type="text" /> <br/>
                    <br/>
                    content: <textarea name="p_content"></textarea>
                    choose category: <select name="p_cat">
                        <sql:query dataSource="${ds}" var="cats">
                            select * from category
                        </sql:query>
                        <c:forEach var="c" items="${cats.rows}">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Publish" />
                </form>
            </div>
        </div>
        <%--logged in --%>
        <%}%>
    </body>
</html>

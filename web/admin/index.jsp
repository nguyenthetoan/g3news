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
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
        <title>G3News CMS</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <% if ((session.getAttribute("loginUser") == null)) { %>
                    Youre not logged in. <a href="login.jsp">login here</a>
                    <% } else {%>

                    <h1>Welcome, <%=session.getAttribute("loginUser")%></h1>
                    <a href="logout.jsp">log out</a>
                    <%@include file="include/db-config.jsp" %>
                    <c:set scope="application" var="curDate" value="<%= new java.util.Date()%>" />
                    <c:choose>
                        <c:when test="${sessionScope.userRole eq null}">
                            <!--root privileges-->
                            <div class="box-admin">
                                <sql:query dataSource="${ds}" var="users">
                                    select * from User
                                </sql:query>
                                <div class="container">
                                    <div class="row">

                                        <div class="col-xs-6">
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
                                        </div>
                                        <div class="col-xs-6">
                                            <h1>Edit category</h1>
                                            <sql:query dataSource="${ds}" var="categories">
                                                select * from category
                                            </sql:query>
                                                select 1 category to edit: <br />
<!--                                                ĐANG LÀM DỞ CHỖ NÀY - SỬA CATEGORY NAME-->
                                                <select name="editCat">
                                                    <c:forEach items="${categories.rows}" var="c">
                                                        <option value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                        </div>

                                    </div>
                                </div>
                                <div class="add-new-user">
                                    <h1>Create user section </h1>
                                    <form action="include/user.jsp">
                                        username: <input name="u_name" type="text" /> <br/>
                                        user nice name: <input name="u_nicename" type="text" /> <br/>
                                        password: <input name="u_password" type="password" /> <br/>
                                        user role: <select name="u_role">
                                            <option value="1">root</option>
                                            <option value="2">editor</option>

                                        </select>
                                        <br/>
                                        <input type="submit" value="Create user"/>
                                    </form>
                                </div>
                                <div>

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
                        </c:when>
                        <c:otherwise>
                            <!--editor privileges-->
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12">

                                        <div class="add-new-post">
                                            <h1>Publish new post</h1>
                                            <form action="include/post.jsp">
                                                title: <input name="p_title" type="text" /> <br/>
                                                <br/>
                                                content: <textarea name="p_content"></textarea> <br/>
                                                choose category: <select name="p_cat">
                                                    <sql:query dataSource="${ds}" var="cats">
                                                        select * from category where user_id = 2
                                                    </sql:query>
                                                    <c:forEach var="c" items="${cats.rows}">
                                                        <option value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="submit" value="Publish" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <%--logged in --%>
                    <%}%>
                </div>
            </div>
        </div>

    </body>
</html>

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
        <link rel="stylesheet" media="screen" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link href="../css/styles.css" rel="stylesheet"/>
        <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
        <title>JSP Page</title>
    </head>
    <body>
        <% if ((session.getAttribute("loginUser") == null)) { %>
        Youre not logged in. <a href="login.jsp">login here</a>
        <% } else {%>
        <div id="welcome">
            <div class="pull-left"> <h1>Welcome, <%=session.getAttribute("loginUser")%> </h1></div>
            <div class="pull-right">  <a href="logout.jsp" id="logout1">log out</a></div>
            <sql:setDataSource scope="session" var="ds" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://210.245.85.214:3306/news"
                               user="admin" password="password"/>
            <c:set scope="application" var="curDate" value="<%= new java.util.Date()%>" />

        </div>

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">G3</a>
                </div>

                <ul class="nav navbar-nav" id="adminOption">
                    <li><a href="#" id="btnCategory">Create Category</a></li>
                    <li><a href="#" id="btnUser">Create User</a></li>
                    <li><a href="#" id="btnPost">Create New Post</a></li>
                    <li><a href="#" id="btnComment">Review Comment</a></li>
                </ul>
            </div>
        </nav>

        <main class="container">
            <sql:query dataSource="${ds}" var="users">
                select * from User
            </sql:query>
            <div class="view-btnCategory" hidden>
                <h1>Create new category</h1>
                <div id="add-new-cat">
                    <div class="row"> 
                        <span class="col-md-2">name:</span> 
                        <input name="cat_name" type="text" class="boxCategory"/> 
                    </div>
                    <div class="row"> 
                        <span class="col-md-2">user can post in:</span> 
                        <select name="userid" class="boxCategory">
                            <c:forEach var="u" items="${users.rows}">
                                <option value="${u.id}">${u.username}</option>
                            </c:forEach> 
                        </select> 
                    </div>
                    <button id="btnAddCategory">Add</button>
                </div>
            </div>

            <div class="view-btnUser" hidden id="createuser">
                <h1>Create user section </h1>
                <div id="add-new-user">
                    <div class="row">
                        <span class="col-md-2"> username:</span> <input name="u_name" type="text" class="boxUser" />
                    </div>
                    <div class="row">
                        <span class="col-md-2">user nice name:</span> <input name="u_nicename" type="text" class="boxUser" />
                    </div>
                    <div class="row">
                        <span class="col-md-2">password:</span> <input name="u_password" type="password" class="boxUser"/>
                    </div>
                    <div class="row">
                        <span class="col-md-2">user role:</span> <select name="u_role" class="boxUser">
                            <option value="0">root</option>
                            <option value="1">editor</option>
                        </select> </div>
                    <br/>
                    <button id="btnAddUser">Create User</button>
                </div>
            </div>

            <div class="view-btnPost" hidden>
                <sql:query dataSource="${ds}" var="cats">
                    select * from category
                </sql:query>

                <h1>Publish new post</h1>
                <div id="add-new-Post">
                    title: <input name="p_title" type="text" id="posttitle"/> <br/>
                    <br/>
                    <span>content:</span>
                    <br/>
                    <textarea name="p_content" id="postcontent"></textarea><br/>
                    choose category: <select name="p_cat">
                        <c:forEach var="c" items="${cats.rows}">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <button id="btnSubmitPost">Submit</button>
                </div>
            </div>

            <div class="view-btnComment" hidden>
                <%@include file="include/review-comment-section.jsp" %>
            </div>
        </main>
        <%--logged in --%>
        <%}%>

        <script src="../js/jquery-3.1.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#adminOption > li > a').on('click', function () {
                    var thisBtn = $(this);
                    var currentSection = $('.view-' + thisBtn.attr('id'));
                    currentSection.show();
                    currentSection.siblings().hide();
                });
                $('#btnSubmitPost').on('click', function () {
                    $.ajax({
                        type: 'POST',
                        url: 'include/post.jsp',
                        data: {
                            u_name: $('input[name=uname]').val(),
                            u_nicename: $('input[name=u_nicename]').val(),
                            u_password: $('input[name=u_password]').val(),
                            u_role: $('select[name=u_role]').val()
                        },
                        success: function (html) {
                            alert("Success !");
                        },
                        error: function (x, opt, err) {
                            alert("Error !");
                        }
                    });
                });
                $('#btnAddUser').on('click', function () {
                    $.ajax({
                        type: 'POST',
                        url: 'include/user.jsp',
                        data: {
                            p_title: $('input[name=p_title]').val(),
                            p_content: $('textarea[name=p_content]').val(),
                            p_cat: $('select[name=p_cat]').val()
                        },
                        success: function (html) {
                            alert("Success !");
                        },
                        error: function (x, opt, err) {
                            alert("Error !");
                        }
                    });
                });
                $('#btnAddCategory').on('click', function () {
                    $.ajax({
                        type: 'POST',
                        url: 'include/category.jsp',
                        data: {
                            cat_name: $('input[name=cat_name]').val(),
                            userid: $('select[name=userid]').val()
                        },
                        success: function (html) {
                            alert("Success !");
                        },
                        error: function (x, opt, err) {
                            alert("Error !");
                        }
                    });
                });
                $('.confirmBtn').on('click', function () {
                    var thisBtn = $(this);
                    $.ajax({
                        type: 'POST',
                        url: 'include/comment.jsp',
                        data: {
                            comId: thisBtn.parent().siblings('.comId').text(),
                            status: thisBtn.siblings('select').val()
                        },
                        success: function (html) {
                            alert("Success !");
                            thisBtn.parent().parent().remove();
                        },
                        error: function (x, opt, err) {
                            alert("Error !");
                        }
                    });
                });
            });
        </script>
    </body>
</html>

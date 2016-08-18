<%-- 
    Document   : review-comment-section
    Created on : Aug 18, 2016, 7:16:06 AM
    Author     : bak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query dataSource="${ds}" var="pendingComments">
    select * from comment where status='pending';
</sql:query>

<h1>Review comment</h1>
<table class="table table-responsive">
    <thead>
    <th>Id</th>
    <th>User</th>
    <th>Content</th>
    <th>Action</th>
</thead>

<tbody>
<c:forEach items="${pendingComments.rows}" var='row'>
    <tr>
        <td class="comId">${row.id}</td>
        <td>${row.user}</td>
        <td>${row.content}</td>
        <td>
            <select>
                <option value="approved">Approve</option>
                <option value="remove">Remove</option>
            </select>
            <a class="btn btn-primary confirmBtn">Confirm</a> 
        </td>
    </tr>
</c:forEach>
</tbody>
</table>

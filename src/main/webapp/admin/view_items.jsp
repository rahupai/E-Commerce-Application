<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@page import="com.entity.ItemDtls"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Items</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>


	<table class="table table-striped">
		<thead class="bg-success text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Images</th>
				<th scope="col">Item Name</th>
				<th scope="col">Company</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
			List<ItemDtls> list = dao.getAllItems();
			for (ItemDtls it : list) {
			%>
			<tr>
				<td><%=it.getItemId()%></td>
				<td><img src="../items/<%=it.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=it.getItemName()%></td>
				<td><%=it.getCompany()%></td>
				<td><%=it.getPrice()%></td>
				<td><%=it.getItemCategory()%></td>
				<td><%=it.getStatus()%></td>
				<td><a href="edit_items.jsp?id=<%=it.getItemId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a> 
					<a href="../delete?id=<%=it.getItemId() %>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a></td>
			</tr>

			<%
			}
			%>




		</tbody>
	</table>
	<div style="margin-top: 280px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
<%@page import="com.entity.Item_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class="bg-success text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">EMail</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Item Name</th>
				<th scope="col">Company</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>

			<%
			ItemOrderImpl dao = new ItemOrderImpl(DBConnect.getConn());
			List<Item_Order> ilist = dao.getAllOrder();

			for (Item_Order i : ilist) {
			%>
			<tr>
				<th scope="row"><%=i.getOrderId() %></th>
				<td><%=i.getUserName() %></td>
				<td><%=i.getEmail() %></td>
				<td><%=i.getFulladd()%></td>
				<td><%=i.getPhno() %></td>
				<td><%=i.getItemName() %></td>
				<td><%=i.getCompany()%></td>
				<td><%=i.getPrice() %></td>
				<td><%=i.getPaymentType()%></td>
			</tr>

			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 300px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
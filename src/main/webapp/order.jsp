<%@page import="com.entity.Item_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Items</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-success text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Item Name</th>
					<th scope="col">Company</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");

				ItemOrderImpl dao = new ItemOrderImpl(DBConnect.getConn());
				List<Item_Order> ilist = dao.getItem(u.getEmail());

				for (Item_Order i : ilist) {
				%>
				<tr>
					<th scope="row"><%=i.getOrderId()%></th>
					<td><%=i.getUserName()%></td>
					<td><%=i.getItemName()%></td>
					<td><%=i.getCompany()%></td>
					<td><%=i.getPrice()%></td>
					<td><%=i.getPaymentType()%></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>

	</div>
</body>
</html>
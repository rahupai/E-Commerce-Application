<%@page import="com.entity.ItemDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	int iid = Integer.parseInt(request.getParameter("iid"));
	ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
	ItemDtls it = dao.getItemById(iid);
	%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="items/<%=it.getPhotoName() %>" style="height: 150px; width: 10	0px"><br>
				<h4 class="mt-3">
					Item Name: <span class="text-success"><%=it.getItemName() %></span>
				</h4>
				<h4>
					Company: <span class="text-success"><%=it.getCompany() %></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=it.getItemCategory() %></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=it.getItemName() %></h2>
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>



				</div>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Add Cart</a> <a href="" class="btn btn-danger"><i
						class="fas fa-rupee-sign"></i><%=it.getPrice() %></a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
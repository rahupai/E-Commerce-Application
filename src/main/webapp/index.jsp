<%@page import="com.entity.User"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@page import="com.entity.ItemDtls"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ApnaStore: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/stationary3.jpg");
	height: 65vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>


	<div class="container-fluid back-img">
		<h2 class="text-center text-primary">Ecommerce Application</h2>
	</div>

	<div class="container mt-3">
		<h3 class="text-center">Stationary</h3>
		<div class="row">

			<%
			ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
			List<ItemDtls> list = dao.getStationaryItem();
			for (ItemDtls it : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=it.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=it.getItemName()%></p>
						<p><%=it.getCompany()%></p>
						<p>
							Categories:<%=it.getItemCategory()%></p>
						<div class="row ">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							} else {
							%>
							<a href="cart1?iid=<%=it.getItemId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-cart-plus"></i>Add Cart</a>

							<%
							}
							%>



							<a href="view_items.jsp?iid=<%=it.getItemId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=it.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<br>
		<div class="text-center mt-1">
			<a href="all_Stationary_item.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>

	<hr>

	<!-- notebook -->
	<div class="container">
		<h3 class="text-center">Notebooks</h3>
		<div class="row">

			<%
			ItemDAOImpl dao4 = new ItemDAOImpl(DBConnect.getConn());
			List<ItemDtls> list4 = dao4.getNoteBookItem();
			for (ItemDtls it : list4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=it.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=it.getItemName()%></p>
						<p><%=it.getCompany()%></p>
						<p>
							Categories:<%=it.getItemCategory()%></p>
						<div class="row ">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"></i>Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?iid=<%=it.getItemId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"></i>Add Cart</a>
							<%
							}
							%>




							<a href="view_items.jsp?iid=<%=it.getItemId()%>"
								class="btn btn-success btn-sm ml-1">View Detail</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=it.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<br>
		<div class="text-center mt-1">
			<a href="all_Notebook_item.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>

	<hr>

	<div class="container">
		<h3 class="text-center">Books</h3>
		<div class="row">

			<%
			ItemDAOImpl dao3 = new ItemDAOImpl(DBConnect.getConn());
			List<ItemDtls> list3 = dao3.getBookItem();
			for (ItemDtls it : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=it.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=it.getItemName()%></p>
						<p><%=it.getCompany()%></p>
						<p>
							Categories:<%=it.getItemCategory()%></p>
						<div class="row ">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"></i>Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart2?iid=<%=it.getItemId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"></i>Add Cart</a>
							<%
							}
							%>
							
							
							
							
							<a href="view_items.jsp?iid=<%=it.getItemId()%>"
								class="btn btn-success btn-sm ml-1">View Detail</a> 
							
							<a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=it.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>


			<%
			}
			%>


		</div>
		<br>
		<div class="text-center mt-1">
			<a href="all_Books_item.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
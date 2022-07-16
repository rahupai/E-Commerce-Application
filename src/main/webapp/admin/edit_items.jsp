<%@page import="com.entity.ItemDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Items</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Items</h4>

						

                         <%
						int id = Integer.parseInt(request.getParameter("id"));
						ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
						ItemDtls it = dao.getItemById(id);
						%>
                         

						<form action="../edititems" method="post">
							<input type="hidden" name="id" value="<%=it.getItemId()%>">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Item Name*</label> <input
									name="iname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=it.getItemName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Company Name*</label> <input
									name="company" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=it.getCompany()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=it.getPrice()%>">
							</div>							

							<div class="form-group">
								<label for="inputState"> Item Status </label> <select
									id="inputstate" name="status" class="form-control">
									<%
									if ("Active".equals(it.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 text-center p-5 mt-5">
				 <div class="text-primary mt-5">
				 <i class="fas fa-user-circle fa-10x"></i>
				 </div>
				 
			</div>
			
			<div class="col-md-6 p-3 mt-5">
			 <div class="card">
			  <div class="card-body">
			  <h3 class="text-center text-success">Your Profile</h3>
			    <form action="" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}">
							</div>	
							<a href="setting.jsp" class="btn btn-success btn-lg btn-block">Back</a>
						</form>
			  </div>
			 </div>
			</div>
		</div>
	</div>
</body>
</html>
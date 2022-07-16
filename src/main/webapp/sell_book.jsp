<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
    
    <div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					   <h4 class="text-center p-1">Sell Items</h4>
					    
						<form action="" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Item Name*</label> <input
									name="iname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Company Name*</label> <input
									name="company" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="iimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #4caf50"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-primary">
			<h3>
				<i class="fas fa-shopping-cart"></i> ApnaStore
				<!--  <i class="fas fa-store"></i>ApnaStore-->
			</h3>


		</div>
		<div class="col-md-6">
			
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-3">
			
               <a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i> <span class="text-primary h5 mr-2 ">CART</span></a>			     
			 
				<a href="view_profile.jsp" class="btn btn-success"><i
					class="fas fa-user-plus"></i> ${userobj.name}</a> 
				
				<a href="logout"
					class="btn btn-primary text-white"><i
					class="fas fa-sign-in-alt"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a> <a href="register.jsp"
					class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>
					Register</a>
			</div>

		</c:if>

	</div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_Stationary_item.jsp"><i
					class="fas fa-pencil-ruler fa-lg"></i> Stationary</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_Notebook_item.jsp"><i class="fas fa-book-open fa-lg"></i>
					Notebooks</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_Books_item.jsp"><i class="fas fa-book fa-lg"></i>
					Books</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit">
				<i class="fas fa-cog"></i> Setting
			</a>
			
			
		</form>
	</div>
</nav>
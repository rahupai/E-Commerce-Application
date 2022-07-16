<%@page import="com.entity.User"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@page import="com.entity.ItemDtls"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notebooks</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}	 



</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>

<c:if test="${not empty addCart }">

	   <div id="toast"> ${addCart} </div>

	   <script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
	 </script>

<c:remove var="addCart" scope="session"/>
</c:if>



	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			ItemDAOImpl dao4 = new ItemDAOImpl(DBConnect.getConn());
			List<ItemDtls> list4 = dao4.getAllNoteBook();
			for (ItemDtls it : list4) 
			{%>
			    <div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=it.getPhotoName() %>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=it.getItemName() %></p>
						<p><%=it.getCompany() %></p>
						<p>Categories:<%=it.getItemCategory() %></p>
						<div class="row ">
						
						  <%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"></i>Add Cart</a>
							<%
							} else {
							%>
                            <a href="cart?iid=<%=it.getItemId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"></i>Add Cart</a>  
							<%
							}
							%>
						   
						   <a href="view_items.jsp?iid=<%=it.getItemId()%>" class="btn btn-success btn-sm ml-1">View Detail</a> 
						   
						   <a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i><%=it.getPrice() %></a>
						</div>
					</div>
				</div>
			</div>
			    	
				
			<%}
        %>		
			
		</div>
	</div>
</body>
</html>
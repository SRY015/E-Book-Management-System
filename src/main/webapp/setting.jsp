<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting Page</title>
<%@ include file="all_components/allCss.jsp"%>
<style type="text/css">
a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	if (u == null) {
		response.sendRedirect("login.jsp");
	}else{ %>
		<h3 class="text-center mt-1">Hi,<%=u.getName() %></h3>
	<%}
	%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-book-open-reader fa-3x"></i><br> <br>
							<h4 class="text-dark">Sell Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_oldbook.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-book-open-reader fa-3x text-dark"></i><br> <br>
							<h4 class="text-dark">Edit Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-user-pen fa-3x"></i><br> <br>
							<h5 class="text-dark">Login & Security(Edit Profile)</h5>
						</div>
					</div>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<a href="edit_address.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-map-location fa-3x text-warning"></i><br>
							<br>
							<h4 class="text-dark">Your Address</h4>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="user_order.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-box-open fa-3x text-danger"></i> <br>
							<br>
							<h4 class="text-dark">My Order</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="helpline.jsp">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-hand-holding-hand fa-3x text-success"></i>
							<br> <br>
							<h4 class="text-dark">Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>

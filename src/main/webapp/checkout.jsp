<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="all_components/navbar.jsp"%>

	<%
	String succMsg = (String) session.getAttribute("succMsg");
	if (succMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=succMsg %></div>
	<%
	}
	String failedMsg = (String)session.getAttribute("failedMsg");
	if(failedMsg != null){%>
	<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
	<%}
	session.removeAttribute("succMsg");
	session.removeAttribute("failedMsg");
	%>
	
	
	

	<%
	User u = (User) session.getAttribute("userobj");
	if (u == null) {
		response.sendRedirect("login.jsp");
	}else{%>
	<div class="container">
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card bg-white pt-4">
					<h3 class="text-center text-success">Your Selected Items</h3>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u1 = (User) session.getAttribute("userobj");
								if (u1 == null) {
									response.sendRedirect("login.jsp");
								} else {
									CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
									List<Cart> cart = dao.getBookByUser(u1.getId());
									int size = cart.size();
									int i = 0;
									double tp = 0.0;
									for (Cart c : cart) {
										i++;
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?cid=<%=c.getCid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								tp = c.getTotalPrice();
								}
								if (i == size) {
								%>
								<tr>
									<td><h4>Total Price</h4></td>
									<td></td>
									<td></td>
									<td><h4><%=tp%></h4></td>
								</tr>
								<%
								}
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card bg-white pt-4">
					<h3 class="text-center text-success">Your Details for Order</h3>
					<div class="card-body">
						<form action="order">
						<input type="hidden" value="<%=u1.getId() %>" name="userId">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="userName"
										class="form-control" id="inputEmail4" value="<%=u.getName() %>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email" name="userEmail"
										class="form-control" id="inputPassword4" value="<%=u.getEmail() %>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No.</label> <input
										type="number" name="phoneNo" class="form-control" id="inputEmail4" value="<%=u.getPhno() %>">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="address"
										class="form-control" id="inputPassword4" value="" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text" name="landMark"
										class="form-control" id="inputEmail4" value="" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text" name="city"
										class="form-control" id="inputPassword4" value="" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text" name="state"
										class="form-control" id="inputEmail4" value="" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="number" name="pin"
										class="form-control" id="inputPassword4" value="" required>
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="payment">
									<option value="noselect">--select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning">Order Now</button> <a
									href="index.jsp" class="btn btn-success">Continue Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<%}
	%>

	

</body>
</html>
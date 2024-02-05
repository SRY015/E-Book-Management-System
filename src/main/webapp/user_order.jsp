<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Track Order</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>

	<%
	User u = (User)session.getAttribute("userobj");
	if(u == null){
		response.sendRedirect("login.jsp");
	}else{ %>

	<div class="container mt-4 text-center">
		<h3 class="text-primary">Your Orders</h3>
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Payment type</th>
						</tr>
					</thead>
					<tbody>
						<%
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> blist = dao.getBooksByEmail(u.getEmail());
					for(Book_Order b : blist){ %>
						<tr>
							<th scope="row"><%=b.getorderId() %></th>
							<td><%=b.getUserName() %></td>
							<td><%=b.getBookName() %></td>
							<td><%=b.getAuthor() %></td>
							<td><%=b.getPrice() %></td>
							<td><%=b.getPaymentType() %></td>

						</tr>
						<%}
					%>
					</tbody>
				</table>
			</div>
		</div>

	</div>

	<%}
	%>


	<%@include file="all_components/footer.jsp"%>
</body>
</html>
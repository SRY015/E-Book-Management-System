<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Orders</title>
<%@include file="admin/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="admin/navbar.jsp"%>
	<%
	User u = (User)session.getAttribute("userobj");
	if(u == null){
		response.sendRedirect("login.jsp");
	}else{%>
		<h2 class="text-center">Hello, Admin</h2>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
		<%
		BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
		List<Book_Order> blist = dao.getAllOrders();
		for(Book_Order b : blist){%>
			<tr>
				<th scope="row"><%=b.getorderId() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
			</tr>
		<%}
		%>
			
		
		</tbody>
	</table>
	<%}
	%>
	
	<%@include file="admin/footer.jsp"%>
</body>
</html>
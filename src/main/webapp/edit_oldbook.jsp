<%@page import="com.entity.Book_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit:Old Books</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>
	
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
User u = (User)session.getAttribute("userobj");
if(u == null){
	response.sendRedirect("login.jsp");
}else{%>

	<div class="container mt-5 bg-white">
		<table class="table">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			<%
			String email = u.getEmail();
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list = dao.getOldBookById(email);
			for(Book_dtls d : list){%>
			<tr>
					<th scope="row"><%=d.getBookName() %></th>
					<td><%=d.getAuthor() %></td>
					<td><%=d.getPrice() %></td>
					<td><%=d.getBookCategory() %></td>
					<td><a href="delete_old_book?id=<%=d.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				
			<%}
			%>
			</tbody>
		</table>

	</div>
	<%}
%>


	<%@include file="all_components/footer.jsp"%>
</body>
</html>
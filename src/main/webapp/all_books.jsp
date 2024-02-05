<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book_dtls"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All_Books</title>
<%@include file="admin/allCss.jsp"%>
</head>
<body>
	<%@include file="admin/navbar.jsp"%>
	<%
	 User u = (User)session.getAttribute("userobj");
	if(u == null){
		response.sendRedirect("login.jsp");
	}
	%>
	<h2 class="text-center">Hello, Admin</h2>
	<%
	String Succmsg = (String) session.getAttribute("succMsg");
	if (Succmsg != null) {
		out.print("<h5>" + Succmsg + "</h5>");
		request.getSession().removeAttribute("succMsg");
	}
	%>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list = dao.getAllBooks();
			for (Book_dtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img alt="" src="Booksimg/<%=b.getPhotoName()%>"
					style="width: 50px;"></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus() %></td>
				<td><a href="edit_books.jsp?id=<%= b.getBookId() %>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a href="delete?id=<%= b.getBookId() %>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%@include file="admin/footer.jsp"%>
</body>
</html>
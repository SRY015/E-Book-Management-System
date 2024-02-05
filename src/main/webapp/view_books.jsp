<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.Book_dtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>
	
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl b = new BookDAOImpl(DBConnect.getConn());
	Book_dtls book = b.getBookById(bid);
	
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Booksimg/<%=book.getPhotoName() %>" style="height:150px; width:150px;" />
				<h5 class="mt-3">Book Name: <span class="text-success"><%=book.getBookName() %></span></h5>
				<h5>Author Name: <span class="text-success"><%=book.getAuthor() %></span></h5>
				<h5>Catagory: <span class="text-success"><%=book.getBookCategory() %></span></h5>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
			<h2><%=book.getBookName() %></h2>
			<%
				if(book.getBookCategory().equals("Old Book")){ %>
					<h4 class="text-primary">Contact To Seller</h4>
					<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%= book.getEmail() %></h5>
			<%	}
			%>
				
				<div class="row mt-3">
					<div class="col-md-4 text-center text-danger">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger">
						<i class="fa-solid fa-truck-moving fa-2x"></i>
						<p>Free Delivery</p>
					</div>
				</div>
				<div class="text-center mt-2">
				<%
				if("Old Book".equals(book.getBookCategory())){ %>
				<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a>	
				<%}else{ %>
				<%
							User u = (User)session.getAttribute("userobj");
						if (u == null) {
						%>
						<a href="login.jsp"><button type="button"
								class="btn btn-danger">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</button></a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=bid%>&&uid=<%=u.getId()%>"><button
								type="button" class="btn btn-success">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</button></a>
						<%
						}
						%>
				<% } %>
				<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice() %></a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
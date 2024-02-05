<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.Book_dtls"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="all_components/allCss.jsp"%>
<style>
.back-img {
	background: url("img/book.avif");
	height: 45vh;
	weidth: 100%;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@ include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">EBook Management System</h2>
	</div>
	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center mt-2">Recent Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list2 = dao2.getRecentBook();
			int j = 0;
			for (Book_dtls b1 : list2) {
				if (j < 4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem;">
					<img class="card-img-top ml-5"
						src="Booksimg/<%=b1.getPhotoName()%>" alt="Card image cap"
						style="height: 250px; width: 200px;">
					<div class="card-body text-center">
						<p class="card-text"><%=b1.getBookName()%></p>
						<p class="cart-text"><%=b1.getAuthor()%></p>
						<p class="cart-text">
							Categories :
							<%=b1.getBookCategory()%></p>
						<%
						if (b1.getBookCategory().equals("Old Book")) {
						%>
						<a href="view_books.jsp?bid=<%=b1.getBookId()%>"><button
								type="button" class="btn btn-success">View</button></a>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b1.getPrice()%>
						</button>
						<%
						} else {	
						%>
						
						<%
						if (u == null) {
						%>
						<a href="login.jsp"><button type="button"
								class="btn btn-danger">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</button></a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=u.getId()%>"><button
								type="button" class="btn btn-danger">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</button></a>
						<%
						}
						%>
						
						<a href="view_books.jsp?bid=<%=b1.getBookId()%>"><button
								type="button" class="btn btn-success">View</button></a>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b1.getPrice()%>
						</button>
						<%
						}
						j++;
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center p-3">
			<a href="all-recent-books.jsp" class="btn btn-danger ">View All</a>
		</div>
	</div>
	<!-- Recent Book End -->

	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center mt-2">New Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list = dao.getNewBook();
			int k = 0;
			for (Book_dtls b : list) {
				if (k < 4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem;">
					<img class="card-img-top ml-5 p-2"
						src="Booksimg/<%=b.getPhotoName()%>" alt="Card image cap"
						style="height: 250px; width: 200px;">
					<div class="card-body text-center">
						<p class="card-text"><%=b.getBookName()%></p>
						<p class="cart-text"><%=b.getAuthor()%></p>
						<p class="cart-text">
							Categories :
							<%=b.getBookCategory()%></p>

						<%
						if (u == null) {
						%>
						<a href="login.jsp"><button type="button"
								class="btn btn-danger">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</button></a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"><button
								type="button" class="btn btn-danger">
								<i class="fa-solid fa-cart-plus"></i> Add Cart
							</button></a>
						<%
						}
						%>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>"><button
								type="button" class="btn btn-success">View</button></a>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b.getPrice()%>
						</button>
					</div>
				</div>
			</div>
			<%
			}
			k++;
			}
			%>
		</div>
		<div class="text-center p-3">
			<a href="all-new-books.jsp" class="btn btn-danger ">View All</a>
		</div>
	</div>
	<!-- Start old Book -->
	<div class="container">
		<h3 class="text-center mt-2">Old Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list3 = dao3.getOldBook();
			int i = 0;
			for (Book_dtls b3 : list3) {
				if (i < 4) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho" style="width: 18rem;">
					<img class="card-img-top ml-5 p-2"
						src="Booksimg/<%=b3.getPhotoName()%>" alt="Card image cap"
						style="height: 250px; width: 200px;">
					<div class="card-body text-center">
						<p class="card-text"><%=b3.getBookName()%></p>
						<p class="cart-text"><%=b3.getAuthor()%></p>
						<p class="cart-text">
							Categories :
							<%=b3.getBookCategory()%></p>
						<a href="view_books.jsp?bid=<%=b3.getBookId()%>"><button
								type="button" class="btn btn-success">View</button></a>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b3.getPrice()%>
						</button>
					</div>
				</div>
			</div>
			<%
			}
			i++;
			}
			%>
		</div>
		<div class="text-center p-3" style="margin-bottom: 100px;">
			<a href="all-old-books.jsp" class="btn btn-danger ">View All</a>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>
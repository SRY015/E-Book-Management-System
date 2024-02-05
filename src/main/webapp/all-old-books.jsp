<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.Book_dtls"%>
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
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">


	<%@ include file="all_components/navbar.jsp"%>

	<!-- Start old Book -->
	<div class="container">
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list3 = dao3.getOldBook();
			for (Book_dtls b3 : list3) {
			%>
			<div class="col-md-3 mt-2">
				<div class="card crd-ho" style="width: 287px; height: 350px;">
					<img class="card-img-top ml-5 p-2"
						style="height: 150px; width: 200px;"
						src="Booksimg/<%=b3.getPhotoName()%>" alt="Card image cap"
						style="height: 250px; width: 200px;">
					<div class="card-body text-center">
						<p class="card-text"><%=b3.getBookName()%></p>
						<p class="cart-text"><%=b3.getAuthor()%></p>
						<p class="cart-text">
							Categories :
							<%=b3.getBookCategory()%></p>
						<a href="view_books.jsp?bid=<%=b3.getBookId()%>"><button type="button" class="btn btn-success">View</button></a>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b3.getPrice()%>
						</button>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>
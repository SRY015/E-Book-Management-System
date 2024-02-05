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

	<!-- Start Recent Book -->
	<div class="container">
		<div class="row">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list2 = dao2.getBookBySearch(ch);
			for (Book_dtls b1 : list2) {
			%>
			<div class="col-md-3 mt-2 mb-2">
				<div class="card crd-ho" style="width: 287px;">
					<img class="card-img-top ml-5 p-2" style="height: 150px; width: 200px;"
						src="Booksimg/<%=b1.getPhotoName()%>" alt="Card image cap"
						style="height: 250px; width: 200px;">
					<div class="card-body text-center">
						<p class="card-text"><%=b1.getBookName()%></p>
						<p class="cart-text"><%=b1.getAuthor()%></p>
						<p class="cart-text">
							Categories :
							<%=b1.getBookCategory()%></p>
						<% if(b1.getBookCategory().equals("Old Book")){ %>
						<button type="button" class="btn btn-success">View</button>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b1.getPrice()%>
						</button>
						<% } else{ %>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-cart-plus"></i> Add Cart
						</button>
						<button type="button" class="btn btn-success">View</button>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b1.getPrice()%>
						</button>
						<% } %>

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
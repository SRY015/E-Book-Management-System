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
.crd-ho:hover {
	background-color: #fcf7f7;
}
/* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
	visibility: hidden; /* Hidden by default. Visible on click */
	min-width: 250px; /* Set a default minimum width */
	margin-left: -125px; /* Divide value of min-width by 2 */
	background-color: #333; /* Black background color */
	color: #fff; /* White text color */
	text-align: center; /* Centered text */
	border-radius: 2px; /* Rounded borders */
	padding: 16px; /* Padding */
	position: fixed; /* Sit on top of the screen */
	z-index: 1; /* Add a z-index if needed */
	left: 50%; /* Center the snackbar */
	bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
	visibility: visible; /* Show the snackbar */
	/* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@ include file="all_components/navbar.jsp"%>

	<!-- Start New Book -->
	<div class="container">

		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<Book_dtls> list = dao.getNewBook();
			for (Book_dtls b : list) {
			%>
			<div class="col-md-3 mt-2">
				<div class="card crd-ho" style="width: 287px; height: 350px;">
					<img class="card-img-top ml-5 p-2"
						style="height: 150px; width: 200px;"
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
						<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success">View</a>
						<button type="button" class="btn btn-danger">
							<i class="fa-solid fa-indian-rupee-sign"></i>
							<%=b.getPrice()%>
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
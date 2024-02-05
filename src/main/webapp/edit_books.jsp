<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Book_dtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add_books</title>
<%@include file="admin/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="admin/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3 offset-3">
				<div class="card p-2" style="width: 600px;">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						<%
						String failedmsg = (String) session.getAttribute("failedMsg");
						String Succmsg = (String) session.getAttribute("succMsg");
						 if (failedmsg != null) {
							out.print("<h5>" + failedmsg + "</h5>");
							request.getSession().removeAttribute("failedMsg");
						}
						%>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						Book_dtls b = dao.getBookById(id);
						%>
						<form action="edit_books" method="post">
						<input type="hidden" name="id" value=<%=b.getBookId() %>>
							<div class="form-group">
								<label for="bname">Book Name* : </label> <input name="bname"
									type="text" class="form-control" value=<%=b.getBookName()%>>
							</div>
							<div class="form-group">
								<label for="aname">Author Name* : </label> <input name="aname"
									type="text" class="form-control" value=<%=b.getAuthor()%>>
							</div>
							<div class="form-group">
								<label for="price">Price* : </label> <input name="price"
									type="number" class="form-control" value=<%=b.getPrice()%>>
							</div>
							<div class="form-group">
								<label for="bstatus">Book Status* : </label> <select
									class="form-control" name="bstatus">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="admin/footer.jsp"%>
</body>
</html>
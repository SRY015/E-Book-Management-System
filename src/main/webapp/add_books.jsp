<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add_books</title>
<%@include file="admin/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="admin/navbar.jsp"%>
	<%
	 User u = (User)session.getAttribute("userobj");
	if(u == null){
		response.sendRedirect("login.jsp");
	}
	%>
		<div class="container">
			<div class="row">
				<div class="col-md-3 offset-3">
					<div class="card p-2" style="width: 600px;">
						<div class="card-body">
							<h4 class="text-center">Add Book</h4>
							<%
							String failedmsg = (String) session.getAttribute("failedMsg");
							String Succmsg = (String) session.getAttribute("succMsg");
							if (Succmsg != null) {
								out.print("<h5>" + Succmsg + "</h5>");
								request.getSession().removeAttribute("succMsg");
							} else if (failedmsg != null) {
								out.print("<h5>" + failedmsg + "</h5>");
								request.getSession().removeAttribute("failedMsg");
							}
							%>
							<form action="add_books" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<label for="bname">Book Name* : </label> <input name="bname"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<label for="aname">Author Name* : </label> <input name="aname"
										type="text" class="form-control">
								</div>
								<div class="form-group">
									<label for="price">Price* : </label> <input name="price"
										type="number" class="form-control">
								</div>
								<div class="form-group">
									<label for="bcategory">Book Category* : </label> <select
										class="form-control" name="bcategory">
										<option selected>--select--</option>
										<option>New Book</option>
									</select>
								</div>
								<div class="form-group">
									<label for="bstatus">Book Status* : </label> <select
										class="form-control" name="bstatus">
										<option selected>--select--</option>
										<option>Active</option>
										<option>Inactive</option>
									</select>
								</div>
								<div class="form-group">
									<label for="photo">Upload photo:</label> <input type="file"
										name="bimg" class="form-control-file">
								</div>
	
								<button type="submit" class="btn btn-primary">Add</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@include file="admin/footer.jsp"%>
</body>
</html>
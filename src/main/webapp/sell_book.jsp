<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="all_components/navbar.jsp"%>
<%
 User user =(User)session.getAttribute("userobj");
if(user == null){
	response.sendRedirect("login.jsp");
}else{ %>
	<div class="container mt-3">
	<div class="row">
		<div class="col-md-3 offset-3">
			<div class="card p-2" style="width:600px;">
				<div class="card-body">
					<h4 class="text-center text-primary">Sell Book</h4>
					<%
							String succMsg = (String)session.getAttribute("succMsg");
							if(succMsg != null){%>
								<h4 class="text-success" style="margin-left:125px;"><%=succMsg %></h4>
								<%
								request.getSession().removeAttribute("succMsg");
							}
						%>
					
					<form action="AddOldBook" method="post"
						enctype="multipart/form-data">
						<input type="hidden" value="<%=user.getEmail()%>" name="email"/>
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
							<label for="photo">Upload photo:</label> <input type="file"
								name="bimg" class="form-control-file" required>
						</div>

						<button type="submit" class="btn btn-primary text-center">Sell</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%
}
%>

<%@include file="all_components/footer.jsp"%>
</body>
</html>
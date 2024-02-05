<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit_Profile</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="all_components/navbar.jsp"%>

<%
User u = (User)session.getAttribute("userobj");
if(u == null){
	response.sendRedirect("Login.jsp");
}else{%>
	<div class="container mt-3">
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
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-3 text-primary">Edit Profile</h4>
						
						<form action="updateprofile" method="post">
						<input type="hidden" name="id" value="<%=u.getId() %>">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name</label> <input
									type="text" name="fname" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=u.getName() %>" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=u.getEmail() %>" required> 
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone number</label> <input
									type="number" name="phno" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=u.getPhno() %>" required> 
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1" required>
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="all_components/footer.jsp"%>
	
	<%}
%>

</body>
</html>
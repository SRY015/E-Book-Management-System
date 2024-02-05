<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook:login</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5 mb-5 p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="class-body p-3">
						<h4 class="text-center">Please Sign Up!</h4>
						
						<form action="loginPage" method="post">
						<%
							String failedMsg = (String)session.getAttribute("failedMsg");
							if(failedMsg != null){
								out.print("<h4>"+failedMsg+"</h4>");
								request.getSession().removeAttribute("failedMsg");
							}
						%>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1" required="required">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
						<br> <a href="register.jsp">Create New Account</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="all_components/footer.jsp"%>
</body>
</html>
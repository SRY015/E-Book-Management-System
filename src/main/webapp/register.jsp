<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Book:Register</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-3">Please Register</h4>
						<%
							String failedmsg = (String)session.getAttribute("failedMsg");
							String Succmsg = (String)session.getAttribute("succMsg");
							if(Succmsg != null){
								out.print("<h5>"+Succmsg+"</h5>");
								request.getSession().removeAttribute("succMsg");
							}else if(failedmsg != null){
								out.print("<h5>"+failedmsg+"</h5>");
								request.getSession().removeAttribute("failedMsg");
							}
							
						%>
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter full name</label> <input
									type="text" name="fname" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone number</label> <input
									type="number" name="phno" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									phone number with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1" required>
							</div>
							<div class="form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and Conditions.</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>
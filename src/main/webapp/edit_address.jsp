<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="card mt-4" style="width:600px; margin: 0 auto;">
			<div class="card-body">
			<h4 class="text-center text-success">Add Address</h4>
			<form action="">
			
			<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">Pin</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
							</div>
							<div class="text-center ">
								<a href="" class="btn btn-warning text-white">Add Address</a>
							</div>
			</form>
			</div>
		</div>
	</div>


	<%@include file="all_components/footer.jsp"%>
</body>
</html>
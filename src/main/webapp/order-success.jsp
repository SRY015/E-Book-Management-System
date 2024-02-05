<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_components/allCss.jsp"%>
<title>Order:Success Page</title>
</head>
<body style="background-color: #f0f1f2;">
<%@ include file="all_components/navbar.jsp"%>
<div class="container-fluid">
<div class="row mt-5">
<div class="col-md-3"></div>
<div class="col-md-6 text-center">
<img alt="" src="https://static.wixstatic.com/media/f758ab_91e99a17bbfa45e5965887bef7634195~mv2.gif" style="height:150px; border-radius:40px;">

<h2>Thank You</h2>
<h3>Your Order Placed Successfully</h3>
<h5>With in 7 days Your Product will be Delivered In your Address</h5>
<div class="text-center">
<a href="index.jsp" class="btn btn-primary">Home</a>
<a href="user_order.jsp" class="btn btn-danger text-light">View Order</a>
</div>
</div>
<div class="col-md-3"></div>
</div>
</div>
</body>
</html>
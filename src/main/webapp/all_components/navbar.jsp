<%@page import="com.entity.User"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book-open-reader"></i> Ebook
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
			<%
			User us = (User) session.getAttribute("userobj");
			if (us != null) {
			%>
			<a href="checkout.jsp" class="btn"><img alt="" src="https://media0.giphy.com/media/LOL2XB5O5slfFE4K3M/giphy.gif?cid=6c09b952p0k2qauzfm0s6p3s9xsjjhsedzf76ppv5y44cboj&ep=v1_stickers_related&rid=giphy.gif&ct=s" style="height:40px; width:40px;"></a> <a href="login.jsp"
				class="btn btn-success"><i class="fa-solid fa-user-plus"></i> <%=us.getName()%></a>
			<a href="logout" class="btn btn-primary text-white"><i
				class="fa-solid fa-right-to-bracket"></i> LogOut</a>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				href="register.jsp" class="btn btn-primary text-white"><i
				class="fa-solid fa-user-plus"></i> Register</a>
			<%
			}
			%>

		</div>

	</div>

</div>





<nav class="navbar navbar-expand-lg navbar-dark bg-custom">


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house-chimney"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all-recent-books.jsp"><i class="fa-solid fa-book"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all-new-books.jsp"><i class="fa-solid fa-book"></i> New
					Book</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all-old-books.jsp"><i class="fa-solid fa-book-open"></i>
					Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light mr-2"><i
				class="fa-solid fa-gears"></i>Setting</a>

			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-address-book"></i> Contact Us
			</button>
		</form>
	</div>
</nav>
<%@ page import="com.entity.User"%>
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
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<%
		User us = (User) session.getAttribute("userobj");
		if (us != null) {
		%>
		<a href="#" class="btn btn-success"><i class="fa-solid fa-user"></i>
			<%=us.getName()%></a> <a href=""
			class="btn btn-primary text-white ml-1" data-toggle="modal" data-target="#exampleModalCenter"><i
			class="fa-solid fa-right-from-bracket"></i> LogOut</a>
		<%
		} else {
		%>
		<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				href="register.jsp" class="btn btn-primary text-white"><i
				class="fa-solid fa-user-plus"></i> Register</a>
		</div>
		<%
		}
		%>

	</div>

</div>

<!-- Logout Modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Alert !!</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<h4>Do you want to logOut !!</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="logout" class="btn btn-primary">LogOut</a>
			</div>
		</div>
	</div>
</div>


<!-- end Logout Modal -->





<nav class="navbar navbar-expand-lg navbar-dark bg-custom"
	style="background-color: #303f9f;">


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="adminhome.jsp"><i class="fa-solid fa-house-chimney"></i>
					Home <span class="sr-only">(current)</span> </a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-light my-2 my-sm-0 mr-2" type="submit">
				<i class="fa-solid fa-gears"></i> Setting
			</button>
			<button class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-address-book"></i> Contact Us
			</button>
		</form>
	</div>
</nav>
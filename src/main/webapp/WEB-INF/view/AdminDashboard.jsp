<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Bootstrap CSS -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
	
</script>


<title>HomePage</title>
<style type="text/css">
@media only screen and (max-width: 767px) {
	.carousel-inner img {
		width: 100vw;
	}
}

.nav-link:hover {
	background-color: purple;
	cursor: pointer;
}

.navbar-brand:hover {
	background-color: blue;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0; /* remove the gap so it doesn't close */
}

td:hover {
	background-color: purple;
	cursor: pointer;
}

.icn {
	height: 3vh;
	width: 2vw;
	margin: 2%;
}

.icn:hover {
	cursor: pointer;
}

.footer {
	bottom: 0;
	text-align: center;
	background-color: black;
	color: white;
	height: 10vh;
	width: 100vw;
	text-align: center;
}

span:hover {
	cursor: pointer;
}

#dashboard {
	background-color: black;
	width: 15vw;
	height: 100vh;
	background-color: black;
}

#dashboard .logout:hover {
	background-color: red;
}

#dashboard a {
	padding-left: 10px;
	float: left;
	margin: 10px;
	text-decoration: none;
	color: white;
	margin: 10px;
	float: left;
}

#dashboard a:hover {
	background-color: purple;
	width: 12vw;
}

#logout:hover {
	background-color: red;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<c:url var="image" value="/resources/image/17973908.jpg"></c:url>

<body style="background-image: url('${image}');">

	<c:set var="sesemail" scope="session" value="${sesemail}" />

	<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text :${sesemail},
				icon : "success"
			});
		</script>

	<c:remove var="sesemail" scope="session" />
	<!--  -->
	<c:set var="sesupdate" scope="session" value="${sesupdate}" />
	<c:if test="${sesupdate=='success'}">
		<script type="text/javascript">
			swal("Success", "Update success");
		</script>
	</c:if>
	<c:remove var="sesupdate" scope="session" />
	<!--  -->
	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog=='success'}">
		<script type="text/javascript">
		Swal.fire({
			title : "Success",
			text :"Login success",
			icon : "success"
		});
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />

	<!--  -->
	<c:set var="fadd" scope="session" value="${fadd}" />
	<c:if test="${fadd=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text :"Food added successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="fadd" scope="session" />
	<!--  -->
	<c:set var="fupdate" scope="session" value="${fupdate}" />
	<c:if test="${fupdate=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text :"Food updated successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="fupdate" scope="session" />
	<!--  -->
	<c:set var="fdelete" scope="session" value="${fdelete}" />
	<c:if test="${fdelete=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text :"Food deleted successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="fdelete" scope="session" />
	<!--  -->
	<c:set var="sesdelete" scope="session" value="${sesdelete}" />
	<c:if test="${sesdelete=='success'}">
		<script type="text/javascript">
			swal("Success", "Deleted successfully");
		</script>
	</c:if>
	<c:remove var="sesdelete" scope="session" />

	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#tablesection").hide();
			$("#uploadfilesection").hide();
			$("#uploadpicturesection").hide();
			$("#uploadProfilePicture").click(function() {
				$("#uploadpicturesection").show();
				$("#uploadfilesection").hide();
				$("#tablesection").hide();
			});
			$("#tableid").click(function() {
				$("#tablesection").show();
				$("#uploadfilesection").hide();
				$("#uploadpicturesection").hide();
			});
			$("#uploadid").click(function() {
				$("#tablesection").hide();
				$("#uploadfilesection").show();
				$("#uploadpicturesection").hide();
			});

		});

		/* function myFunction() {
		 var x = document.getElementById("dashboard");

		 if (x.style.display === "block") {
		 x.style.display = "none";
		 } else {
		 x.style.display = "block";
		 }
		 } */
	</script>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<!-- <img src="image\icons8-library-64.png" alt="Librarylogo"> <a
				class="navbar-brand" href="#">Library</a> -->

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ">
				<li class="nav-item active"><a class="nav-link" href="#">About
						us </a></li>
				<li class="nav-item active"><a class="nav-link" href="addFood">Add
						food item </a></li>
				<li class="nav-item active"><a class="nav-link" id="tableid">View
						users</a></li>

			</ul>
		</div>
		<h4>
			<a id="logout" href="alogout"
				style="color: white; cursor: pointer; text-decoration: none;">Log
				out</a>
		</h4>
	</nav>


	<div class="container-fluid">

		<section id="tablesection">
			<div class="table-responsive">
				<table class="table table-dark">
					<thead>
						<tr>

							<th scope="col">id</th>
							<th scope="col">Full name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone_no</th>
							<th scope="col">Password</th>
							<th scope="col">City</th>
							<th scope="col">Gender</th>
							<th scope="col">Date</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="rm" items="${list }">
							<tr>
								<th scope="row">${rm.id }</th>
								<td>${rm.fullname }</td>
								<td>${rm.email }</td>
								<td>${rm.phone }</td>
								<td>${rm.password }</td>

								<td>${rm.city }</td>
								<td>${rm.gender }</td>
								<td>${rm.dob }</td>
								<td><a href="edit/${rm.id }">Edit</a></td>
								<td><a href="delete/${rm.id }">Delete</a></td>
							</tr>
						</c:forEach>



					</tbody>
				</table>
			</div>
		</section>
		<section id="FoodItem">
			<c:forEach var="fm" items="${list1 }">
				<div class="column">

					<div class="col-sm-6">
						<div class="card" style="width: 40vw;">
							<div class="card-body" style="width: 50vw;">
								<h3 class="card-title">${fm.fname }</h3>

								<h5 class="card-title">
									<label>Price: </label>${fm.price } <label> Quantity: </label>
									${fm.quantity } <label> Added: </label> ${fm.dob }
								</h5>

								<img src="<c:url value="/resources/FoodImage/${fm.fimage }"/>"
									alt="${fm.fimage }" class="image"
									style="width: 30vw; height: 40vh;">

							</div>
							<a style="width: 10vw; margin-left: 70%;" href="fedit/${fm.id }"
								class="btn btn-primary">Edit</a>
							<!--  -->
							<a style="width: 10vw;" href="fdelete/${fm.id }"
								class="btn btn-danger">Delete</a>
						</div>
					</div>

				</div>
			</c:forEach>
		</section>
		<section id="uploadfilesection">
			<form action="UploadAttach.jsp" method="post"
				enctype="multipart/form-data">

				<div class="form-group">
					<label>Attach file</label> <input type="file" name="file"
						class="form-control">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>

		</section>
		<section id="uploadpicturesection">
			<form action="uploadProfilePicture.jsp" method="post"
				enctype="multipart/form-data">

				<div class="form-group">
					<label>Upload image</label> <input type="file" name="file"
						class="form-control">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">submit</button>
				</div>
			</form>

		</section>



	</div>



</body>
</html>
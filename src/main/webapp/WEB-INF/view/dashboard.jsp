<%-- <%@page import="java.sql.DriverManager"%>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#uploadpicturesection").hide();
			$("#uploadProfilePicture").click(function() {
				$("#uploadpicturesection").show();
			});
		});
		 var x = document.getElementById("uploadpicturesection");

		 if (x.style.display === "block") {
		 x.style.display = "none";
		 } else {
		 x.style.display = "block";
		 }
		 } 
	</script>
	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Login success",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />
	<!--  -->
	<c:set var="sesupdate" scope="session" value="${sesupdate}" />
	<c:if test="${sesupdate=='success'}">
		<script type="text/javascript">
			swal("Success", "Update success");
		</script>
	</c:if>
	<c:remove var="sesupdate" scope="session" />
	<!--  -->
	<c:set var="atcu" scope="session" value="${atcu}" />
	<c:if test="${atcu=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Added to cart successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="atcu" scope="session" />
	<c:set var="fadd" scope="session" value="${fadd}" />
	<c:if test="${fadd=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Food added successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="fadd" scope="session" />
	<!--  -->
	<c:set var="sesdelete" scope="session" value="${sesdelete}" />
	<c:if test="${sesdelete=='success'}">
		<script type="text/javascript">
			swal("Success", "Deleted successfully");
		</script>
	</c:if>
	<c:remove var="sesdelete" scope="session" />
	<!--  -->
	<c:set var="delivered" scope="session" value="${delivered}" />
	<c:if test="${delivered=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Food will be delivered shortly",
				icon : "success"
			});
		</script>
	</c:if>

	<c:remove var="delivered" scope="session" />

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

				<li class="nav-item active"><a class="nav-link" href="viewcart">View
						cart </a></li>
				<li class="nav-item active"><a id="uploadProfilePicture"
					class="nav-link" href="#">Upload image </a></li>
			</ul>
		</div>
		<h4>
			<a id="logout" href="logout"
				style="color: white; cursor: pointer; text-decoration: none;">Log
				out </a>
		</h4>
		<h1 style="color: white;">${welcomeMessage}</h1>
	</nav>


	<div class="container-fluid">

		<section id="uploadpicturesection">
			<form action="uploadProfilePicture.jsp" method="post"
				enctype="multipart/form-data">

				<div class="form-group">
					<label>Upload image</label> <input style="width: 20vw;" type="file"
						name="file" class="form-control">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">submit</button>
				</div>
			</form>

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
									${fm.quantity }
								</h5>

								<img src="<c:url value="/resources/FoodImage/${fm.fimage }"/>"
									alt="${fm.fimage }" class="image"
									style="width: 30vw; height: 40vh;">
								<!--  -->
								<a class="btn btn-primary"
									href="addcart?id=${fm.id}&name=${fm.fname}&price=${fm.price}&fimage=${fm.fimage}&ftype=${fm.ftype}">Add
									to Cart</a>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
		</section>





	</div>


	<marquee direction="right" speed="normal" behavior="loop">
		<span style="font: italic bold 12px/30px Georgia, serif; color: red">
			Order and Add food! Have a nice day!</span>
	</marquee>
	<div id="productGrid" style="margin-top: 27px"></div>

	<%@ include file="footer.jsp"%>

</body>
</html> --%>

<%-- 
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HomePage</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
	background-image: url('${image}');
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.navbar {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.nav-link:hover {
	background-color: #6c757d;
	border-radius: 5px;
}

.card {
	margin: 20px 0;
	border: none;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card img {
	object-fit: cover;
	border-radius: 10px;
}

.footer {
	background-color: #343a40;
	color: white;
	padding: 20px;
	text-align: center;
}

#dashboard {
	background-color: #343a40;
	color: white;
	padding: 15px;
	position: fixed;
	height: 100%;
	width: 250px;
	overflow-y: auto;
	display: none;
	z-index: 1000;
}

#dashboard a {
	color: white;
	text-decoration: none;
	display: block;
	margin: 10px 0;
}

#dashboard a:hover {
	background-color: #6c757d;
	padding-left: 10px;
	border-radius: 5px;
}

#dashboard-toggle {
	cursor: pointer;
	color: white;
	margin-right: 20px;
}
</style>
</head>
<body>
	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Login success",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />
	<!--  -->
	<c:set var="sesupdate" scope="session" value="${sesupdate}" />
	<c:if test="${sesupdate=='success'}">
		<script type="text/javascript">
			swal("Success", "Update success");
		</script>
	</c:if>
	<c:remove var="sesupdate" scope="session" />
	<!--  -->
	<c:set var="atcu" scope="session" value="${atcu}" />
	<c:if test="${atcu=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Added to cart successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="atcu" scope="session" />
	<c:set var="fadd" scope="session" value="${fadd}" />
	<c:if test="${fadd=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Food added successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="fadd" scope="session" />
	<!--  -->
	<c:set var="sesdelete" scope="session" value="${sesdelete}" />
	<c:if test="${sesdelete=='success'}">
		<script type="text/javascript">
			swal("Success", "Deleted successfully");
		</script>
	</c:if>
	<c:remove var="sesdelete" scope="session" />
	<!--  -->
	<c:set var="delivered" scope="session" value="${delivered}" />
	<c:if test="${delivered=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Food will be delivered shortly",
				icon : "success"
			});
		</script>
	</c:if>

	<c:remove var="delivered" scope="session" />

	<div id="dashboard">
		<h4 class="text-center">Dashboard</h4>
		<a href="#">Dashboard Link 1</a> <a href="#">Dashboard Link 2</a> <a
			href="#">Dashboard Link 3</a> <a href="#">Dashboard Link 4</a> <a
			href="#">Dashboard Link 5</a>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
		<div class="container-fluid">
			<span id="dashboard-toggle"><i class="fas fa-bars"></i></span> <a
				class="navbar-brand" href="#">MyFoodApp</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="viewcart">View Cart</a></li>
					<li class="nav-item"><a class="nav-link"
						id="uploadProfilePicture" href="#">Upload Image</a></li>
				</ul>
				<h3 style="color: white;">Welcome, ${email}!</h3>
				<a id="logout" class="btn btn-danger" href="logout">Log Out</a>

			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<h1 class="text-white text-center">${welcomeMessage}</h1>

		<!-- Upload Picture Section -->
		<section id="uploadpicturesection" class="mt-4" style="display: none;">
			<div class="card p-4">
				<h5>Upload Profile Picture</h5>
				<form action="uploadProfilePicture.jsp" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="file" class="form-label">Select Image</label> <input
							type="file" name="file" class="form-control" id="file">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</section>

		<!-- Food Items Section -->
		<section id="FoodItem" class="mt-5">
			<div class="row">
				<c:forEach var="fm" items="${list1}">
					<div class="col-lg-4 col-md-6">
						<div class="card">
							<img src="<c:url value='/resources/FoodImage/${fm.fimage}' />"
								alt="${fm.fimage}" class="card-img-top" style="height: 250px;">
							<div class="card-body">
								<h5 class="card-title">${fm.fname}</h5>
								<p class="card-text">
									<strong>Price:</strong> ${fm.price} <br> <strong>Quantity:</strong>
									${fm.quantity}
								</p>
								<a class="btn btn-primary w-100"
									href="addcart?id=${fm.id}&name=${fm.fname}&price=${fm.price}&fimage=${fm.fimage}&ftype=${fm.ftype}">Add
									to Cart</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>

		<!-- Dynamic Message -->
		<div class="alert alert-info mt-5 text-center" role="alert">
			Order and Add Food! Have a Nice Day!</div>
	</div>

	<footer class="footer">
		<p>&copy; 2025 MyFoodApp. All rights reserved.</p>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
        document.addEventListener('DOMContentLoaded', function () {
            const uploadBtn = document.getElementById('uploadProfilePicture');
            const uploadSection = document.getElementById('uploadpicturesection');

            uploadBtn.addEventListener('click', () => {
                uploadSection.style.display = uploadSection.style.display === 'none' ? 'block' : 'none';
            });
        });
    </script>
</body>
</html> --%>


<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
	/*  */
	margin-left: 0;
	transition: margin-left 0.3s ease;
	/* Smooth transition for body shift */
}

.navbar {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.nav-link:hover {
	background-color: #6c757d;
	border-radius: 5px;
}

.card {
	margin: 20px 0;
	border: none;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card img {
	object-fit: cover;
	border-radius: 10px;
}

.footer {
	background-color: #343a40;
	color: white;
	padding: 20px;
	text-align: center;
}

#dashboard {
	background-color: #343a40;
	color: white;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 250px;
	overflow-y: auto;
	transform: translateX(-250px); /* Initially hidden (off-screen) */
	transition: transform 0.3s ease; /* Smooth transition for sliding */
	z-index: 1000;
}

#dashboard.visible {
	transform: translateX(0); /* Slide in when visible */
}

.dashboard-visible {
	margin-left: 250px; /* Shift body content to the right */
}

#dashboard a {
	color: white;
	text-decoration: none;
	display: block;
	margin: 10px 0;
}

#dashboard a:hover {
	background-color: #6c757d;
	padding-left: 10px;
	border-radius: 5px;
}

#dashboard-toggle {
	cursor: pointer;
	color: white;
	margin-right: 20px;
}
</style>
</head>
<c:url var="image" value="/resources/image/17973908.jpg"></c:url>
<body>
	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Login success",
				icon : "success"
			});
			
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />
	<!--  -->
	<c:set var="sesupdate" scope="session" value="${sesupdate}" />
	<c:if test="${sesupdate=='success'}">
		<script type="text/javascript">
			swal("Success", "Update success");
		</script>
	</c:if>
	<c:remove var="sesupdate" scope="session" />
	<!--  -->
	<c:set var="atcu" scope="session" value="${atcu}" />
	<c:if test="${atcu=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Added to cart successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="atcu" scope="session" />
	<c:set var="fadd" scope="session" value="${fadd}" />
	<c:if test="${fadd=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Food added successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="fadd" scope="session" />
	<!--  -->
	<c:set var="sesdelete" scope="session" value="${sesdelete}" />
	<c:if test="${sesdelete=='success'}">
		<script type="text/javascript">
			swal("Success", "Deleted successfully");
		</script>
	</c:if>
	<c:remove var="sesdelete" scope="session" />
	<!--  -->
	<c:set var="delivered" scope="session" value="${delivered}" />
	<c:if test="${delivered=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Food will be delivered shortly",
				icon : "success"
			});
		</script>
	</c:if>

	<c:remove var="delivered" scope="session" />
	<!-- Other session-based alerts here -->

	<div id="dashboard">
		<h4 class="text-center">Dashboard</h4>
		<a id="uploadProfilePicture" href="#">Upload image</a>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3">
		<div class="container-fluid">
			<span id="dashboard-toggle"><i class="fas fa-bars"></i></span> <a
				class="navbar-brand" href="#">MyFoodApp</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<li class="nav-item"><a class="nav-link active"
						href="viewcart"> View Cart <span id="cart-count"
							class="badge bg-primary"> ${not empty sessionScope.cartCount ? sessionScope.cartCount : 0}
						</span>
					</a></li>
				</ul>

				<!-- Profile Picture Section -->
				<div class="d-flex align-items-center">
					<c:choose>
						<c:when test="${not empty sessionScope.profilePicture}">
							<img src="${sessionScope.profilePicture}" alt="Profile Picture"
								class="rounded-circle me-2"
								style="width: 40px; height: 40px; object-fit: cover;">
						</c:when>
						<c:otherwise>
							<img src="<c:url value='/resources/image/Burger.jpg' />"
								alt="Default Profile Picture" class="rounded-circle me-2"
								style="width: 40px; height: 40px; object-fit: cover;">
						</c:otherwise>
					</c:choose>
					<a id="logout" class="btn btn-danger" href="logout">Log Out</a>
				</div>
			</div>
		</div>
	</nav>


	<div class="container mt-4">
		<h1 class="text-white text-center">${welcomeMessage}</h1>

		<!-- Upload Picture Section -->
		<section id="uploadpicturesection" class="mt-4" style="display: none;">
			<div class="card p-4">
				<h5>Upload Profile Picture</h5>
				<%-- <form action="<c:url value='/profile/upload' />" method="post"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="file" class="form-label">Select Image</label> <input
							type="file" name="file" class="form-control" id="file" required>
					</div>
					<button type="submit" class="btn btn-primary">Upload</button>
				</form> --%>
				<form action="/MavenProject1/upload" method="post"
					enctype="multipart/form-data">
					<label for="file">Upload profile picture:</label> <input
						type="file" name="file" id="file">
					<button type="submit">Upload</button>
				</form>
			</div>
		</section>

		<!-- Food Items Section -->
		<section id="FoodItem" class="mt-5">
			<div class="row">
				<c:forEach var="fm" items="${list1}">
					<div class="col-lg-4 col-md-6">
						<div class="card">
							<img src="<c:url value='/resources/FoodImage/${fm.fimage}' />"
								alt="${fm.fimage}" class="card-img-top" style="height: 250px;">
							<div class="card-body">
								<h5 class="card-title">${fm.fname}</h5>
								<p class="card-text">
									<strong>Price:</strong> ${fm.price} <br> <strong>Quantity:</strong>
									${fm.quantity}
								</p>
								<a class="btn btn-primary w-100"
									href="addcart?id=${fm.id}&name=${fm.fname}&price=${fm.price}&fimage=${fm.fimage}&ftype=${fm.ftype}">Add
									to Cart</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>

		<!-- Dynamic Message -->
		<div class="alert alert-info mt-5 text-center" role="alert">
			Order and Add Food! Have a Nice Day!</div>
	</div>

	<footer class="footer">
		<p>&copy; 2025 MyFoodApp. All rights reserved.</p>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script>

    document.addEventListener('DOMContentLoaded', function () {
    	  const uploadBtn = document.getElementById('uploadProfilePicture');
          const uploadSection = document.getElementById('uploadpicturesection');
        const dashboardToggle = document.getElementById('dashboard-toggle');
        const dashboard = document.getElementById('dashboard');
        const body = document.body;

        // Toggle dashboard visibility and adjust body content
        dashboardToggle.addEventListener('click', () => {
            if (dashboard.classList.contains('visible')) {
                dashboard.classList.remove('visible'); // Hide dashboard
                body.classList.remove('dashboard-visible'); // Reset body margin
            } else {
                dashboard.classList.add('visible'); // Show dashboard
                body.classList.add('dashboard-visible'); // Adjust body margin
            }
        });
        // Toggle upload section
        uploadBtn.addEventListener('click', () => {
            uploadSection.style.display = uploadSection.style.display === 'none' ? 'block' : 'none';
        });
        /*  */
        
    });
</script>

</body>
</html>
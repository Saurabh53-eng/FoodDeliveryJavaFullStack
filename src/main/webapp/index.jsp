<%-- <%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.services.FoodServices"%>
<%@page import="com.model.FoodModel"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
	
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>HomePage</title>
<style type="text/css">
@media only screen and (max-width: 767px) {
	.carousel-inner img {
		width: 100vw;
	}
}

.nav-link:hover {
	background-color: purple;
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

.footer {
	position: fixed;
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
</style>
</head>
<c:url var="image" value="/resources/image/17973908.jpg"></c:url>

<body style="background-image: url('${image}');">
	<c:set var="atc" scope="session" value="${atc}" />
	<c:if test="${atc=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Failed",
				text : "Please login to buy",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="atc" scope="session" />
	<!--  -->
	<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_maven" user="root" password="" />
	<div class="container-fluid">

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<img style="width: 10vw;"
				src="<c:url value="/resources/FoodImage/veggie-pizza-1080P-wallpaper.jpg" />"
				alt="FoodLogo"> <a class="navbar-brand" href="#">Food
				delivery webapp</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ">
					<li class="nav-item active"><a class="nav-link" href="aboutus">About
							us </a></li>
					<li class="nav-item active"><a class="nav-link" href="login">Login
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="registration">Sign up </a></li>
					<li class="nav-item active"><a class="nav-link"
						href="adminlogin">Admin login </a></li>
				</ul>

			</div>

		</nav>



		<div class="row">
			<div class="col col-lg-12 col-md-12 col-sm-16 col-xs-16">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">

						<div class="item active">

							<img src="<c:url value="/resources/image/desktop.png"/>"
								class="image" alt="Los Angeles"
								style="width: 100vw; height: 85vh;">

						</div>

						<div class="item">
							<img src="<c:url value="/resources/image/FoodBgImage.jpg"/>"
								class="image" alt="Chicago" style="width: 100vw; height: 85vh;">
						</div>

						<div class="item">
							<img src="<c:url value="/resources/image/Burger.jpg"/>"
								alt="New york" class="image" style="width: 100vw; height: 85vh;">
						</div>
					</div>

					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>

				</div>
			</div>
			<sql:query var="list_foods" dataSource="${myDS}">
    SELECT * FROM foodmodel where quantity>0;
    
</sql:query>
			<div class="row">

				<section id="FoodItem">

					<c:forEach var="fm" items="${list_foods.rows }">
						<div class="column">

							<div class="col-sm-6">
								<div class="card" style="width: 100vw;">
									<div class="card-body" style="width: 40vw;">
										<h3 class="card-title">${fm.fname }</h3>

										<h5 class="card-title">
											<label>Price: </label>${fm.price } <label
												style="margin-left: 10%;">Quantity: </label>${fm.quantity }</h5>

										<img src="<c:url value="/resources/FoodImage/${fm.fimage }"/>"
											alt="${fm.fimage }" class="image"
											style="width: 40vw; height: 40vh;"> <a href="addToCart"
											class="btn btn-primary">Add to cart</a>
									</div>
								</div>
							</div>

						</div>
					</c:forEach>
				</section>

			</div>
		</div>
		<!-- Remove the container if you want to extend the Footer to full width. -->
		<!-- Footer Block Start -->
		<footer id="site-footer">
			<div class=" bg-dark text-white py-5">
				<div class="container py-3">
					<div class="row">
						<div class="col-xl-3 col-md-6 col-sm-12">
							<h5 class="pb-3">
								<i class="fa-solid fa-user-group pe-1"></i> About us
							</h5>
							<span class="text-secondary">This is a wider card with
								supporting text below as a natural lead-in to additional
								content.</span>
						</div>
						<div class="col-xl-3 col-md-6 col-sm-12">
							<h5 class="pb-3">
								<i class="fa-solid fa-link pe-1"></i> Important links
							</h5>
							<ul>
								<li><a href="#" class="text-decoration-none link-secondary">About
										us</a></li>
								<li><a href="#" class="text-decoration-none link-secondary">Privacy
										policy</a></li>
								<li><a href="#" class="text-decoration-none link-secondary">Terms
										of services</a></li>
							</ul>
						</div>
						<div class="col-xl-3 col-md-6 col-sm-12">
							<h5 class="pb-3">
								<i class="fa-solid fa-location-dot pe-1"></i> Our location
							</h5>
							<span class="text-secondary"> Milannagar bazar<br>
								Tamluk, East Medinipore, West Bengal<br> 721627, India<br>
							</span>
						</div>
						<div class="col-xl-3 col-md-6 col-sm-12">
							<h5 class="pb-3">
								<i class="fa-solid fa-paper-plane pe-1"></i> Stay updated
							</h5>
							<form>
								<input type="text" class="w-100 mb-2 form-control" name=""
									placeholder="Email ID">
								<button class="w-100 btn btn-dark">Subscribe now</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="bg-dark py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<ul class="list-inline mb-0">
								<li class="list-inline-item"><a
									class="btn btn-outline-secondary" href="#"><i
										class="fa-brands fa-facebook-f"></i></a></li>
								<li class="list-inline-item"><a
									class="btn btn-outline-secondary" href="#"><i
										class="fa-brands fa-youtube"></i></a></li>
								<li class="list-inline-item"><a
									class="btn btn-outline-secondary" href="#"><i
										class="fa-brands fa-twitter"></i></a></li>
								<li class="list-inline-item"><a
									class="btn btn-outline-secondary" href="#"><i
										class="fa-brands fa-linkedin-in"></i></a></li>
								<li class="list-inline-item"><a
									class="btn btn-outline-secondary" href="#"><i
										class="fa-brands fa-github"></i></a></li>
							</ul>
						</div>
						<div class="col-md-6 col-sm-12">
							<span class="text-secondary pt-1 float-md-end float-sm-start">Copyright
								&copy; 2024</span>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- Footer Block Start -->

	</div>

</body>
</html> --%>



<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.services.FoodServices"%>
<%@page import="com.model.FoodModel"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Food Delivery WebApp</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Poppins', sans-serif;
}

/* Navbar */
.navbar {
	background: linear-gradient(90deg, #4b6cb7, #182848);
}

.navbar-brand {
	font-size: 1.5rem;
	font-weight: bold;
}

.nav-link {
	font-size: 1.1rem;
	margin: 0 10px;
	color: white !important;
	transition: color 0.3s ease-in-out;
}

.nav-link:hover {
	color: #ffc107 !important;
}

/* Carousel */
.carousel-inner img {
	height: 85vh;
}

.carousel-caption {
	background: rgba(0, 0, 0, 0.6);
	padding: 10px;
	border-radius: 5px;
}

/* Food Item Cards */
.card {
	border: none;
	border-radius: 10px;
	overflow: hidden;
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.card img {
	border-bottom: 2px solid #ffc107;
}

.btn-primary {
	background: linear-gradient(90deg, #ff7e5f, #feb47b);
	border: none;
	transition: background 0.3s ease-in-out;
}

.btn-primary:hover {
	background: linear-gradient(90deg, #feb47b, #ff7e5f);
}

/* Footer */
.footer {
	background: #182848;
	color: white;
	padding: 20px 0;
}

.footer a {
	color: #ffc107;
	text-decoration: none;
}

.footer a:hover {
	color: #fff;
	text-decoration: underline;
}

.social-icons a {
	color: white;
	margin: 0 10px;
	font-size: 1.5rem;
	transition: transform 0.3s ease-in-out;
}

.social-icons a:hover {
	transform: scale(1.2);
}

.footer span {
	font-size: 0.9rem;
}
</style>
</head>

<body>
	<c:set var="atc" scope="session" value="${atc}" />
	<c:if test="${atc=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Failed",
				text : "Please login to buy",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="atc" scope="session" />
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="#">Food Delivery</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="aboutus">About
							Us</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="registration">Sign
							Up</a></li>
					<li class="nav-item"><a class="nav-link" href="adminlogin">Admin
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value='/resources/image/desktop.png' />"
					class="d-block w-100" alt="Image 1">
				<div class="carousel-caption d-none d-md-block">
					<h5>Delicious Food Delivered to You</h5>
					<p>Experience the best food from the comfort of your home.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/resources/image/FoodBgImage.jpg' />"
					class="d-block w-100" alt="Image 2">
				<div class="carousel-caption d-none d-md-block">
					<h5>Fresh Ingredients, Amazing Taste</h5>
					<p>We ensure the quality and freshness of every meal.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="<c:url value='/resources/FoodImage/pexels-enginakyurt-2347311.jpg' />"
					class="d-block w-100" alt="Image 3">
				<div class="carousel-caption d-none d-md-block">
					<h5>Fast and Reliable Delivery</h5>
					<p>On-time delivery, every time.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- Food Items -->
	<div class="container my-5">
		<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/db_maven" user="root" password="" />
		<sql:query var="list_foods" dataSource="${myDS}">
    SELECT * FROM foodmodel where quantity>0;
</sql:query>
		<div class="row">
			<c:forEach var="fm" items="${list_foods.rows }">
				<div class="col-md-4 mb-4">
					<div class="card">
						<img src="<c:url value="/resources/FoodImage/${fm.fimage }"/>"
							class="card-img-top" alt="${fm.fname}">
						<div class="card-body">
							<h5 class="card-title">${fm.fname}</h5>
							<p class="card-text">Price: $${fm.price} | Quantity:
								${fm.quantity}</p>
							<a href="addToCart" class="btn btn-primary">Add to Cart</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="container text-center">
			<div class="row">
				<div class="col-md-6">
					<h5>About Us</h5>
					<p>Delivering happiness, one meal at a time.</p>
				</div>
				<div class="col-md-6">
					<h5>Follow Us</h5>
					<div class="social-icons">
						<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
							class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-instagram"></i></a> <a href="#"><i
							class="fab fa-linkedin"></i></a>
					</div>
				</div>
			</div>
			<span>&copy; 2025 Food Delivery WebApp. All rights reserved.</span>
		</div>
	</footer>

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Add to cart page</title>
<style>
/* Navbar Styles */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	padding: 10px 20px;
}

.navbar a {
	text-decoration: none;
	color: white;
	padding: 8px 15px;
	transition: background-color 0.3s;
}

.navbar a:hover {
	background-color: #575757;
	border-radius: 5px;
}

.navbar .logo {
	font-size: 20px;
	font-weight: bold;
}

.navbar .nav-links {
	display: flex;
}

@media ( max-width : 768px) {
	.navbar {
		flex-direction: column;
	}
	.navbar .nav-links {
		flex-direction: column;
		align-items: center;
	}
	.navbar a {
		padding: 10px;
		width: 100%;
		text-align: center;
	}
}
</style>
</head>
<body>
	<nav class="navbar">
		<div class="logo">
			<a href="/MavenProject1/view">Home</a>
		</div>

		<div class="nav-links"></div>
	</nav>
	
	<c:forEach var="fm" items="${fm }">
		<h3 class="card-title">${fm.fname }</h3>
		<h3 class="card-title">
			<label>Rupees: </label>${fm.price }</h3>
		<img src="<c:url value="/resources/FoodImage/${fm.fimage }"/>"
			alt="${fm.fimage }" class="image" style="width: 30vw; height: 40vh;">

		<a href="/MavenProject1/buyfood" class="btn btn-primary">Buy now</a>
	</c:forEach>

</body>
</html>
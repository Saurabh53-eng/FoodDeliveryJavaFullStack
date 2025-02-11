<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - Foodies Express</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f8f8f8;
	color: #333;
}

header {
	background-color: #ff6347;
	color: white;
	padding: 20px 10%;
	text-align: center;
}

header h1 {
	margin: 0;
	font-size: 2.5rem;
}

header p {
	margin: 10px 0 0;
	font-size: 1.2rem;
}

.container {
	width: 80%;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.section {
	margin-bottom: 20px;
}

.section h2 {
	font-size: 1.8rem;
	color: #ff6347;
	margin-bottom: 10px;
}

.section p {
	font-size: 1rem;
	line-height: 1.6;
}

.team {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	gap: 20px;
}

.team-member {
	text-align: center;
	max-width: 200px;
}

.team-member img {
	width: 100%;
	border-radius: 50%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.team-member h3 {
	margin: 10px 0 5px;
	font-size: 1.2rem;
	color: #333;
}

.team-member p {
	font-size: 0.9rem;
	color: #666;
}

footer {
	background-color: #333;
	color: white;
	text-align: center;
	padding: 10px;
	margin-top: 20px;
}

footer p {
	margin: 0;
	font-size: 0.9rem;
}
/* General Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

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
			<a href="index.jsp">Home</a>
		</div>

		<div class="nav-links"></div>
	</nav>
	<header>
		<h1>Welcome to Foodies Express</h1>
		<p>Your favorite meals, delivered fast and fresh!</p>
	</header>

	<div class="container">
		<section class="section">
			<h2>Our Story</h2>
			<p>At Foodies Express, we believe that great food should be
				accessible to everyone, everywhere. Founded in 2020, our mission has
				been to bring people closer to their favorite meals with the click
				of a button. From local favorites to gourmet dishes, we are here to
				serve you.</p>
		</section>

		<section class="section">
			<h2>Our Mission</h2>
			<p>We are committed to providing exceptional food delivery
				services that are fast, reliable, and affordable. By partnering with
				top restaurants and local eateries, we ensure that you have access
				to a diverse menu that suits all tastes and dietary preferences.</p>
		</section>

		<section class="section">
			<h2>Meet Our Team</h2>
			<div class="team">
				<div class="team-member">
					<img src="team1.jpg" alt="Team Member 1">
					<h3>Jane Doe</h3>
					<p>CEO & Founder</p>
				</div>
				<div class="team-member">
					<img src="team2.jpg" alt="Team Member 2">
					<h3>John Smith</h3>
					<p>Head of Operations</p>
				</div>
				<div class="team-member">
					<img src="team3.jpg" alt="Team Member 3">
					<h3>Emily Brown</h3>
					<p>Marketing Manager</p>
				</div>
			</div>
		</section>
	</div>

	<footer>
		<p>&copy; 2025 Foodies Express. All rights reserved.</p>
	</footer>
</body>
</html>
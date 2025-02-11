<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Admin login page</title>
<style type="text/css">
.row {
	margin-top: 10%;
}

.lpassword {
	margin-top: 5%;
}

.btn {
	margin-top: 2%;
}

.underbutton {
	text-align: center;
	margin-top: 2%;
}
</style>

</head>
<c:url var="image" value="/resources/image/17973908.jpg"></c:url>
<body style="background-image: url('${image}');">

	<!--  -->
	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog=='failed'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Failed",
				text : "Logged in failed",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />
	<!--  -->
	<c:set var="seslogout" scope="session" value="${seslogout}" />
	<c:if test="${seslogout=='logout'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Logout success",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="seslogout" scope="session" />
	<div class="container-fluid">
		<div class="row">
			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<a href="index.jsp"><button>Go to home page</button></a>
				<form action="doadminlogin" onsubmit="return onValidate();"
					method="post">

					<div class="form-group">
						<h1 class="loginh1" style="text-align: center;">Login</h1>
						<!--  -->
						<label> Enter email id</label><span style="color: red;"
							id="chkemail"> </span> <input type="email" class="form-control"
							placeholder="Enter email address" name="email" id="email"
							aria-describedby="emailHelp">
						<!--  -->
						<label class="lpassword"> Enter password</label><span
							style="color: red;" id="chkpassword"> </span> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Enter password">
						<!--  -->
						<div class="col text-center">
							<button class="btn btn-success" type="submit">Login</button>
						</div>
					</div>
				</form>
			</div>

			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

		</div>
	</div>
	<script type="text/javascript">
		function onValidate() {

			let email = document.getElementById("email").value;
			let password = document.getElementById("password").value;
			const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if (email == "" || email == null) {
				document.getElementById("chkemail").innerHTML = " * Email id field is required";
				document.getElementById("email").focus();
				return false;
			} else if (!emailRegex.test(email)) {
				document.getElementById("chkemail").innerHTML = "* invalid email id";
				document.getElementById("email").focus();
				return false;
			} else if (password == "" || password == null) {
				document.getElementById("chkpassword").innerHTML = "* Password field is required";
				document.getElementById("password").focus();
				return false;
			} else {
				return true;
			}
		}
	</script>

</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Admin Login</title>
<style>
/* Moving background animation */
body {
	background: linear-gradient(-45deg, #ff9a9e, #fad0c4, #fbc2eb, #a1c4fd);
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
	height: 100vh;
}
@keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

.login-container {
	background: rgba(255, 255, 255, 0.85);
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.login-container h1 {
	margin-bottom: 20px;
}

.form-label {
	font-weight: 600;
}

.form-control {
	border-radius: 5px;
}

.btn-login {
	margin-top: 20px;
	width: 100%;
}

.go-home {
	margin-top: 10px;
	text-align: center;
}

.go-home a {
	color: #007bff;
	text-decoration: none;
}

.go-home a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<!-- Alerts for login status -->
	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog == 'failed'}">
		<script>
			Swal.fire({
				title : "Login Failed",
				text : "Invalid email or password. Please try again.",
				icon : "error",
				confirmButtonText : "OK"
			});
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />

	<c:set var="seslogout" scope="session" value="${seslogout}" />
	<c:if test="${seslogout == 'logout'}">
		<script>
			Swal.fire({
				title : "Logout Successful",
				text : "You have been logged out.",
				icon : "success",
				confirmButtonText : "OK"
			});
		</script>
	</c:if>
	<c:remove var="seslogout" scope="session" />

	<div class="container d-flex justify-content-center align-items-center"
		style="height: 100%;">
		<div class="col-lg-4 col-md-6 col-sm-8">
			<div class="login-container">
				<h1 class="text-center">Admin Login</h1>
				<form action="doadminlogin" method="post"
					onsubmit="return onValidate();">
					<!-- Email Field -->
					<div class="mb-3">
						<label for="email" class="form-label">Email Address</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="Enter your email"> <span id="chkemail"
							class="text-danger small"></span>
					</div>

					<!-- Password Field -->
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Enter your password"> <span
							id="chkpassword" class="text-danger small"></span>
					</div>

					<!-- Submit Button -->
					<button type="submit" class="btn btn-primary btn-login">Login</button>
				</form>

				<div class="go-home">
					<a href="index.jsp">Back to Home Page</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Validation Script -->
	<script>
		function onValidate() {
			const email = document.getElementById("email").value.trim();
			const password = document.getElementById("password").value.trim();
			const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			// Email Validation
			if (!email) {
				document.getElementById("chkemail").textContent = " * Email field is required";
				document.getElementById("email").focus();
				return false;
			} else if (!emailRegex.test(email)) {
				document.getElementById("chkemail").textContent = " * Invalid email format";
				document.getElementById("email").focus();
				return false;
			} else {
				document.getElementById("chkemail").textContent = "";
			}

			// Password Validation
			if (!password) {
				document.getElementById("chkpassword").textContent = " * Password field is required";
				document.getElementById("password").focus();
				return false;
			} else {
				document.getElementById("chkpassword").textContent = "";
			}

			return true;
		}
	</script>

</body>
</html>

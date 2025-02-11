<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>Login form</title>
<style>
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

	<c:set var="OTPVerified" scope="session" value="${OTPVerified}" />
	<c:if test="${OTPVerified=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "OTP Verified successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="OTPVerified" scope="session" />
	<!--  -->
	<c:set var="passwordSent" scope="session" value="${passwordSent}" />
	<c:if test="${passwordSent=='success'}">
		<script type="text/javascript">
			var message = "${message}"; // Get the message from the model attribute

			Swal.fire({
				title : 'Info',
				text : message,
				icon : 'info',
				confirmButtonText : 'OK'
			});
		</script>
	</c:if>
	<c:remove var="passwordSent" scope="session" />
	<!--  -->
	<c:set var="password" scope="session" value="${password}" />
	<c:if test="${password=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Password has been sent to your email",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="password" scope="session" />

	<!--  -->
	<c:set var="sesreg" scope="session" value="${sesreg}" />
	<c:if test="${sesreg=='success'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Registered successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="sesreg" scope="session" />
	<!--  -->

	<c:set var="seslog" scope="session" value="${seslog}" />
	<c:if test="${seslog=='failed'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Error",
				text : "Login failed",
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
				text : "Logout successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="seslogout" scope="session" />
	<!--  -->
	<div class="container-fluid">
		<div class="row">
			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<a href="index.jsp"><button>Go to home page</button></a>
				<form action="dologin" onsubmit="return onValidate();" method="post">

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
						<div class="underbutton">
							<p>
								<a class="link-opacity-10" href="forgotpassword">Forgot
									password</a>
							</p>
							<p>
								<a class="link-opacity-25" href="registration">Don't have an
									account | Sign up</a>
							</p>
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
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%-- <script src="<c:url value='/resources/js/register.js' />"></script> --%>
<title>Login Form</title>
<style>
body {
	background-color: #f8f9fa; /* Light background color */
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #343a40; /* Dark text color for contrast */
	font-family: Arial, sans-serif;
}

.login-container {
	background: #ffffff; /* White background for the form */
	border-radius: 10px;
	padding: 30px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.form-label {
	color: #495057; /* Subtle dark text color */
}

.btn-custom {
	background-color: #007bff;
	color: #fff;
	border: none;
}

.btn-custom:hover {
	background-color: #0056b3;
}

.underbutton a {
	color: #007bff;
}

.underbutton a:hover {
	text-decoration: underline;
}

.login-title {
	text-align: center;
	margin-bottom: 20px;
	color: #343a40;
}

.home-link {
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<c:url var="image" value="/resources/image/17973908.jpg"></c:url>
<body>

	<!-- Flash Messages -->
	<c:if test="${OTPVerified == 'success'}">
		<script>
			Swal.fire({
				title : "Success",
				text : "OTP Verified successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="OTPVerified" scope="session" />

	<c:if test="${passwordSent == 'success'}">
		<script>
			Swal.fire({
				title : "Info",
				text : "${message}",
				icon : "info",
				confirmButtonText : "OK"
			});
		</script>
	</c:if>
	<c:remove var="passwordSent" scope="session" />

	<c:if test="${password == 'success'}">
		<script>
			Swal.fire({
				title : "Success",
				text : "Password has been sent to your email",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="password" scope="session" />

	<c:if test="${sesreg == 'emailAlreadyExist'}">
		<script>
			Swal.fire({
				title : "Failed",
				text : "Email already exists",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="sesreg" scope="session" />
	<c:if test="${sesreg == 'success'}">
		<script>
			Swal.fire({
				title : "Success",
				text : "Registered successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="sesreg" scope="session" />

	<c:if test="${seslog == 'failed'}">
		<script>
			Swal.fire({
				title : "Error",
				text : "Login failed",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="seslog" scope="session" />

	<c:if test="${seslogout == 'logout'}">
		<script>
			Swal.fire({
				title : "Success",
				text : "Logout successfully",
				icon : "success"
			});
		</script>
	</c:if>
	<c:remove var="seslogout" scope="session" />

	<div class="login-container">
		<div class="home-link">
			<a href="index.jsp" class="btn btn-link">&#8592; Back to Home</a>
		</div>
		<span id="email-error" class="error"></span>
		<h1 class="login-title">Login</h1>
		<form action="dologin" onsubmit="return onValidate();" method="post">
			<div class="mb-3">
				<label for="email" class="form-label">Email address</label> <input
					type="email" class="form-control" id="email" name="email"
					placeholder="Enter email address"> <span
					style="color: red;" id="chkemail"></span>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" class="form-control" id="password" name="password"
					placeholder="Enter password"> <span style="color: red;"
					id="chkpassword"></span>
			</div>
			<div class="d-grid">
				<button type="submit" class="btn btn-custom">Login</button>
			</div>
			<div class="underbutton mt-3">
				<p>
					<a href="forgotpassword">Forgot password?</a>
				</p>
				<p>
					<a href="registration">Don't have an account? Sign up</a>
				</p>
			</div>
		</form>
		<c:if test="${not empty error}">
			<div style="color: red">${error}</div>
		</c:if>
	</div>

	<script>
		function onValidate() {
			const email = document.getElementById("email").value;
			const password = document.getElementById("password").value;
			const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			if (!email) {
				document.getElementById("chkemail").innerText = "* Email is required";
				document.getElementById("email").focus();
				return false;
			} else if (!emailRegex.test(email)) {
				document.getElementById("chkemail").innerText = "* Invalid email address";
				document.getElementById("email").focus();
				return false;
			}

			if (!password) {
				document.getElementById("chkpassword").innerText = "* Password is required";
				document.getElementById("password").focus();
				return false;
			}

			return true;
		}
	</script>

</body>
</html>
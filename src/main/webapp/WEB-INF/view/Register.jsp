<%-- <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Sign up</title>
<style type="text/css">
.row {
	margin-top: 0%;
}

.signuph1 {
	text-align: center;
}

.btn {
	margin-top: 2%;
}

.signin {
	text-align: center;
}

.form-check {
	margin-left: 2%;
}

#city {
	width: 20%;
}

.gender {
	display: flex;
}

label {
	margin-top: 1%;
}
</style>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<c:url var="image" value="/resources/image/17973908.jpg"></c:url>
<body style="background-image: url('${image}');" />

<div class="container-fluid">

	<div class="row">

		<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

		<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
			<a href="index.jsp"><button>Go to home page</button></a>
			<form action="register" onsubmit="return onValidate();" method="post">

				<div class="form-group">

					<h1 class="signuph1">Sign up</h1>
					<label><span style="color: red;">*</span> Enter full name</label><span
						style="color: red;" id="chkfname"></span><input type="text"
						name="fullname" class="form-control" placeholder="Enter full name"
						id="name" onkeyup="fullname();">
					<!--  -->
					<label><span style="color: red;">*</span> Email</label> <span
						style="color: red; text-align: center;" id="chkemail"></span> <input
						type="email" name="email" class="form-control"
						placeholder="Enter email address" id="email"
						aria-describedby="emailHelp">
					<!--  -->
					<label><span style="color: red;">*</span>Enter phone number</label><span
						style="color: red;" id="chkphone"></span> <input type="tel"
						placeholder="Enter phone number" name="phone" class="form-control"
						id="phone">
					<!--  -->
					<label> <span style="color: red;">*</span>Enter password
					</label> <span style="color: red; text-align: center;" id="chkpassword"></span>
					<input type="password" name="password" class="form-control"
						id="password" placeholder="Enter password">
					<!--  -->
					<label><span style="color: red;">*</span> Confirm password</label>
					<span style="color: red; text-align: center;" id="chkcpassword"></span>

					<input type="password" name="cpassword" class="form-control"
						id="cpassword" placeholder="Confirm password"> <span
						style="color: red; float: right;" id="chkradio"></span>



					<div style="display: flex;">

						<label><b><span style="color: red;">*</span>Select
								city </b></label> <select id="city" name="city"
							class="form-select form-select-sm">
							<option value="Nagpur">Nagpur</option>
							<option value="Pune">Pune</option>
							<option value="Mumbai">Mumbai</option>

						</select>

						<div class="gender">

							&nbsp; &nbsp;<label><span style="color: red;">*</span><b>Select
									gender</b></label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="male" value="male"> <label class="form-check-label"
								for="flexRadioDefault1"> Male </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="gender"
								id="female" value="male"> <label
								class="form-check-label" for="flexRadioDefault2"> Female
							</label>
						</div>
					</div>
					<label><span style="color: red;">*</span>Choose date</label> <input
						type="date" name="dob" id="Date"> <span
						style="color: red;" id="chkdate"></span>

					<div class="col text-center">

						<button class="btn btn-success" type="submit">Sign up</button>
					</div>

					<p class="signin">
						<label
							style="font-weight: bold; font-size: 100%; background-color: black; color: white;">Already
							have an account ? </label><b><a class="link-opacity-100"
							style="text-decoration: none; background-color: white; color: blue;"
							href="login">Log in</a></b>
					</p>
				</div>

			</form>
		</div>


		<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
	</div>
</div>

<script type="text/javascript">
	function fullname() {
		let x = document.getElementById("name").value;
		if (x !== null || x !== "") {
			document.getElementById("chkfname").innerHTML = " ";
		}
	}
	function email() {
		let x = document.getElementById("email").value;
		if (x !== null || x !== "") {
			document.getElementById("chkemail").innerHTML = " ";
		}
	}
	function password() {
		let x = document.getElementById("password").value;
		if (x !== null || x !== "") {
			document.getElementById("chkpassword").innerHTML = " ";
		}
	}
	function cpassword() {
		let x = document.getElementById("cpassword").value;
		if (x !== null || x !== "") {
			document.getElementById("chkcpassword").innerHTML = " ";
		}
	}
	function cpassword() {
		let x = document.getElementById("cpassword").value;
		if (x !== null || x !== "") {
			document.getElementById("chkcpassword").innerHTML = " ";
		}
	}
	function cpassword() {
		let x = document.getElementById("cpassword").value;
		if (x !== null || x !== "") {
			document.getElementById("chkcpassword").innerHTML = " ";
		}
	}
	function cpassword() {
		let x = document.getElementById("cpassword").value;
		if (x !== null || x !== "") {
			document.getElementById("chkcpassword").innerHTML = " ";
		}
	}
	function cpassword() {
		let x = document.getElementById("cpassword").value;
		if (x !== null || x !== "") {
			document.getElementById("chkcpassword").innerHTML = " ";
		}
	}
	function onValidate() {

		let fullname = document.getElementById("name").value;
		let email = document.getElementById("email").value;
		let phone = document.getElementById("phone").value;
		let password = document.getElementById("password").value;
		let cpassword = document.getElementById("cpassword").value;
		let date = document.getElementById("Date").value;
		let java = document.querySelector('#java');
		let python = document.querySelector("#python");
		let css = document.querySelector("#css")
		let html = document.querySelector("#html");
		var select = document.getElementById("city");
		var selectedValue = select.value;
		let letters = /^[A-Za-z]+$/;

		const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		if (fullname == "" || fullname == null) {
			document.getElementById("chkfname").innerHTML = " Fullname field is required";
			document.getElementById("name").focus();
			return false;
		} else if (email == "" || email == null) {
			document.getElementById("chkemail").innerHTML = " Email id field is required";
			return false;

		} else if (phone == "" || phone == null) {

			document.getElementById("chkphone").innerHTML = " Phone number field is required";
			return false;
		} else if (password == "" || password == null) {
			document.getElementById("chkpassword").innerHTML = " Password field is required";
			return false;
		} else if (cpassword == " " || cpassword == null) {
			document.getElementById("chkcpassword").innerHTML = " Confirm password field is required";
			return false;
		} else if (password != cpassword) {
			document.getElementById("chkcpassword").innerHTML = " Password didn't match";

			alert("password not matched");
			return false;
		} else if (!java.checked && !python.checked && !css.checked
				&& !html.checked) {
			document.getElementById("chkcheckbox").innerHTML = " Select one of the course required";
			return false;
		} else if (!selectedValue) {
			document.getElementById("chkcity").innerHTML = " Select city field is required";
			return false;
		} else if (document.getElementById('male').checked == false
				&& document.getElementById('female').checked == false) {
			document.getElementById("chkradio").innerHTML = " Select gender field is required";
			return false;
		} else if (!date) {
			document.getElementById("chkdate").innerHTML = " Select date field is required";
			return false;
		} else {
			return true;
		}
	}
</script>


</body>

</html> --%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Sign Up</title>
<style>
body {
	background: linear-gradient(to right, #6a11cb, #2575fc);
	color: #fff;
	font-family: Arial, sans-serif;
}

.form-container {
	background: #fff;
	border-radius: 15px;
	padding: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	color: #333;
}

.form-container h1 {
	font-size: 2.5rem;
	margin-bottom: 20px;
	text-align: center;
	font-weight: bold;
	color: #6a11cb;
}

.btn-primary {
	background-color: #6a11cb;
	border-color: #6a11cb;
}

.btn-primary:hover {
	background-color: #2575fc;
	border-color: #2575fc;
}

.form-label span {
	color: red;
}

.form-footer {
	text-align: center;
	margin-top: 20px;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<div class="col-lg-6 col-md-8 col-sm-12 form-container">
			<h1>Sign Up</h1>
			<form action="register" onsubmit="return onValidate();" method="post">
				<div class="mb-3">
					<label for="name" class="form-label"> <span>*</span> Full
						Name
					</label> <input type="text" name="fullname" class="form-control" id="name"
						placeholder="Enter your full name" onkeyup="fullname();">
					<div id="chkfname" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label for="email" class="form-label"> <span>*</span> Email
						Address
					</label> <input type="email" name="email" class="form-control" id="email"
						placeholder="Enter your email" onkeyup="email();">
					<div id="chkemail" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label for="phone" class="form-label"> <span>*</span> Phone
						Number
					</label> <input type="tel" name="phone" class="form-control" id="phone"
						placeholder="Enter your phone number">
					<div id="chkphone" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label"> <span>*</span>
						Password
					</label> <input type="password" name="password" class="form-control"
						id="password" placeholder="Enter your password">
					<div id="chkpassword" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label for="cpassword" class="form-label"> <span>*</span>
						Confirm Password
					</label> <input type="password" name="cpassword" class="form-control"
						id="cpassword" placeholder="Confirm your password">
					<div id="chkcpassword" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label for="city" class="form-label"> <span>*</span> Select
						City
					</label> <select id="city" name="city" class="form-select">
						<option value="Nagpur">Nagpur</option>
						<option value="Pune">Pune</option>
						<option value="Mumbai">Mumbai</option>
					</select>
					<div id="chkcity" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label class="form-label"> <span>*</span> Gender
					</label>
					<div>
						<input class="form-check-input" type="radio" name="gender"
							id="male" value="male"> <label for="male">Male</label>
						&nbsp; <input class="form-check-input" type="radio" name="gender"
							id="female" value="female"> <label for="female">Female</label>
					</div>
					<div id="chkradio" class="text-danger"></div>
				</div>

				<div class="mb-3">
					<label for="Date" class="form-label"> <span>*</span> Date
						of Birth
					</label> <input type="date" name="dob" class="form-control" id="Date">
					<div id="chkdate" class="text-danger"></div>
				</div>

				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="submit">Sign Up</button>
				</div>

				<div class="form-footer">
					<p>
						Already have an account? <a href="login" class="text-primary">Log
							In</a>
					</p>
				</div>
			</form>
		</div>
	</div>

	<script>
		function onValidate() {
			// Validation logic here (similar to your provided script)
			let fullname = document.getElementById("name").value;
			let email = document.getElementById("email").value;
			let phone = document.getElementById("phone").value;
			let password = document.getElementById("password").value;
			let cpassword = document.getElementById("cpassword").value;
			let date = document.getElementById("Date").value;
			let java = document.querySelector('#java');
			let python = document.querySelector("#python");
			let css = document.querySelector("#css")
			let html = document.querySelector("#html");
			var select = document.getElementById("city");
			var selectedValue = select.value;
			let letters = /^[A-Za-z]+$/;

			const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			if (fullname == "" || fullname == null) {
				document.getElementById("chkfname").innerHTML = " Fullname field is required";
				document.getElementById("name").focus();
				return false;
			} else if (email == "" || email == null) {
				document.getElementById("chkemail").innerHTML = " Email id field is required";
				return false;

			} else if (phone == "" || phone == null) {

				document.getElementById("chkphone").innerHTML = " Phone number field is required";
				return false;
			} else if (password == "" || password == null) {
				document.getElementById("chkpassword").innerHTML = " Password field is required";
				return false;
			} else if (cpassword == " " || cpassword == null) {
				document.getElementById("chkcpassword").innerHTML = " Confirm password field is required";
				return false;
			} else if (password != cpassword) {
				document.getElementById("chkcpassword").innerHTML = " Password didn't match";
				return false;
			} else if (!java.checked && !python.checked && !css.checked
					&& !html.checked) {
				document.getElementById("chkcheckbox").innerHTML = " Select one of the course required";
				return false;
			} else if (!selectedValue) {
				document.getElementById("chkcity").innerHTML = " Select city field is required";
				return false;
			} else if (document.getElementById('male').checked == false
					&& document.getElementById('female').checked == false) {
				document.getElementById("chkradio").innerHTML = " Select gender field is required";
				return false;
			} else if (!date) {
				document.getElementById("chkdate").innerHTML = " Select date field is required";
				return false;
			} else {
				return true;
			}
		}
	</script>

</body>
</html>
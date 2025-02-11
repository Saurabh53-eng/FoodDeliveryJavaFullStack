<%@page import="java.util.Locale"%>
<%@page import="java.sql.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<title>Edit page</title>
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


</head>
<c:url var="image" value="/resources/image/17973908.jpg"></c:url>
<body style="background-image: url('${image}');">
	<div class="container-fluid">

		<div class="row">

			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<a href="/MavenProject1/adminView"><button>Go to dash
						page</button></a>
				<form:form action="/MavenProject1/update" method="post">
					<div class="form-group">

						<h1 class="signuph1">Update</h1>
						<label> Id</label>
						<form:input class="form-control" path="id" />

						<label> Enter full name</label>
						<form:input class="form-control" placeholder="Enter full name"
							path="fullname" />
						<label> Email</label>
						<form:input type="email" name="email" class="form-control"
							placeholder="Enter email address" path="email"
							aria-describedby="emailHelp" />
						<label>Enter phone number</label>
						<form:input type="number" placeholder="Enter phone number"
							name="phone" class="form-control" id="phone" path="phone" />

						<label> Enter password </label> <span
							style="color: red; text-align: center;" id="chkpassword"></span>
						<form:input type="password" name="password" path="password"
							class="form-control" id="password" placeholder="Enter password" />

						<span style="color: red; text-align: center;" id="chkcheckbox"></span>
						<span style="color: red;" id="chkcity"> </span> <br>

						<div style="display: flex;">

							<label><b><span style="color: red;">*</span>Select
									city </b></label>
							<form:select id="city" path="city"
								class="form-select form-select-sm">
								<form:option value="Nagpur">Nagpur</form:option>
								<form:option value="Pune">Pune</form:option>
								<form:option value="Mumbai">Mumbai</form:option>

							</form:select>

							<div class="gender">

								&nbsp; &nbsp;<label><span style="color: red;">*</span><b>Select
										gender</b></label>
							</div>

							<div class="form-check">


								<form:radiobutton class="form-check-input" value="male"
									path="gender"></form:radiobutton>
								<label class="form-check-label" for="flexRadioDefault1">
									Male </label>
							</div>
							<div class="form-check">
								<form:radiobutton class="form-check-input" value="female"
									path="gender"></form:radiobutton>
								<label class="form-check-label" for="flexRadioDefault2">
									Female </label>
							</div>
						</div>
						<label>Choose date</label>
						<form:input type="date" path="dob" id="Date" />
						<span style="color: red;" id="chkdate"></span>

						<div class="col text-center">
							<button class="btn btn-success" type="submit">Update</button>
						</div>


					</div>
				</form:form>

			</div>


			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
		</div>
	</div>

	<script>
		function onValidate() {

			let fullname = document.getElementById("name").value;
			let email = document.getElementById("email").value;
			let phone = document.getElementById("phone").value;
			let password = document.getElementById("password").value;
			let cpassword = document.getElementById("cpassword").value;
			let date = document.getElementById("Date").value;

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

</html>
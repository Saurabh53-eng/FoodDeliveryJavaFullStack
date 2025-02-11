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
<title>Food delivery address</title>
</head>
<body>
	<c:set var="msg" scope="session" value="${msg}" />
	<c:if test="${msg=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Please provide food delivery address",
				icon : "success"
			});
		</script>
	</c:if>

	<c:remove var="msg" scope="session" />
	<!--  -->
	

	<div class="container-fluid">

		<div class="row">

			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<a href="view"><button>Go to dashboard</button></a>
				<form action="deliver" method="post">

					<div class="form-group">

						<h1 class="signuph1">Delivery address</h1>

						<!--  -->

						<!--  -->

						<label><span style="color: red;">*</span>Address </label><span
							style="color: red;" id="chkphone"></span>
						<textarea rows="5" cols="20"></textarea>


						<div style="display: flex;">

							<label><b>Select city </b></label> <select id="city" name="city"
								class="form-select form-select-sm">
								<option value="Nagpur">Nagpur</option>
								<option value="Pune">Pune</option>
								<option value="Mumbai">Mumbai</option>

							</select>


						</div>
						<label>Choose date</label> <input type="date" name="dob" id="Date">
						<span style="color: red;" id="chkdate"></span>

						<div class="col text-center">

							<button class="btn btn-success" type="submit">Deliver</button>
						</div>


					</div>

				</form>
			</div>


			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
		</div>
	</div>

</body>
</html> --%>

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
<title>Food Delivery Address</title>
<style>
.signuph1 {
	font-size: 2rem;
	margin-bottom: 1.5rem;
	text-align: center;
	font-weight: bold;
	color: #28a745;
}

.btn-custom {
	margin: 10px;
}

textarea {
	width: 100%;
	resize: none;
	margin-bottom: 1rem;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ced4da;
}

label {
	margin-bottom: 0.5rem;
	font-weight: bold;
}
</style>
</head>
<body>
	<c:set var="msg" scope="session" value="${msg}" />
	<c:if test="${msg=='success' }">
		<script type="text/javascript">
			Swal.fire({
				title : "Success",
				text : "Please provide food delivery address",
				icon : "success"
			});
		</script>
	</c:if>

	<c:remove var="msg" scope="session" />

	<div class="container-fluid py-4">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10 col-sm-12">
				<div class="text-center mb-4">
					<a href="/MavenProject1/viewcart">
						<button class="btn btn-warning btn-custom">
							<i class="bi bi-arrow-left-circle"></i> Return to Cart
						</button>
					</a> <a href="view">
						<button class="btn btn-primary btn-custom">Go to
							Dashboard</button>
					</a>
				</div>

				<form action="deliver" method="post"
					class="p-4 border rounded shadow">
					<h1 class="signuph1">Delivery Address</h1>

					<div class="form-group mb-3">
						<label><span style="color: red;">*</span> Address </label><span
							style="color: red;" id="chkphone"></span>
						<textarea rows="5" cols="20" name="address"
							placeholder="Enter your delivery address here..." required></textarea>
					</div>

					<div class="form-group mb-3">
						<label><b>Select City </b></label> <select id="city" name="city"
							class="form-select form-select-sm">
							<option value="Nagpur">Nagpur</option>
							<option value="Pune">Pune</option>
							<option value="Mumbai">Mumbai</option>
						</select>
					</div>

					<div class="form-group mb-3">
						<label>Choose Date</label> <input type="date" name="dob" id="Date"
							class="form-control" required> <span style="color: red;"
							id="chkdate"></span>
					</div>

					<div class="text-center">
						<button class="btn btn-success btn-lg" type="submit">Deliver</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>

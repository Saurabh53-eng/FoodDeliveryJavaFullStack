<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Add food item</title>
<style type="text/css">
.row {
	margin-top: 0%;
}

.form-check {
	margin-left: 2%;
}

.label {
	color: white;
	background-color: black;
}

.add_food {
	margin-left: 30%;
}

.btn {
	margin-top: 2%;
}

label {
	margin-top: 1%;
}

.foodtype {
	display: flex;
}
</style>
</head>
<c:url var="image" value="/resources/image/FoodBgImage.jpg"></c:url>
<body
	style="background-image: url('${image}'); background-repeat: no-repeat; background-size: 100vw 100vh;" />
<div class="container-fluid">

	<c:set var="fadd" scope="session" value="${fadd}" />
	<c:if test="${fadd=='failed'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Failed",
				text : "Food already exists",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="fadd" scope="session" />
	<div class="row">

		<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

		<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
			<a href="adminView"><button>Go to dash board</button></a>
			<form action="addFoodItem" onsubmit="return onValidate();"
				method="post">

				<div class="form-group">

					<h1 class="add_food"
						style="color: white; background-color: black; width: 20vw;">Add
						food item</h1>
					<label class="label"> Enter food name</label><input type="text"
						name="fname" class="form-control" placeholder="Enter food name"
						id="fname">
					<!--  -->

					<!--  -->

					<!--  -->
					<label class="label">Price </label> <input type="number"
						name="price" class="form-control" id="price"
						placeholder="Enter price">
					<!--  -->
					<label class="label"> Quantity</label> <input type="number"
						name="quantity" class="form-control" id="quantity"
						placeholder="Enter quantity"> <br>

					<div style="display: flex;">

						<div class="foodtype">

							&nbsp; &nbsp;<label class="label"><b>Food type</b></label>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="radio" name="ftype"
								id="veg" value="veg"> <label class="form-check-label"
								for="flexRadioDefault1"> Veg </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="ftype"
								id="nonveg" value="nonveg"> <label
								class="form-check-label" for="flexRadioDefault2"> Non
								veg </label>
						</div>
					</div>
					<section id="uploadfoodpicture">
						<div class="form-group">
							<label class="label">Upload food image</label><span
								style="color: red;" id="chkfimage"> </span> <input type="file"
								name="fimage" id="fimage" class="form-control">
						</div>
					</section>


					<label class="label">Choose date</label> <input type="date"
						name="dob" id="dob"> <span style="color: red;"
						id="chkdate"></span>

					<div class="col text-center">

						<button class="btn btn-success" type="submit">Submit</button>
					</div>


				</div>

			</form>

		</div>
		<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
	</div>
</div>
<script>
	function onValidate() {
		String fimage = document.getElementById("fimage").value;
		if (fimage == " " || fimage == null) {
			document.getElementById("chkfimage").innerHTML = " * Food image must be added";
			document.getElementById("fimage").focus();
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
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Add food item</title>
<style type="text/css">
.error-message {
	color: white;
	background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
	padding: 5px;
	border-radius: 5px;
	font-size: 14px;
	margin-top: 5px;
	display: inline-block;
}

.row {
	margin-top: 0%;
}

.form-check {
	margin-left: 2%;
}

.label {
	color: white;
	background-color: black;
}

.add_food {
	margin-left: 30%;
}

.btn {
	margin-top: 2%;
}

label {
	margin-top: 1%;
}

.foodtype {
	display: flex;
}
</style>
</head>
<c:url var="image" value="/resources/image/FoodBgImage.jpg"></c:url>
<body
	style="background-image: url('${image}'); background-repeat: no-repeat; background-size: 100vw 100vh;">
	<div class="container-fluid">
		<c:set var="fadd" scope="session" value="${fadd}" />
		<c:if test="${fadd=='failed'}">
			<script type="text/javascript">
				Swal.fire({
					title : "Failed",
					text : "Food already exists",
					icon : "error"
				});
			</script>
		</c:if>
		<c:remove var="fadd" scope="session" />
		<div class="row">
			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<a href="adminView"><button>Go to dash board</button></a>
				<form action="addFoodItem" onsubmit="return onValidate();"
					method="post">

					<div class="form-group">

						<h1 class="add_food"
							style="color: white; background-color: black; width: 20vw;">Add
							food item</h1>
						<label class="label"> Enter food name</label><span
							style="color: red;" id="chkfname"></span><input type="text"
							name="fname" class="form-control" placeholder="Enter food name"
							id="fname"> <label class="label">Price </label> <span
							style="color: red;" id="chkprice"></span><input type="number"
							name="price" class="form-control" id="price"
							placeholder="Enter price"> <label class="label">
							Quantity</label> <span style="color: red;" id="chkquantity"></span><input
							type="number" name="quantity" class="form-control" id="quantity"
							placeholder="Enter quantity"> <br>

						<div style="display: flex;">
							<div class="foodtype">
								&nbsp; &nbsp;<label class="label"><b>Food type</b></label>
							</div>

							<div class="form-check">
								<input class="form-check-input" type="radio" name="ftype"
									id="veg" value="veg"> <label class="form-check-label"
									for="veg"> Veg </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="ftype"
									id="nonveg" value="nonveg"> <label
									class="form-check-label" for="nonveg"> Non veg </label>
							</div>
						</div>
						<span style="color: red;" id="chkftype"></span>
						<section id="uploadfoodpicture">
							<div class="form-group">
								<label class="label">Upload food image</label><span
									style="color: red;" id="chkfimage"></span> <input type="file"
									name="fimage" id="fimage" class="form-control">
							</div>
						</section>


						<label class="label">Choose date</label> <input type="date"
							name="dob" id="dob"> <span style="color: red;"
							id="chkdate"></span>

						<div class="col text-center">
							<button class="btn btn-success" type="submit">Submit</button>
						</div>


					</div>

				</form>

			</div>
			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
		</div>
	</div>
	<script>
		function onValidate() {
			 let isValid = true;

			    // Validate food name
			    let fname = document.getElementById("fname").value.trim();
			    if (fname === "") {
			        document.getElementById("chkfname").innerHTML = "<span class='error-message'>* Food name is required</span>";
			        isValid = false;
			    } else {
			        document.getElementById("chkfname").innerHTML = "";
			    }

			    // Validate price
			    let price = document.getElementById("price").value;
			    if (price === "" || price <= 0) {
			        document.getElementById("chkprice").innerHTML = "<span class='error-message'>* Price must be greater than 0</span>";
			        isValid = false;
			    } else {
			        document.getElementById("chkprice").innerHTML = "";
			    }

			    // Validate quantity
			    let quantity = document.getElementById("quantity").value;
			    if (quantity === "" || quantity <= 0) {
			        document.getElementById("chkquantity").innerHTML = "<span class='error-message'>* Quantity must be greater than 0</span>";
			        isValid = false;
			    } else {
			        document.getElementById("chkquantity").innerHTML = "";
			    }

			    // Validate food type
			    if (!document.getElementById("veg").checked && !document.getElementById("nonveg").checked) {
			        document.getElementById("chkftype").innerHTML = "<span class='error-message'>* Please select a food type</span>";
			        isValid = false;
			    } else {
			        document.getElementById("chkftype").innerHTML = "";
			    }

			    // Validate file upload
			    let fimage = document.getElementById("fimage").value;
			    if (fimage === "" || fimage === null) {
			        document.getElementById("chkfimage").innerHTML = "<span class='error-message'>* Food image must be uploaded</span>";
			        isValid = false;
			    } else {
			        document.getElementById("chkfimage").innerHTML = "";
			    }

			    // Validate date
			    let dob = document.getElementById("dob").value;
			    if (dob === "") {
			        document.getElementById("chkdate").innerHTML = "<span class='error-message'>* Please choose a date</span>";
			        isValid = false;
			    } else {
			        document.getElementById("chkdate").innerHTML = "";
			    }

			    return isValid;
		}
	</script>
</body>
</html>

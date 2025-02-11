<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Food update page</title>
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
	<div class="row">

		<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

		<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
			<a href="/MavenProject1/adminView"><button>Go to dash
					board</button></a>
			<form:form action="/MavenProject1/fupdate"
				onsubmit="return onValidate();" method="post">

				<div class="form-group">

					<h1 class="add_food"
						style="color: white; background-color: black; width: 20vw;">Add
						food item</h1>
					<label>Id</label>
					<form:input class="form-control" path="id" />
					<label class="label"> Enter food name</label>
					<form:input class="form-control" placeholder="Enter food name"
						path="fname" />
					<!--  -->
					<label class="label">Price </label>
					<form:input type="number" name="price" class="form-control"
						id="price" placeholder="Enter price" path="price" />
					<!--  -->
					<label class="label"> Quantity</label>
					<form:input type="number" name="quantity" class="form-control"
						id="quantity" placeholder="Enter quantity" path="quantity" />
					<!--  -->
					<br>

					<div style="display: flex;">

						<div class="foodtype">

							&nbsp; &nbsp;<label class="label"><b>Food type</b></label>
						</div>

						<div class="form-check">
							<form:radiobutton class="form-check-input" id="veg" value="veg"
								path="ftype" />
							<label class="form-check-label" for="flexRadioDefault1">
								Veg </label>
						</div>
						<div class="form-check">
							<form:radiobutton class="form-check-input" id="nonveg"
								value="nonveg" path="ftype" />
							<label class="form-check-label" for="flexRadioDefault2">
								Non veg </label>
						</div>
					</div>
					<section id="uploadfoodpicture">
						<div class="form-group">
							<label class="label">Upload food image</label><span
								style="color: red;" id="chkfimage"> </span>
							<form:input type="file" class="form-control" path="fimage" />
						</div>
					</section>

					<label class="label">Choose date</label>
					<form:input type="date" path="dob" id="Date" />
					<span style="color: red;" id="chkdate"></span>

					<div class="col text-center">
						<form:button class="btn btn-success" type="submit">Update</form:button>
					</div>


				</div>

			</form:form>

		</div>
		<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>
	</div>
</div>
<script>
	function onValidate() {
		String
		fimage = document.getElementById("fimage").value;
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
</html>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Cart</title>
<script>
	// Function to print the bill
	function printBill() {
		const originalContents = document.body.innerHTML;
		const printContents = document.getElementById('print-section').innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}
</script>
</head>
<body>
	<h2>Your Cart</h2>
	<div id="print-section">
		<table border="1">
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Food Image</th>
					<th>Food Type</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cart}">
					<tr>
						<td>${item.fname}</td>
						<td><img
							src="<c:url value="/resources/FoodImage/${item.fimage}"/>"
							alt="${item.fimage}" class="image"
							style="width: 30vw; height: 40vh;"></td>
						<td>${item.ftype}</td>
						<td>${item.price}</td>
						<td>${item.quantity}</td>
						<td>${item.price * item.quantity}</td>
					</tr>
					<c:set var="total" value="${total + (item.price * item.quantity)}" />
				</c:forEach>
				<!-- Display the total -->
				<tr>
					<td colspan="5" style="text-align: right;"><strong>Total:</strong></td>
					<td><strong>${total}</strong></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Add "Buy" and "Print Bill" options -->
	<div style="margin-top: 20px;">
		<form action="/MavenProject1/buy" method="post">
			<button type="submit">Buy</button>
		</form>
		<button onclick="printBill()">Print Bill</button>
	</div>

	<a href="/MavenProject1/view">Back to Products</a>
</body>
</html> --%>
<%-- 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.table img {
	max-width: 100px;
	max-height: 100px;
	object-fit: cover;
}

.btn-custom {
	margin: 10px 5px;
}
</style>
<script>
	// Function to print the bill
	function printBill() {
		const originalContents = document.body.innerHTML;
		const printContents = document.getElementById('print-section').innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}
</script>
</head>
<body>
	<div class="container mt-5">
		<div class="mt-3">
			<a href="/MavenProject1/view" class="btn btn-secondary">Back to
				Products</a>
		</div>
		<h2 class="text-center mb-4">Your Cart</h2>
		<div id="print-section">
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead class="table-dark">
						<tr>
							<th>Product Name</th>
							<th>Food Image</th>
							<th>Food Type</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${cart}">
							<tr>
								<td>${item.fname}</td>
								<td><img
									src="<c:url value='/resources/FoodImage/${item.fimage}'/>"
									alt="${item.fimage}" class="img-thumbnail"></td>
								<td>${item.ftype}</td>
								<td>$${item.price}</td>
								<td>${item.quantity}</td>
								<td>$${item.price * item.quantity}</td>
							</tr>
							<c:set var="total"
								value="${total + (item.price * item.quantity)}" />
						</c:forEach>
						<!-- Display the total -->
						<tr class="table-info">
							<td colspan="5" class="text-end"><strong>Total:</strong></td>
							<td><strong>$${total}</strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Add "Buy" and "Print Bill" options -->
		<div class="d-flex justify-content-center mt-4">
			<form action="/MavenProject1/buyfood" method="post" class="d-inline">
				<button type="submit" class="btn btn-success btn-custom">Buy</button>
			</form>
			<button onclick="printBill()" class="btn btn-primary btn-custom">Print
				Bill</button>
		</div>


	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> --%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.table img {
	max-width: 100px;
	max-height: 100px;
	object-fit: cover;
}

.btn-custom {
	margin: 5px;
}
</style>
<script>
	// Function to print the bill
	function printBill() {
		const originalContents = document.body.innerHTML;
		const printContents = document.getElementById('print-section').innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}
</script>
</head>
<body>
	<div class="container mt-5">
		<div class="mt-3">
			<a href="/MavenProject1/view" class="btn btn-secondary">Back to
				Products</a>
		</div>
		<h2 class="text-center mb-4">Your Cart</h2>
		<div id="print-section">
			<div class="table-responsive">
				<c:choose>
					<c:when test="${not empty cart}">
						<table class="table table-bordered table-hover">
							<thead class="table-dark">
								<tr>
									<th>Product Name</th>
									<th>Food Image</th>
									<th>Food Type</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${cart}">
									<tr>
										<td>${item.fname}</td>
										<td><img
											src="<c:url value='/resources/FoodImage/${item.fimage}'/>"
											alt="${item.fimage}" class="img-thumbnail"></td>
										<td>${item.ftype}</td>
										<td>$${item.price}</td>
										<td>${item.quantity}</td>
										<td>$${item.price * item.quantity}</td>
										<td>
											<!-- Increment Quantity -->
											<form action="/MavenProject1/updateCart" method="post"
												class="d-inline">
												<input type="hidden" name="action" value="increment">
												<input type="hidden" name="itemId" value="${item.id}">
												<button type="submit" class="btn btn-sm btn-success">+</button>
											</form> <!-- Decrement Quantity -->
											<form action="/MavenProject1/updateCart" method="post"
												class="d-inline">
												<input type="hidden" name="action" value="decrement">
												<input type="hidden" name="itemId" value="${item.id}">
												<button type="submit" class="btn btn-sm btn-warning">-</button>
											</form> <!-- Remove Item -->
											<form action="/MavenProject1/updateCart" method="post"
												class="d-inline">
												<input type="hidden" name="action" value="remove"> <input
													type="hidden" name="itemId" value="${item.id}">
												<button type="submit" class="btn btn-sm btn-danger">Remove</button>
											</form>
										</td>
									</tr>
									<c:set var="total"
										value="${total + (item.price * item.quantity)}" />
								</c:forEach>
								<!-- Display the total -->
								<tr class="table-info">
									<td colspan="6" class="text-end"><strong>Total:&nbsp;&nbsp;
											$${total}</strong></td>
									<td><strong></strong></td>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p class="text-center">Your cart is empty!</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<!-- Add "Buy" and "Print Bill" options -->
		<div class="d-flex justify-content-center mt-4">
			<form action="/MavenProject1/buyfood" method="post" class="d-inline">
				<button type="submit" class="btn btn-success btn-custom">Buy</button>
			</form>
			<button onclick="printBill()" class="btn btn-primary btn-custom">Print
				Bill</button>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


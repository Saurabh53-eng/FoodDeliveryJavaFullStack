/**
 * 
 */
$(document).ready(function() {
	$("#btn").click(function() {
		$.get("http://localhost:8085/SpringWebMVCCrud/jsonstring", function(data, status) {
			alert("hiii");
			$("#para").html(data);
			$("#txt").val(data);
		})
	})
	$("#tableresponse").click(function() {
		$.get("http://localhost:8085/SpringWebMVCCrud/jsonlist", function(data, status) {
			/* alert(data[0].email); */
			$("#tabl tbody").empty();
			data.forEach(function(item) {
				$("#tabl tbody").append("<tr><td>" + item.id + "</td><td>" + item.email + "</td><td>" + item.name + "</td></tr>");
			})
		})
	})
})
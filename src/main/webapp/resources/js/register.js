document.getElementById("email").addEventListener("blur", function() {
	const email = this.value;

	fetch(`/check-email?email=${email}`)
		.then(response => response.json())
		.then(data => {
			if (data) {
				document.getElementById("email-error").innerText = "Email already exists!";
			} else {
				document.getElementById("email-error").innerText = "";
			}
		});
});
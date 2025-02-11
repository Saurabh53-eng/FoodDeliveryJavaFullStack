<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email page</title>
</head>
<body>
	<h2>Send e-mail to someone@example.com:</h2>

	<form action="verifymail" method="post">
		Subject:<br> <input type="text" name="subject"><br>
		To:<br> <input type="email" name="to"><br> message:<br>
		<input type="text" name="msg" size="50"><br> <br> <input
			type="submit" value="Send"> <input type="reset" value="Reset">
	</form>
</body>
</html>
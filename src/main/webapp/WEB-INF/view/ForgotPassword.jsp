<%-- 
    Document   : EnterEmail
    Created on : Oct 1, 2024, 7:35:19 PM
    Author     : bands
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Forgot password page</title>
</head>
<body>
	<%
	String sesreg = (String) session.getAttribute("sesreg");

	if (sesreg == null) {

	} else {
	%>
	<script>

            <%-- swal({
                      title: "Success",
                      text: "<%=sesreg%>",
                            icon : "success",
                    }); --%>
            alert("<%=sesreg%>")
                    /*  */
        </script>
	<%
	}
	session.setAttribute("sesreg", null);
	%>

	<c:set var="sesmsg" scope="session" value="${msg}" />
	<c:if test="${sesmsg=='failed'}">
		<script type="text/javascript">
			Swal.fire({
				title : "Error",
				text : "Please enter email",
				icon : "error"
			});
		</script>
	</c:if>
	<c:remove var="sesmsg" scope="session" />

	<div class="container-fluid">



		<div class="row">
			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<form action="EnterEmailServer" method="post"
					onsubmit="return onValidate();">

					<div class="form-group">

						<h1 class="loginh1" style="text-align: center;">Get password</h1>
						<label> Enter email id</label><span style="color: red;"
							id="chkemail"> </span> <input type="email" class="form-control"
							placeholder="Enter email address" name="to" id="email"
							aria-describedby="emailHelp"> <br> <br>
						<div class="col text-center">
							<button class="btn btn-success" type="submit">Submit</button>
						</div>
						<div class="underbutton">
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
	<script>

                    function onValidate() {

                        let email = document.getElementById("email").value;

                        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                        if (email === "" || email === null) {
                            document.getElementById("chkemail").innerHTML = " * Email id field is required";
                            document.getElementById("email").focus();
                            return false;
                        } else if (!emailRegex.test(email)) {
                            document.getElementById("chkemail").innerHTML = "* invalid email id";
                            document.getElementById("email").focus();
                            return false;
                        } else {
                            return true;
                        }
                    }

        </script>
</body>
</html>

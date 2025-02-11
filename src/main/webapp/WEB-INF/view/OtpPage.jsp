<%-- 
    Document   : OTP
    Created on : Oct 2, 2024, 5:04:45 PM
    Author     : bands
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
	<%
	String sesmsg = (String) session.getAttribute("msg");

	if (sesmsg == null) {

	} else {
	%>
	<script>

            <%-- swal({
                      title: "Success",
                      text: "<%=sesreg%>",
                            icon : "success",
                    }); --%>
            alert("<%=sesmsg%>")
                    /*  */
        </script>
	<%
	}
	session.setAttribute("sesmsg", null);
	%>
	




	<div class="container-fluid">


		<div class="row">
			<div class="col col-lg-2 col-md-2 col-sm-4 col-xs-6"></div>

			<div class="col col-lg-8 col-md-8 col-sm-12 col-xs-12">
			<%-- 	<%
				String otp = (String) session.getAttribute("otp");

				if (otp == null) {

				} else {
				%>
				<script>

            swal({
                      title: "Success",
                      text: "<%=sesreg%>",
                            icon : "success",
                    });
            alert("<%=otp%>")
                    /*  */
        </script>
				<%
				}
				session.setAttribute("otp", null);
				%> --%>
				<c:url var="otp" value="otp" scope="session"></c:url>
				<form action="OTPServer" method="post"
					onsubmit="return onValidate();">

					<div class="form-group">

						<h1 class="loginh1" style="text-align: center;">OTP Page</h1>
						<label> Enter OTP</label><span style="color: red;" id="chkotp">
						</span> <input type="number" class="form-control" placeholder="Enter OTP"
							name="otp" id="otp"> <br> <br>
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

                        let otp = document.getElementById("otp").value;

                        if (otp === "" || otp === null) {
                            document.getElementById("chkotp").innerHTML = " * Please enter OTP to go further";
                            document.getElementById("otp").focus();
                            return false;

                        } else {

                            return true;
                        }
                    }
        </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>Register For restaurants</title>

<!-- Icons font CSS-->
<link
	href="${pageContext.request.contextPath}/resources/account/register/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="${pageContext.request.contextPath}/resources/account/register/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link
	href="${pageContext.request.contextPath}/resources/account/register/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${pageContext.request.contextPath}/resources/account/register/vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link
	href="${pageContext.request.contextPath}/resources/account/register/css/main.css"
	rel="stylesheet" media="all">
</head>

<body>
	<div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
		<div class="wrapper wrapper--w960">
			<div class="card card-2">
				<div class="card-heading"></div>
				<div class="card-body">
					<h2 class="title">Registration Info</h2>
					<s:form method="post" modelAttribute="account"
						action="${pagecontext.request.contextPath }/account/register2">

						<div class="input-group">
							<s:input class="input--style-2" path="username"
								placeholder="Username" name="name" />
								<s:errors style="color: red" path="username"></s:errors>
						</div>

						<div class="input-group">
							<s:password class="input--style-2" path="password"
								placeholder="Password" name="name" />
								<s:errors style="color: red" path="password"></s:errors>
						</div>
						<div class="input-group">
							<s:input class="input--style-2" path="fullname"
								placeholder="Fullname" name="name" />
								<s:errors style="color: red" path="fullname"></s:errors>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<s:input class="input--style-2" path="phone"
										placeholder="Phone" name="name" type="number" />
										<s:errors style="color: red" path="phone"></s:errors>
								</div>
							</div>

						</div>
						<div class="p-t-30">
							<s:input path="roles" type="hidden" value="2" />
							<input class="btn btn--radius btn--green" type="submit"
value="Register">
						</div>
					</s:form>
					<a href="${pageContext.request.contextPath }/account/login"
							class="signup-image-link">I am already member</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script
		src="${pageContext.request.contextPath}/resources/account/register/vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script
		src="${pageContext.request.contextPath}/resources/account/register/vendor/select2/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/account/register/vendor/datepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/account/register/vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script
		src="${pageContext.request.contextPath}/resources/account/register/js/global.js"></script>

</body>

</html>

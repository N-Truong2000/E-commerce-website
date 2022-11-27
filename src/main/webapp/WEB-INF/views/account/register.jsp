<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login form</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/account/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/account/css/style.css">
</head>
<body>
	<div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
						<s:form method="post" modelAttribute="account"
							action="${pagecontext.request.contextPath }/account/register"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label>
								<s:input type="text" path="username" id="name"
									placeholder="User Name" />
									<s:errors style="color: red" path="username"></s:errors>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label>
								<s:input type="password" path="password" id="pass"
									placeholder="Password" />
									<s:errors style="color: red" path="password"></s:errors>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
									<s:errors style="color: red" path="password"></s:errors>
							</div>
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label>
								<s:input type="text" path="fullname" id="name"
									placeholder="Full Name" />
									<s:errors style="color: red" path="fullname"></s:errors>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label>
								<s:input type="text" path="phone" id="email"
									placeholder="Your phone" />
									<s:errors style="color: red" path="phone"></s:errors>
							</div>


							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
							<s:input type="hidden" path="roles" value = "1"/>
								<input type="submit" name="signup" id="signup"
class="form-submit" value="Register" />
							</div>
						</s:form>
					</div>
					<div class="signup-image">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/account/images/signup-image.jpg"
								alt="sing up image">
						</figure>
						<a href="${pageContext.request.contextPath }/account/login"
							class="signup-image-link">I am already member</a>
							<a href="${pageContext.request.contextPath }/account/register2"
							class="signup-image-link">I want to register for restaurant</a>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- JS -->
	<script
		src="${pageContext.request.contextPath}/resources/account/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/account/js/main.js"></script>
</body>
</html>
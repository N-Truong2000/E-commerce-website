<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" required="true" rtexprvalue="true"
	type="java.lang.String"%>
<%@ attribute name="content" fragment="true"%>
<%@ attribute name="search" fragment="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Amado - Book what you want | Home</title>

<!-- Favicon  -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/user/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/core-style.css">
<link rel="stylesheet" href="style.css">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#date" ).datepicker();
  } );
  </script>
</head>

<body>


	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

		<!-- Mobile Nav (max width 767px)-->
		<div class="mobile-nav">
			<!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="index.html"><img
					src="${pageContext.request.contextPath}/resources/user/img/core-img/logo.jpg"
					alt=""></a>
			</div>
			<!-- Navbar Toggler -->
			<div class="amado-navbar-toggler">
				<span></span><span></span><span></span>
			</div>
		</div>

		<!-- Header Area Start -->
		<header class="header-area clearfix">
			<!-- Close Icon -->
			<div class="nav-close">
				<i class="fa fa-close" aria-hidden="true"></i>
			</div>
			<!-- Logo -->
			<div class="logo">
				<a href="index.html"><img
					src="${pageContext.request.contextPath}/resources/user/img/core-img/logo.jpg"
					alt=""></a>
			</div>
			<!-- Amado Nav -->
			<nav class="amado-nav">
				<ul>
					<li class="active"><a
						href="${pageContext.request.contextPath }/user/index">Restaurant</a></li>

					<li><a href="#" class="search-nav"><img
							src="${pageContext.request.contextPath}/resources/user/img/core-img/search.png"
							alt=""> Search</a></li>
					<li><a href="${pageContext.request.contextPath }/user/cart"
						class="cart-nav"><img
							src="${pageContext.request.contextPath}/resources/user/img/core-img/cart.png"
							alt=""> Cart <span>(<c:out
									value="${sessionScope.myCartNum}" />)
						</span></a></li>
					<li><a
						href="${pageContext.request.contextPath }/user/profile/${pageContext.request.userPrincipal.name }">Profile</a></li>

					<li><a href="${pageContext.request.contextPath }/user/logout">Logout</a></li>
				</ul>
			</nav>
			<!-- Button Group -->
			<div class="amado-btn-group mt-30 mb-100">
				<a href="#" class="btn amado-btn mb-15">%Discount%</a> <a
					href="${pageContext.request.contextPath}/restaurant/"
					class="btn amado-btn active">Your restaurant</a>
			</div>
			<!-- Cart Menu -->
			<div class="cart-fav-search mb-100">
				<a href="#" class="fav-nav"><img
					src="${pageContext.request.contextPath}/resources/user/img/core-img/favorites.png"
					alt=""> Favourite</a>
			</div>
			<!-- Social Button -->
			<div class="social-info d-flex justify-content-between">
				<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a> <a
					href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> <a
					href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a
					href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
			</div>
		</header>
		<!-- Header Area End -->

		<jsp:invoke fragment="content"></jsp:invoke>

	</div>
	<!-- ##### Main Content Wrapper End ##### -->

	<!-- ##### Newsletter Area Start ##### -->
	<section class="newsletter-area section-padding-100-0">
		<div class="container">
			<div class="row align-items-center">
				<!-- Newsletter Text -->
				<div class="col-12 col-lg-6 col-xl-7">
					<div class="newsletter-text mb-100">
						<h2>
							Subscribe for a <span>25% Discount</span>
						</h2>
						<p>Nulla ac convallis lorem, eget euismod nisl. Donec in
							libero sit amet mi vulputate consectetur. Donec auctor interdum
							purus, ac finibus massa bibendum nec.</p>
					</div>
				</div>
				<!-- Newsletter Form -->
				<div class="col-12 col-lg-6 col-xl-5">
					<div class="newsletter-form mb-100">
						<form
							action="${pageContext.request.contextPath }/user/savecontact"
							method="post">

							<input type="hidden" name="username"
								value="${pageContext.request.userPrincipal.name }"> <input
								type="text" placeholder="Content...." class="nl-email"
								name="content"></input> <input type="submit" value="Sent">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Newsletter Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row align-items-center">
				<!-- Single Widget Area -->
				<div class="col-12 col-lg-4">
					<div class="single_widget_area">
						<!-- Logo -->
						<div class="footer-logo mr-50">
							<a href="index.html"><img
								src="${pageContext.request.contextPath}/resources/user/img/core-img/logo2.png"
								alt=""></a>
						</div>
						<!-- Copywrite Text -->
						<p class="copywrite">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> &
							Re-distributed by <a href="https://themewagon.com/"
								target="_blank">Themewagon</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
				<!-- Single Widget Area -->
				<div class="col-12 col-lg-8">
					<div class="single_widget_area">
						<!-- Footer Menu -->
						<div class="footer_menu">
							<nav class="navbar navbar-expand-lg justify-content-end">
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#footerNavContent"
									aria-controls="footerNavContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<i class="fa fa-bars"></i>
								</button>
								<div class="collapse navbar-collapse" id="footerNavContent">
									<ul class="navbar-nav ml-auto">
										<li class="nav-item active"><a class="nav-link"
											href="${pageContext.request.contextPath }/user/index">Restaurant</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath }/user/menu">Menu</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${pageContext.request.contextPath }/user/cart">Cart</a>
										</li>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area End ##### -->

	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/plugins.js"></script>
	<!-- Active js -->
	<script
		src="${pageContext.request.contextPath}/resources/user/js/active.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Core Style CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/css/core-style.css">
<link rel="stylesheet" href="style.css">
<h3>Dashboard restaurants, Welcome ${fullname }</h3>
<div class="single-product-wrapper">
	<a href="${pageContext.request.contextPath }/restaurant/addRes/${pageContext.request.userPrincipal.name }"><h4 style="color: #04B45F" >Create new restaurant</h4></a>
</div>

<div class="amado_product_area section-padding-100">
	<div class="container-fluid">
		<div class="row">
			<c:forEach var="restaurant" items="${restaurants }">
				<!-- Single Product Area -->
				<div class="col-12 col-sm-6 col-md-12 col-xl-6">
					<div class="single-product-wrapper">
						<a
							href="${pageContext.request.contextPath }/restaurant/restaurantdetail/${restaurant.id}">
							<!-- Product Image -->
							<div class="product-img">
								<img width="500" height="500"
									src="${pageContext.request.contextPath }/assets/images/${restaurant.photo}"
									alt="">
							</div> <!-- Product Description -->
							<div
								class="product-description d-flex align-items-center justify-content-between">
								<!-- Product Meta Data -->
								<div class="product-meta-data">
									<div class="line"></div>
									<p class="product-price">${restaurant.fullname }</p>

									<h6>${restaurant.address }</h6>

								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
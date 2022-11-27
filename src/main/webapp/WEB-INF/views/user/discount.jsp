<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<mt:template_user title="Home page">
	<jsp:attribute name="content">
	<div class="search-wrapper section-padding-100">
		<div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form
								action="${pageContext.request.contextPath }/user/searchbyname"
								method="post">
                            <input type="search" name="search"
									id="search" placeholder="Type your keyword...">
                            <button type="submit">
									<img
										src="${pageContext.request.contextPath}/resources/user/img/core-img/search.png"
										alt="">
								</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
	</div>

                        
 <!-- Product Catagories Area Start -->
     <div class="products-catagories-area clearfix">
	   	<div class="checkout_details_area mt-50 clearfix">
			<div class="cart-title">
	              <h2>Welcome ${pageContext.request.userPrincipal.name }</h2>
	        </div>
   		</div>
  	    <div class="amado-pro-catagory clearfix">
	         <c:forEach var="dis" items="${discounts}">
			     <div class="single-products-catagory clearfix">
	                <a href="#">
	                        <img
							src="${pageContext.request.contextPath }/resources/discount/img/${dis.photo}"
							alt="">
	                        <!-- Hover Content -->
	                  	<div class="hover-content">
	                      	<div class="line"></div>
	                         <p>${dis.restaurant.fullname }</p>
	                         <p>$${dis.money}</p>
	                         <p>${dis.description }</p>
	                    </div>
	                  </a>
	              </div>
			</c:forEach>
        </div>
    </div>

	</jsp:attribute>
</mt:template_user>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_user title="Menu">
	<jsp:attribute name="content">
   <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a
									href="${pageContext.request.contextPath}/user/index">Home</a></li>
                                <li class="breadcrumb-item"><a
									href="${pageContext.request.contextPath}/user/menu/${res.id}">${res.name }</a></li>
                                <li class="breadcrumb-item"><a
									href="">${detail.name }</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider"
								class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active"
										data-target="#product_details_slider" data-slide-to="0"
										style="background-image: url(img/product-img/pro-big-1.jpg);">
                                    </li>
                                    <li
										data-target="#product_details_slider" data-slide-to="1"
										style="background-image: url(img/product-img/pro-big-2.jpg);">
                                    </li>
                                    <li
										data-target="#product_details_slider" data-slide-to="2"
										style="background-image: url(img/product-img/pro-big-3.jpg);">
                                    </li>
                                    <li
										data-target="#product_details_slider" data-slide-to="3"
										style="background-image: url(img/product-img/pro-big-4.jpg);">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="">
                                            <img class="d-block w-100"
											src="${pageContext.request.contextPath }/resources/menu/img/${detail.photos[0].name}"
											alt="First slide">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">$${detail.price }</p>
                                <a href="product-details.html">
                                    <h6>${detail.name }</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div
									class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star"
											aria-hidden="true"></i>
                                        <i class="fa fa-star"
											aria-hidden="true"></i>
                                        <i class="fa fa-star"
											aria-hidden="true"></i>
                                        <i class="fa fa-star"
											aria-hidden="true"></i>
                                        <i class="fa fa-star"
											aria-hidden="true"></i>
                                    </div>
                                    <div class="review">
                                        <a href="#">Write A Review</a>
                                    </div>
                                </div>
                                <!-- Avaiable -->
                                <p class="avaibility">
									<i class="fa fa-circle"></i> In Stock</p>
                            </div>

                            <div class="short_overview my-5">
                                <p>${detail.description }</p>
                            </div>

                            <!-- Add to Cart Form -->
                            <div class="cart clearfix">
                                <div class="cart-btn d-flex mb-50">
                                    <p>Qty</p>
                                    <div class="quantity">
                                        <span class="qty-minus"
											onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
											class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number"
											class="qty-text" id="qty" step="1" min="1" max="300"
											name="quantity" value="1">
                                        <span class="qty-plus"
											onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
											class="fa fa-caret-up" aria-hidden="true"></i></span>
                                    </div>
                                </div>
                               
									<a name="addtocart" class="btn amado-btn"
									href="${pageContext.request.contextPath }/user/buy/${detail.id}"
									data-toggle="tooltip" data-placement="left">
												
											Add to cart	</a>
                            </div>
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</jsp:attribute>
</mt:template_user>
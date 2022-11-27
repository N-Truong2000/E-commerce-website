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
											src="${pagecontext.request.contextpath }/assets/images/${detail.photos[0].name}"
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
                                <p class="product-price">$${detail.pricePlus }</p>
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
                            <div class="row">
                            <div class="col-12 col-lg-5">
							<p>Time in - Time out</p>
							</div>
                            <!-- Add to Cart Form -->
                            <div class="cart clearfix col-lg-7 ">
                            
                            <select name="time">
                             <option value="1">08 am - 10 am</option>
                             <option value="2">10 am - 12 am</option>
                             <option value="3">12 am - 14 am</option>
                             <option value="4">14 am - 16 am</option>
                             <option value="5">16 am - 18 am</option>
                             <option value="6">18 am - 20 am</option>
                             <option value="7">20 am - 22 am</option>
                            </select>
                            
                            </div>
                            </div>
                            <div>
									<a name="addtocart" class="btn amado-btn"
									href="${pageContext.request.contextPath }/user/buy2/${detail.id}"
									data-toggle="tooltip" data-placement="left"> Add to cart	</a>
                            </div>
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</jsp:attribute>
</mt:template_user>
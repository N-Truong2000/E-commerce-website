<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_user title="Menu">
	<jsp:attribute name="content">
  <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Catagories</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                        <li><a
							href="${pageContext.request.contextPath }/user/table/${sessionScope.table_id}">All</a></li>
                    </ul>
                </div>
                <div class="catagories-menu">
                    <ul>
                        <li><a
							href="${pageContext.request.contextPath }/user/table/${sessionScope.table_id}">Table</a></li>
                    </ul>
                </div>
            </div>
            <div class="widget price mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Price</h6>

                <div class="widget-desc">
                    <div class="slider-range">
                        <div data-min="10" data-max="1000" data-unit="$"
							class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
							data-value-min="10" data-value-max="1000" data-label-result="">
                            <div
								class="ui-slider-range ui-widget-header ui-corner-all"></div>
                            <span
								class="ui-slider-handle ui-state-default ui-corner-all"
								tabindex="0"></span>
                            <span
								class="ui-slider-handle ui-state-default ui-corner-all"
								tabindex="0"></span>
                        </div>
                        <div class="range-price">$10 - $1000</div>
                    </div>
                </div>
            </div>
        </div>
 <div class="amado_product_area section-padding-100">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div
							class="product-topbar d-xl-flex align-items-end justify-content-between">
                            <!-- Total Products -->
                            <div class="total-products">
                                <p>Showing 1-8 0f 25</p>
                                <div class="view d-flex">
                                    <a href="#"><i
										class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i
										class="fa fa-bars" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <!-- Sorting -->
                            <div class="product-sorting d-flex">
                                <div
									class="sort-by-date d-flex align-items-center mr-15">
                                    <p>Sort by</p>
                                    <form action="#" method="get">
                                        <select name="select"
											id="sortBydate">
                                            <option value="value">Date</option>
                                            <option value="value">Newest</option>
                                            <option value="value">Popular</option>
                                        </select>
                                    </form>
                                </div>
                                <div
									class="view-product d-flex align-items-center">
                                    <p>View</p>
                                    <form action="#" method="get">
                                        <select name="select"
											id="viewProduct">
                                            <option value="value">12</option>
                                            <option value="value">24</option>
                                            <option value="value">48</option>
                                            <option value="value">96</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
       		<div class="row">
       		 <c:forEach var="table" items="${tables }">
	        <!-- Single Product Area -->
            <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                <div class="single-product-wrapper">
               
                            <!-- Product Image -->
                            <a
									href="${pageContext.request.contextPath }/user/tabledetail/${table.id}">
                     <div class="product-img">
                          <img
											src="${pagecontext.request.contextpath }/assets/images/${table.photos[0].name}"
											alt="">
                                <!-- Hover Thumb -->
                          <img class="hover-img"
											src="${pagecontext.request.contextpath }/assets/images/${table.photos[1].name}"
											alt="">
                     </div>
</a>
                            <!-- Product Description -->
                     <div
									class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                         <div class="product-meta-data">
                              <div class="line"></div>
                              <p class="product-price">$ ${table.pricePlus }</p>
                              <a
											href="${pageContext.request.contextPath }/user/tabledetail/${table.id}">
                                       <h6>${table.name }</h6> 
                              </a>
                         </div>
                                <!-- Ratings & Cart -->
                         <div class="ratings-cart text-right">
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
                              <div class="cart">
                                        <a href="#"
												data-toggle="tooltip" data-placement="left" title="Floor">Floor : ${table.floor } </a>
										<a
												href="${pageContext.request.contextPath }/user/buy2/${table.id}"
												data-toggle="tooltip" data-placement="left"
												title="Add to Cart">
										<img
												src="${pageContext.request.contextPath }/resources/user/img/core-img/cart.png"
												alt="">
										</a>
                              </div>
                          </div>
                     </div>
                </div>
            </div>
             </c:forEach>
     	</div>
     </div>
</div>
	</jsp:attribute>
</mt:template_user>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_user title="Cart">
	<jsp:attribute name="content">
 <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
            <form action="${posturl}">
            	<input type="hidden" name="upload" value="1" />
                <input type="hidden" name="return" value="${returnurl }" />
                <input type="hidden" name="cmd" value="_cart" />
                <input type="hidden" name="business" value="${business}" />
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Shopping Cart</h2>
                        </div>
                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Subtoltal</th>
                                        <th>Option</th>
                                    </tr>
                                </thead>
                                <c:set var="total" value="0"></c:set>
                              <c:forEach var="item" items="${sessionScope.cart}" varStatus="i">
									<c:set var="total"
											value="${total + item.menu.price * item.quantity }"></c:set>
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img
													src="${pageContext.request.contextPath}/assets/images/${item.menu.photos[0].name}"
													alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>${item.menu.name}</h5>
                                        </td>
                                        <td class="price">
                                            <span>$${item.menu.price }</span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <p>Qty</p>
                                                <div class="quantity">
                                                    <input type="number"
															class="qty-text" id="qty3" step="1" min="1"
															value="${item.quantity}">
                                                </div>
                                                 <input type="hidden" name="item_name_${i.index+1 }" value="${item.menu.name}">	
                                                 <input type="hidden" name="item_number_${i.index+1 }" value="${item.menu.id}">	
                                                 <input type="hidden" name="amount_${i.index+1 }" value="${item.menu.price}">
                                                 <input type="hidden" name="quantity_${i.index+1 }" value="${item.quantity}">
                                                
                                            </div>
                                        </td>
                                        <td class="qty">
                                            <span>$${item.menu.price * item.quantity} </span>
                                            
                                        </td>
                                        <td class="cart_product_desc">
                                            <div class="qty-btn d-flex">
                                            <a
														href="${pageContext.request.contextPath}/user/remove/${item.menu.id }"
														onclick="return confirm('Are you sure') "
														style="color: red">remove</a>
														
                                            </div>
                                        </td>
                                    </tr>
                                
									</c:forEach>
									
                            </table>
                        </div>
                        <div class="cart-title mt-50">
                            <h2>Booking tables</h2>
                        </div>
                         <div class="cart-table clearfix">
                        
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>Photo</th>
                                        <th>Name</th>
                                        <th>Time - in</th>
                                        <th>Time - out</th>
                                        <th>Subtoltal</th>
                                        <th>Option</th>
                                    </tr>
                                </thead>
                                <c:set var="total2" value="0"></c:set>
                              <c:forEach var="item"
										items="${sessionScope.cart2}" varStatus="i">
									<c:set var="total2" value="${total2 + item.tables.pricePlus}"></c:set>
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img
													src="${pageContext.request.contextPath}/assets/images/${item.tables.photos[0].name}"
													alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>${item.tables.name}</h5>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>${item.tables.timeIn}</h5>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5>${item.tables.timeOut}</h5>
                                        </td>
                                         <td class="price">
                                            <span>$${item.tables.pricePlus }</span>
                                           		 <input type="hidden" name="item_name_${i.index+1 }" value="${item.tables.name}">	
                                                 <input type="hidden" name="item_number_${i.index+1 }" value="${item.tables.id}">	
                                                 <input type="hidden" name="amount_${i.index+1 }" value="${item.tables.pricePlus}">
                                                 <input type="hidden" name="quantity_${i.index+1 }" value="1">
                                        </td>
                                        <td class="cart_product_desc">
                                            <div class="qty-btn d-flex">
                                            <a
														href="${pageContext.request.contextPath}/user/removeTable/${item.tables.id }"
														onclick="return confirm('Are you sure') "
														style="color: red">remove</a>
														
                                            </div>
                                        </td>
                                    </tr>
                                
									</c:forEach>
                            </table>
                    </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                              <div class="widget brands mb-50">
		                <!-- Widget Title -->
		                <h6 class="widget-title mb-30">Form</h6>
		
		                <div class="widget-desc">
		                    <div class="form-check">
		                        <input class="form-check-input" type="radio" checked="checked"
													name="form" value="1" id="amado">
		                        <label class="form-check-label" for="amado">In place</label>
		                    </div>
		                    <div class="form-check">
		                        <input class="form-check-input" type="radio"
													name="form" value="2" id="amado">
		                        <label class="form-check-label" for="amado">Take away</label><br>
		                    </div>
		                    <div class="form-check">
		                        
		                        <input class="form-check-input" type="radio"
													name="form" value="3" id="amado">
		                        <label class="form-check-label" for="amado">Bring</label>
		                    </div>
		                    </div>
		                    </div>
                              <!--   <li><span>Discount:</span> <input
										class="form-control" type="text" name="discount" /></li> -->
                                <li><span>total:</span> <span>$${total + total2}</span></li>
                            </ul>
                            <div class="cart-btn mt-100">
                                <input type="submit" value="Continute"
										class="btn amado-btn w-100">
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        
</jsp:attribute>
</mt:template_user>

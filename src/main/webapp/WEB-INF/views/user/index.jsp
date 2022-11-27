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
	              <h2>Welcome ${fullname }</h2>
	        </div>
   		</div>
  	    <div class="amado-pro-catagory clearfix">
	         <c:forEach var="res" items="${restaurants }">
			     <div class="single-products-catagory clearfix">
	                <a
							href="${pagecontext.request.contextPath }/user/menu/${res.id }">
	                        <img
							src="${pagecontext.request.contextpath }/assets/images/${res.photo}"
							alt="">
	                        <!-- Hover Content -->
	                  	<div class="hover-content">
	                      	<div class="line"></div>
	                         <p>${res.fullname }</p>
	                    </div>
	                  </a>
	              </div>
			</c:forEach>
        </div>
    </div>

	</jsp:attribute>
</mt:template_user>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:template_user title="Profile">
	<jsp:attribute name="content">
	<div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div
							class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Profile</h2>
                            </div>

							<s:form modelAttribute="account" method="post"
								action="${pageContext.request.contextPath}/user/profile">
								<div class="row">
									 <div class="col-md-6 mb-3">
							        	<s:input path="username" class="form-control"
											id="first_name" value="" placeholder="User Name"
											readonly="true" />
											<s:errors style="color: red" path="username"></s:errors>
							         </div>
							         <div class="col-md-6 mb-3">
							              <s:password path="password" class="form-control"
											id="last_name" value="" placeholder="Password" />
											<s:errors style="color: red" path="password"></s:errors>
							        </div>
							         <div class="col-12 mb-3">
							        	<s:input path="fullname" class="form-control"
											id="company" placeholder="Full Name" value="" />
											<s:errors style="color: red" path="fullname"></s:errors>
									 </div>
									 <div class="col-md-6 mb-3">
							        	<s:input path="phone" type="number" class="form-control"
											id="phone_number" min="0" placeholder="Phone No" value="" />
											<s:errors style="color: red" path="phone"></s:errors>
							       	 </div>
							     	  <div class="cart-btn mt-100">
			                               <input value="Save" type="submit" class="btn amado-btn w-100"/>
			                          </div>
							      
								</div>
							</s:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</jsp:attribute>
</mt:template_user>
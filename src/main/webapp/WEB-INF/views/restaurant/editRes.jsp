<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_restaurant title="Update restaurant">
	<jsp:attribute name="content">
    <h3>Update restaurant</h3>
    <div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Form Elements</h2>
									</header>
									
									<div class="panel-body">
										<s:form action="${pageContext.request.contextPath }/restaurant/editRes"  modelAttribute="restaurant" class="form-horizontal form-bordered" method="post">
											<div class="form-group">
												<label class="col-md-3 control-label">FullName</label>
												<div class="col-md-6">
													<s:input path="fullname" class="form-control"/>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-md-3 control-label">Address</label>
												<div class="col-md-6">
													<s:input path="address" class="form-control" placeholder="" />
												</div>												
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" >Email</label>
												<div class="col-md-6">
													<s:input path="email" class="form-control"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" >Phone</label>
												<div class="col-md-6">
													<s:input path="phone" class="form-control"/>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-md-3 control-label" >Description</label>
												<div class="col-md-6">
													<s:input path="description" class="form-control"/>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-md-3 control-label">Status</label>
												<div class="col-md-6">
													<s:checkbox path="status"/>
												</div>
											</div>	
											<s:input type="hidden" path="id"/>
																		
											<div class="form-group">
												<label class="col-md-3 control-label"></label>
												<div class="col-md-6 col-xs-11">
													<input type="submit" value="Save">
												</div>
											</div>	
											
										</s:form>
									</div>
								</section>		
								</div>
						
							</div>
</jsp:attribute>

</mt:template_restaurant>
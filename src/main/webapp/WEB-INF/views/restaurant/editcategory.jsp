<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<mt:template_restaurant title="Update category">
	<jsp:attribute name="content">
    <h3>Edit</h3>
    <div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title">Edit</h2>
									</header>
									<div class="panel-body">
										<s:form action="${pageContext.request.contextPath }/restaurant/editcategory" modelAttribute="category" enctype="multipart/form-data" class="form-horizontal form-bordered" method="post">
											
													<s:hidden path="id" class="form-control"/>
											
											
											<div class="form-group">
												<label class="col-md-3 control-label">Name</label>
												<div class="col-md-6">
													<s:input path="name" class="form-control"/>
												</div>
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
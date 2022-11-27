<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<mt:template_restaurant title="Update table">
	<jsp:attribute name="content">
    <h3>Update table</h3>
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
										<s:form
							action="${pageContext.request.contextPath }/restaurant/edittable"
							enctype="multipart/form-data" modelAttribute="tables"
							class="form-horizontal form-bordered" method="post">
													<s:input path="id" class="form-control" />
											  <div class="form-group">
												<label class="col-md-3 control-label">Name</label>
												<div class="col-md-6">
													<s:input path="name" class="form-control" />
												</div>
											</div>											
											<div class="form-group">
												<label class="col-md-3 control-label">floor</label>
												<div class="col-md-6">
													<s:input path="floor" class="form-control" />
												</div>
											</div>		
											<div class="form-group">
												<label class="col-md-3 control-label">pricePlus</label>
												<div class="col-md-6">
													<s:input path="pricePlus" class="form-control" />
												</div>
											</div>		
											<div class="form-group">
												<label class="col-md-3 control-label">description</label>
												<div class="col-md-6">
													<s:input path="description" class="form-control" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess">Category</label>
												<div class="col-md-6">
													<s:select path="category" items="${categories}"
										itemLabel="name" itemValue="id"></s:select>
												</div>
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
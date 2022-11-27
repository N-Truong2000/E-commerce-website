<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<mt:template_restaurant title="Dashboard">
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
										<s:form action="${pageContext.request.contextPath }/restaurant/editmenu" modelAttribute="menu" enctype="multipart/form-data" class="form-horizontal form-bordered" method="post">
											<div class="form-group">
												<label class="col-md-3 control-label">Name</label>
												<div class="col-md-6">
													<s:input path="name" class="form-control"/>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-md-3 control-label">Price</label>
												<div class="col-md-6">
													<s:input path="price" class="form-control" placeholder="" />
												</div>												
											</div>
											<s:input type="hidden" path="id" />	
											<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess">Category</label>
												<div class="col-md-6">
													<s:select path="category" items="${categories }" itemLabel="name" itemValue="id"></s:select>
												</div>
											</div>	
											
											<div class="form-group">
												<label class="col-md-3 control-label">Description</label>
												<div class="col-md-6">
													<s:input path="description" class="form-control"/>
												</div>
											</div>
												<div class="form-group">
												<label class="col-md-3 control-label" for="inputSuccess" >Photo</label>
												<div class="col-md-6">
													<input type="file" name="files" multiple="multiple"/>
												</div>
											</div>				
											<div class="form-group">
												<label class="col-md-3 control-label">Status</label>
												<div class="col-md-6">
													<s:checkbox path="status"/>
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
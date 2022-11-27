<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_restaurant title="Create category">
	<jsp:attribute name="content">
    <h3>Create category</h3>
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
										<s:form action="${pageContext.request.contextPath }/restaurant/addcategory" enctype="multipart/form-data" modelAttribute="category" class="form-horizontal form-bordered" method="post">
											<div class="form-group">
												<label class="col-md-3 control-label">Name</label>
												<div class="col-md-6">
													<s:input path="name" class="form-control"/>
												</div>
											</div>											
											<div class="form-group">
												<label class="col-md-3 control-label"></label>
												<div class="col-md-6 col-xs-11">
													<input  type="submit" value="Save">
												</div>
											</div>	
										</s:form>
										
									</div>
								</section>		
								</div>
						
							</div>
							<div class="panel-body">
								<table class="table table-bordered table-striped mb-none" id="datatable-default">
									<thead>
										<tr>
										    <th>id</th>
											<th>name</th>
											
										</tr>
									</thead>
									<tbody>
									<c:forEach  var="category" items="${categories }">
										<tr class="gradeX">
											<td>${category.id}</td>
					    					<td>${category.name}</td>
					    					</td>					
					    					<td  class="center hidden-phone">
					    						<a href="${pageContext.request.contextPath }/restaurant/editcategory/${category.id}">Edit ||</a>
					    						<a href="${pageContext.request.contextPath }/restaurant/deletecategory/${category.id}">Delete</a>
					    					</td>										
										</tr>
										
										</c:forEach>
									</tbody>
								</table>
							</div>
						
</jsp:attribute>
</mt:template_restaurant>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_superadmin title="Dashboard">
	<jsp:attribute name="content">
    <h3>Dashboard</h3>
    	<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						
								<h2 class="panel-title">Contact</h2>
							</header>
							<div class="panel-body">
								<table class="table table-bordered table-striped mb-none" id="datatable-default">
									<thead>
										<tr>
											<th>Username</th>
											<th>Content</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach  var="contact" items="${contacts }">
										<tr class="gradeX">
											<td>${contact.account.fullname }</td>
    										<td>${contact.content }</td>
					    					
					    					<td  class="center hidden-phone">
					    						<a href="${pageContext.request.contextPath }/superadmin/editAccount/${contact.account.username}">View</a>
					    					</td>										
										</tr>
										
										</c:forEach>
									</tbody>
								</table>
							</div>
						</section>
</jsp:attribute>
</mt:template_superadmin>


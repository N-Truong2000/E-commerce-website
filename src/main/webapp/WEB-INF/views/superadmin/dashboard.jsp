<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_superadmin title="Dashboard">
	<jsp:attribute name="content">
    <h3>Dashboard</h3>
     <p style="color : red">${msg }</p>
    	<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
									<a href="#" class="fa fa-times"></a>
								</div>
						
								<h2 class="panel-title">Account</h2>
							</header>
							<div class="panel-body">
								<table class="table table-bordered table-striped mb-none" id="datatable-default">
									<thead>
										<tr>
											<th>Username</th>
											<th>FullName</th>
											<th>Phone</th>
											<th class="hidden-phone">Status</th>
											<th class="hidden-phone">Role</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach  var="account" items="${accounts }">
										<tr class="gradeX">
											<td>${account.username }</td>
    										<td>${account.fullname }</td>
    										<td>${account.phone }</td>
					    					<td>${account.status }</td>  
					    					<td>
					    					<c:forEach var="role" items="${account.roles }">    						
					    							${role.name }</br>
					    						
					    					</c:forEach>
					    					</td>					
					    					<td  class="center hidden-phone">
					    						<a href="${pageContext.request.contextPath }/superadmin/editAccount/${account.username}">Edit ||</a>
					    						<a href="${pageContext.request.contextPath }/superadmin/deleteAccount/${account.username}">Delete</a>
					    					</td>										
										</tr>
										
										</c:forEach>
									</tbody>
								</table>
							</div>
						</section>
</jsp:attribute>
</mt:template_superadmin>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_restaurant title="Menu for admin">
	<jsp:attribute name="content">
    <h3>Menu</h3>
     <p style="color: red">${msg }</p>
    	   <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                    <div class="row">
                            <div class="card">
                                <div class="card-body">
						<a href="${pageContext.request.contextPath }/restaurant/addmenu/${sessionScope.res_id}"><h4
										class="box-title">Create new food </h4></a>
                                </div>
                                <div class="card-body--">
                                    <div
								class="table-stats order-table ov-h">
                                        <table class="table ">
                                            <thead>
                                                <tr>
                                               		<th class="avatar">Photo</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Description</th>
                                                    <th>Category</th>
                                                  
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="menu"
											items="${menus }">
                                            
                                            	 <tr>                                                   
                                                    <td class="avatar">
                                                        <div
														class="round-img">
                                                            <a href="#"><img
															class="rounded-circle"
															src="${pageContext.request.contextPath }/assets/images/${menu.photos[0].name}"
															width="120px" height="100px" alt=""></a>
                                                        </div>
                                                    </td>
                                                    <td> ${menu.name} </td>
                                                    <td>  <span
													class="name">${menu.price }</span> </td>
                                                    <td> <span
													class="price">${menu.description }</span> </td>
                                                    <td><span
													class="count">${menu.category.name }</span></td>
                                                  <td
													class="center hidden-phone">
<a
													href="${pageContext.request.contextPath }/restaurant/editmenu/${menu.id}">Edit ||</a>
					    						<a
													href="${pageContext.request.contextPath }/restaurant/deletemenu/${menu.id}">Delete</a>
					    					</td>
                                                   
                                                </tr>
                                            </c:forEach>                                              
                                            </tbody>
                                        </table>
                                    </div> <!-- /.table-stats -->
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-8 -->
                        </div>

</jsp:attribute>
</mt:template_restaurant>
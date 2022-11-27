<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_restaurant title="Dashboard">
	<jsp:attribute name="content">
 	<div class="content">
 <div class="orders">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">Orders </h4>
                                </div>
                                <div class="card-body--">
                                    <div
									class="table-stats order-table ov-h">
                                        <table class="table ">
                                            <thead>
                                                <tr>
                                                  <!--   <th class="serial">#</th>
                                                    <th class="avatar">Account</th> -->
                                                    <th>ID</th>
                                                    <th>Account</th>
                                                    <th>Total</th>
                                                    <th>Date</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="order"
												items="${orders }">
                                                <tr class=" pb-0">
                                                    <td class="serial">${order.id }</td>
                                                    <td>  <span
														class="name">${order.account.fullname }</span> </td>
                                                    <td> <span>${order.total }</span> </td>
                                                    <td><span
														class="product">${order.date }</span></td>
                                                    <td>
                                                        <a
														href="${pageContext.request.contextPath }/restaurant/orderdetail/${order.id}"
														class="badge badge-complete">Detail</a>
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
                        </div>
	</div>
	</jsp:attribute>
</mt:template_restaurant>

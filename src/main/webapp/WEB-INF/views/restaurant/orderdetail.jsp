<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:template_restaurant title="Order detail">
	<jsp:attribute name="content">
 	<div class="content">
 	 <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Order detail table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Food name</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${orders2 }">
                                    	<tr>
                                            <td>${order.menu.name }</td>
                                            <td>${order.quantity }</td>
                                            <td>$ ${order.menu.price * order.quantity }</td>
                                        </tr>
                                      </c:forEach>
                                      <c:forEach var="order1" items="${orders }">
                                    	<tr>
                                            <td>${order1.tables.name }</td>
                                            <td>1</td>
                                            <td>$ ${order1.tables.pricePlus }</td>
                                        </tr>
                                      </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
 	</div>
	</div>
	</jsp:attribute>
</mt:template_restaurant>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Santhu Reddy
  Date: 5/18/2017
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Carousel Template for Bootstrap</title>
    <!-- Bootstrap core CSS -->
   &lt;%&ndash; <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">&ndash;%&gt;
</head>--%>
<!-- NAVBAR
================================================== -->

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="=container">
<div class="page-header">
    <h1>All Products</h1>

    <p class="lead">Checkout all the products available now!</p>
</div>
        <table class="table table-striped table-hover">
            <thead>
            <tr class ="bg-success">
                <th>Photo Thumb</th>
                <th>Product Name</th>
                <th>Catagory</th>
                <th>Condition</th>
                <th>Price</th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${products}" var="product">
            <tr>
                <td><img src="<c:url value="/resources/images/${product.productId}.png"/> " alt="image"
                         style="width:10%"/></td>
                <td>${product.productName}</td>
                <td>${product.productCatagory}</td>
                <td>${product.productCondition}</td>
                <td>${product.productPrice} USD</td>
                <td><a href="<spring:url value="/productList/viewProduct/${product.productId}"/>">
                    <span class="glyphicon glyphicon-info-sign"></span></a> </td>
            </tr>
            </c:forEach>
        </table>


    <%@include file="/WEB-INF/views/template/footer.jsp"%>


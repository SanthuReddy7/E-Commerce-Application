<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Santhu Reddy
  Date: 5/26/2017
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>


<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
    <div class="=container">
        <div class="page-header">
            <h1>Administrator Page</h1>
            <p class="lead">This is the Administrator page.!</p>
        </div>
        <%--line 21 to 26 is for logout --%>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome:${pageContext.request.userPrincipal.name}|<a href="<c:url
                value="/j_spring_security_logout"/> ">Logout</a>
        </h2>
        </c:if>
        <h3><a href="<c:url value="/admin/productInventory"/>">ProductInventory</a></h3>
        <p>Here you can view, check and modify the product Inventory>!</p>


        <%@include file="/WEB-INF/views/template/footer.jsp"%>


<%-- 
    Document   : admin-left
    Created on : 4 Nov 2021, 13:36:15
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar" style="background-color:#E6E6FA">

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
        <h4><a class="nav-link " href="<c:url value="/stats/car-stats" />"><spring:message code="stats.car.category" /></a></h4>
    </li>
    <li class="nav-item">
      <h4><a class="nav-link" href="<c:url value="/stats/car-sale-stats" />"><spring:message code="stats.car.sale" /></a></h4>
    </li>
    <li class="nav-item">
      <h4><a class="nav-link" href="<c:url value="/stats/car-month-stats" />"><spring:message code="stats.sale" /></a></h4>
    </li>
  </ul>

</nav>

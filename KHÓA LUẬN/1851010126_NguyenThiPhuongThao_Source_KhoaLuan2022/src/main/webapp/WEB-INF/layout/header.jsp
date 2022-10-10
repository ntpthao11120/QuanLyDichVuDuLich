<%-- 
    Document   : header
    Created on : 29 Aug 2021, 13:58:55
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="d-flex">
    <div class="p-2 mr-auto">
        <a href="<c:url value="/"/>"><img src="<c:url value="/images/VN-go.jpg"/>" width="120px" height="80px" /></a>
    </div>
    <div class="p-2">
        <nav class="navbar navbar-expand-sm">
        <ul class="nav nav-tabs" >       
            <li class="nav-item ">
                <a class="" href="<c:url value="/"/>"><spring:message code="label.home" /></a>
            </li>
            <c:forEach var="cat" items="${categories}">
                <li class="nav-item">
                <c:url value="/" var="catPath">
                    <c:param name="CateId" value="${cat.id}"></c:param>
                </c:url>
                    <a class="" href="${catPath}">${cat.name}</a>
                </li>
            </c:forEach>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <li class="nav-item">
                    <a class="" href="<c:url value="/login" />"><spring:message code="label.login" /></a>
                </li>
                <li class="nav-item">
                    <a class="" href="<c:url value="/register" />"><spring:message code="label.register" /></a>
                </li>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">

                <li class="nav-item" style="width: 5%">
                    <c:if test="${currentUser.userRole == 'ROLE_ADMIN'}">
                        <c:url value="/user-detail/${currentUser.id}" var="action" />
                    </c:if>
                    <c:if test="${currentUser.userRole == 'ROLE_STAFF'}">
                        <c:url value="/user-detail/${currentUser.id}" var="action" />
                    </c:if>
                    <c:if test="${currentUser.userRole == 'ROLE_CLIENT'}">
                        <c:url value="/client-detail/${currentUser.id}" var="action" />
                    </c:if>
                    <a class="" href="${action}">
                        <img style="width: 200%" class="img-fluid" src="<c:url value="${currentUser.image}" />"/>
                    </a>                        
                </li>
                <li class="nav-item">
                    <a class="" href="<c:url value="/logout" />"><spring:message code="label.logout" /></a>
                </li>
            </c:if>
            <li class="nav-item ">
                <a class="" href="<c:url value="/news-view" />"><spring:message code="label.news" /></a>
            </li>
            <li class="nav-item dropdown">
                <a  href="#" id="navbardrop"  data-toggle="dropdown">
                    <spring:message code="label.car" />
                </a>
                <div class="dropdown-menu">
                    <c:forEach var="car" items="${cateCar}">
                        <c:url value="/car" var="cateCarPath">
                            <c:param name="cateCarId" value="${car.id}"></c:param>
                        </c:url>
                        <a class="dropdown-item text-info" href="${cateCarPath}">${car.name}</a>
                    </c:forEach>
                </div>
            </li>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="nav-item dropdown">
                    <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        <spring:message code="label.manager" />
                    </a>
                    <div class="dropdown-menu">
                      <a class="dropdown-item text-info" href="<c:url value="/news-manage" />"><spring:message code="label.new.manage" /></a>
                      
                      <a class="dropdown-item text-info" href="<c:url value="/quanlytour" />"><spring:message code="label.tour.manage" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/user" />"><spring:message code="label.staff.manage" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/client" />"><spring:message code="label.client.manage" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/car-manage" />"><spring:message code="label.car.manage" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/stats/car-stats" />"><spring:message code="label.stats" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/chat" />">TƯ VẤN</a>
                    </div>
                </li>
            </sec:authorize>
                <sec:authorize access="hasRole('ROLE_STAFF')">
                <li class="nav-item dropdown">
                    <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        <spring:message code="label.manager" />
                    </a>
                    <div class="dropdown-menu ">
                      <a class="dropdown-item text-info" href="<c:url value="/news-manage" />"><spring:message code="label.new.manage" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/news-category" />"><spring:message code="label.news.category" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/quanlytour" />"><spring:message code="label.tour.manage" /></a>
                      <a class="dropdown-item  text-info" href="<c:url value="/client" />"><spring:message code="label.client.manage" /></a>
                      <a class="dropdown-item text-info" href="<c:url value="/car-manage" />"><spring:message code="label.car.manage" /></a>
                    </div>
                </li>
            </sec:authorize>
            
        </ul>
                
        </nav>
    </div>
</div>
            





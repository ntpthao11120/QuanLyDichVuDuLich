<%-- 
    Document   : client-detail
    Created on : 8 Oct 2021, 14:16:08
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="row" style="background-color: #F8F8FF;">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h1 class="text-center" style="color:#00BFFF;"><spring:message code="label.client.update" /></h1>
        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">
                ${errMsg}
            </div>
        </c:if>

        <c:if test="${clientId != 0}">
            <c:url value="/client-detail/${clientId}" var="action" />
        </c:if>
        <c:if test="${clientId == null}">
            <c:url value="/client-detail/${client-detail.id}" var="action" />
        </c:if>

        <form:form method="post" action="${action}" modelAttribute="clientdetail" enctype="multipart/form-data">
            <div class="form-group">
                <label for="firstname"><spring:message code="user.firstName" /></label>
                <form:input type="text" id="firstname" path="firstName" class="form-control" />
                <form:errors path="firstName" cssClass="text-danger" element="div" />
            </div>  
            <div class="form-group">
                <label for="lastname"><spring:message code="user.lastName" /></label>
                <form:input type="text" id="lastname" path="lastName" class="form-control" />
                <form:errors path="lastName" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="phone"><spring:message code="user.phone" /></label>
                <form:input id="phone" path="phone" class="form-control" />
                <form:errors path="phone" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="email"><spring:message code="user.email" /> </label>
                <form:input type="email" id="email" path="email" class="form-control" />
                <form:errors path="email" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="address"><spring:message code="user.address" /></label>
                <form:input type="text" id="address" path="address" class="form-control" />
                <form:errors path="address" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="username"><spring:message code="user.username" /></label>
                <form:input type="text" id="username" path="username" class="form-control" />
                <form:errors path="username" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="password"><spring:message code="user.password" /></label>
                <form:input type="password" id="password" path="password" class="form-control" />
                <form:errors path="password" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="confirm-password"><spring:message code="user.confirmPassword" /></label>
                <form:input type="password" id="confirm-password" path="confirmPassword" class="form-control" />
                <form:errors path="confirmPassword" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label  for="fileUser"><spring:message code="user.image" /></label>
                <form:input type="file" id="fileUser" path="fileUser" cssClass="form-control" />
                <img style="cursor: pointer; width: 30%; height: 10%" class="img-fluid" src="<c:url value="${clientdetail.image}"/>" alt="${clientdetail.id}" />
            </div>
            <div class="form-group">
                <input style="background-color: #87CEFA; width: 100%" type="submit" value="<spring:message code="label.update" />" class="btn" />
            </div>
        </form:form>
    </div>
</div>
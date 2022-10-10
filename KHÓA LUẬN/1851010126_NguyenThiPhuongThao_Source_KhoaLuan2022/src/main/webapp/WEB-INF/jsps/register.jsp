<%-- 
    Document   : register
    Created on : 31 Aug 2021, 08:35:08
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div style="background-image: url('images/background.jpg');">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h2 class="text-center text-light"><spring:message code="label.register" /></h2>
            <c:if test="${errMsg != null}">
                <div class="alert alert-info">
                    ${errMsg}
                </div>
            </c:if>

            <c:url value="/register" var="action" />
            <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="text-light" for="firstname"><spring:message code="user.firstName" /></label>
                    <form:input type="text" id="firstname" path="firstName" class="form-control" />
                    <form:errors path="firstName" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="lastname"><spring:message code="user.lastName" /></label>
                    <form:input type="text" id="lastname" path="lastName" class="form-control" />
                    <form:errors path="lastName" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="phone"><spring:message code="user.phone" /></label>
                    <form:input id="phone" path="phone" class="form-control" />
                    <form:errors path="phone" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="email"><spring:message code="user.email" /> </label>
                    <form:input type="email" id="email" path="email" class="form-control" />
                    <form:errors path="email" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="address"><spring:message code="user.address" /></label>
                    <form:input type="text" id="address" path="address" class="form-control" />
                    <form:errors path="address" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="username"><spring:message code="user.username" /></label>
                    <form:input type="text" id="username" path="username" class="form-control" />
                    <form:errors path="username" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="password"><spring:message code="user.password" /></label>
                    <form:input type="password" id="password" path="password" class="form-control" />
                    <form:errors path="password" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="confirm-password"><spring:message code="user.confirmPassword" /></label>
                    <form:input type="password" id="confirm-password" path="confirmPassword" class="form-control" />
                    <form:errors path="confirmPassword" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label class="text-light" for="fileUser"><spring:message code="user.image" /></label>
                    <form:input type="file" id="fileUser" path="fileUser" cssClass="form-control" />
                </div>
                <div class="form-group">
                    <input style="width: 100%; border-radius: 4px; background-color:#00BFFF;" type="submit" value="<spring:message code="label.register" />" class="btn text-light" />
                </div>
            </form:form>
        </div>
</div>



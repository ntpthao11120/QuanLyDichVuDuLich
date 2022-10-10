<%-- 
    Document   : news-category-details
    Created on : 11 May 2022, 08:02:32
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row" style="background-color: #F8F8FF;">
    <div class="col-md-3"></div><!-- comment -->
    <div class="col-md-6">
        <h2 class="text-center"><spring:message code="label.news.category.update" /></h2>
        <c:if test="${errMsg != null}">
            <div class="alert alert-info">
                ${errMsg}
            </div>
        </c:if>

        <c:url value="/newsCatedetail" var="action" />

        <form:form method="post" action="${action}" modelAttribute="newsCatedetail" enctype="multipart/form-data">
            <div class="form-group">
                <label  for="name"><spring:message code="newsCate.name" /></label>
                <form:input type="text" id="name" path="name" class="form-control" />
                <form:errors path="name" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label  for="url"><spring:message code="newsCate.url" /></label>
                <form:input type="text" id="url" path="url" class="form-control" />
                <form:errors path="url" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <input style="background-color: #87CEFA; width: 100%" type="submit" value="<spring:message code="label.update" />" class="btn" />
            </div>
        </form:form>
    </div>
</div>

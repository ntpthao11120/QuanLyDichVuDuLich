<%-- 
    Document   : car-add
    Created on : 3 Nov 2021, 16:33:28
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row" style="background-color: #F8F8FF;">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h1 class="text-center" style="color:#00BFFF;"><spring:message code="label.car.update" /></h1>
        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">
                ${errMsg}
            </div>
        </c:if>
        <c:if test="${carId != 0}">
            <c:url value="/car-add/${carId}" var="action" />
        </c:if>
        <c:if test="${carId == null}">
            <c:url value="/car-add/${carDetail.id}" var="action" />
        </c:if>
        <form:form method="post" action="${action}" modelAttribute="carDetail" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name"><spring:message code="car.name" /></label>
                <form:input type="text" id="name" path="name" class="form-control" />
                <form:errors path="name" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="description"><spring:message code="car.description" /></label>
                <form:textarea type="text" id="description" path="description" class="form-control" />
                <form:errors path="description" cssClass="text-danger" element="div" />
            </div> 
            <div class="form-group">
                <label for="price"><spring:message code="car.price" /></label>
                <form:input type="number" id="price" path="price" class="form-control" />
                <form:errors path="price" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="cateCar"><spring:message code="car.cate" /></label>
                <form:select id="cateCar" path="maLoai" cssClass="form-control" >
                    <c:forEach var="cateCar" items="${cateCar}">
                        <option value="${cateCar.id}">${cateCar.name}</option>
                    </c:forEach>
                </form:select>
            </div>
            <div class="form-group">
                <label  for="file"><spring:message code="car.image" /></label>
                <form:input type="file" id="file" path="file" cssClass="form-control" />
                <img style="cursor: pointer; width: 30%; height: 10%" class="img-fluid" src="<c:url value="${carDetail.image}"/>" alt="${carDetail.id}" />
                
            </div>
            <div class="form-group">
                <input style="background-color: #87CEFA; width: 100%" type="submit" value="<spring:message code="label.update" />" class="btn" />
            </div>
        </form:form>
    </div>
</div>

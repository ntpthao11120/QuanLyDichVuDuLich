<%-- 
    Document   : tour
    Created on : 7 Sept 2021, 21:24:52
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-danger"> QUAN LY TOUR </h1>

<c:url value="/tour" var="action" />

<c:if test="${errMsg != null}" >
    <div class="text-danger">${errMsg}</div>
</c:if>

<form:form method="post" action="${action}" modelAttribute="tour" enctype="multipart/form-data">
    
    <div class="form-group">
        <label for="name">Tên tour</label>
        <form:input type="text" id="name" path="name" cssClass="form-control" />
        <form:errors path="name" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="trip">Chuyến đi</label>
        <form:input type="text" id="trip" path="trip" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="description">Mô tả</label>
        <form:textarea id="description" path="description" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="adult_price">Giá người lớn</label>
        <form:input type="text" id="adult_price" path="adultPrice" cssClass="form-control" />
        <form:errors path="adultPrice" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="child_price">Giá trẻ em</label>
        <form:input type="text" id="child_price" path="childPrice" cssClass="form-control" />
        <form:errors path="childPrice" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="cat">Danh mục</label>
        <form:select id="cat" path="category" cssClass="form-control" >
            <c:forEach var="cat" items="${categories}">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </form:select>
        <form:errors path="category" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="file">Anh tour</label>
        <form:input type="file" id="file" path="file" cssClass="form-control" />
    </div>
    <div class="form-group">
        <input type="submit" value="Them tour" class="btn btn-danger" />
    </div>
</form:form>
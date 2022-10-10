<%-- 
    Document   : car-detail
    Created on : 27 Oct 2021, 14:39:03
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="row">
    <div class="col-md-4">
        <c:choose>
            <c:when test="${car.image != null && car.image.startsWith('http') == true}">
                <img class="card-img-top img-fluid" src="<c:url value="${car.image}"/>" alt="${car.name}">
            </c:when>
            <c:when test="${car.image == null || car.image.startsWith('http') == false}">
                <img class="card-img-top img-fluid" src="<c:url value="/images/toyota.jpg"/>" alt="${car.name}">
            </c:when>
        </c:choose>
    </div>
    <div class="col-md-8">
        <h2 class="text-center">${car.name}</h2>
        <h3 class="text-primary">Giá: ${car.price}VNĐ/ngày</h3>
        <p>${car.description}</p>
        <br>
        <p><b>* Ghi chú:</b></p>
        <p>- Giá đưa ra là giá tham khảo</p>
        <p>- Giá bao gồm: Nhiên liệu, phí cầu đường, bảo hiểm, thuế 10% VAT</p>
        <p>- Giá không áp dụng cho ngày Lễ Tết</p>
        <a href="<c:url value="/car-order/${car.id}"/>" class="btn btn-primary">Đặt xe</a>
    </div>
</div>
    <br>

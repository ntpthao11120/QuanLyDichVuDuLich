<%-- 
    Document   : car
    Created on : 26 Oct 2021, 20:48:30
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<form action="<c:url value="/car" />">
<div class="row">
    <div class="col-md-11">
        <input class="form-control" type="text" name="kw" placeholder="Nhap tu khoa..."/>
    </div>
    <div class="col-md-1">
        <input type="submit" value="Tìm kiếm" class="btn btn-danger"/>
    </div>
</div>
</form>
<div class="row">
    <c:forEach var="c" items="${cars}">
        
        <div class="col-md-4 col-xs-12 " style="padding: 10px;">       
            <a href="<c:url value="/car-detail/${c.id}"/>">
            <div class="card">
                <c:choose>
                    <c:when test="${c.image != null && c.image.startsWith('http') == true}">
                        <img class="card-img-top img-fluid" src="<c:url value="${c.image}"/>" alt="${c.name}" style="width: 400px; height: 200px;">
                    </c:when>
                    <c:when test="${c.image == null || c.image.startsWith('http') == false}">
                        <img class="card-img-top img-fluid" src="<c:url value="/images/toyota.jpg"/>" alt="${c.name}" style="width: 400px; height: 200px;">
                    </c:when>
                </c:choose>
            </a>
            <div class="card-body">
              <h4 class="card-title">${c.name}</h4>
              <h3 class="card-text">Giá: ${c.price}VNĐ/ngày</h3>
              <p class="card-text">${c.description}</p>
              <a href="<c:url value="/car-order/${c.id}"/>" class="btn btn-primary">Đặt xe</a>
            </div>
          </div>
        
        
    </div>
        
              </c:forEach>
</div>


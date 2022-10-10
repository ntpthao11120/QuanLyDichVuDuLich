<%-- 
    Document   : quanlytour
    Created on : Sep 18, 2021, 5:56:08 PM
    Author     : XuXu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value="/javascript/jsTour.js"/>"></script>
<!DOCTYPE html>
<h1 class="text-center text-danger"> QUẢN LÝ TOUR </h1>
<form action="">
    <div class="row">
        <div class="col-md-11">
            <input class="form-control" type="text" name="kw" placeholder="Nhap tu khoa..."/>
        </div>
        <div class="col-md-1">
            <input type="submit" value="Search" class="btn btn-danger"/>
        </div>
    </div>
</form>
<!--page-->
<div>
    <ul class="pagination">
        <c:forEach var="i" begin="1" end="${Math.ceil(counter / 20)}" >
            <li class="page-item"><a class="page-link" href="<c:url value="/quanlytour" />?page=${i}">${i}</a></li>
        </c:forEach>
    </ul>
</div>
<a href="<c:url value="/admin/addtour"/>"><button class="btn btn-danger">Thêm</button></a>
<c:forEach var="tour" items="${tours}">
        <div class="row p-2 mb-2 bg-light bg-gradient" >
                <div class="col-md-5" >
                    <a href="<c:url value="/tour/${tour.id}"/>">
                        <c:if test="${tour.image != null && tour.image.startsWith('https') == true}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="${tour.image}"/>" alt="${tour.name}" />
                        </c:if>
                        <c:if test="${tour.image == null || tour.image.startsWith('https') == false}">
                        <img  style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${tour.name}" />
                        </c:if>
                    </a>        
                    
                </div>
                <div class="col-md-5">
                    <h1><a href="<c:url value="/tour/${tour.id}"></c:url>">${tour.name}</a> </h1>
                    <p>${tour.trip}</p>           
                </div>
                <div class="col-md-2">
                    <a href="<c:url value="/tour/${tour.id}"/>"><button class="btn btn-warning btn-lg text-white">Giá từ ${tour.childPrice}</button></a>
                    <br/><br/>
                    <span>${tour.startDay}</span>
                    <br/><br/>
                    <span>${tour.endDay}</span>
                    <br/><br/>
                    <span><a href="<c:url value="/admin/updatetour/${tour.id}"/>"><button class="btn btn-primary">Sửa</button></a></span>
                    <span><button class="btn btn-secondary" onclick="xoatour(${tour.id})">Xóa</button></span>
                </div>
        </div>
</c:forEach>
<div>
    <ul class="pagination">
        <c:forEach var="i" begin="1" end="${Math.ceil(counter / 20)}" >
            <li class="page-item"><a class="page-link" href="<c:url value="/quanlytour" />?page=${i}">${i}</a></li>
        </c:forEach>
    </ul>
</div>

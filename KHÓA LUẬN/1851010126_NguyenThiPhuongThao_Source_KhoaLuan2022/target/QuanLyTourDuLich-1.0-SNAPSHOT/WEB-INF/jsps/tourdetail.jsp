<%-- 
    Document   : tourdetail
    Created on : Sep 17, 2021, 10:31:26 PM
    Author     : XuXu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<link href="<c:url value="/css/tourdetail.css"></c:url>" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<c:url value="/js/tourdetail.js"></c:url>"></script>
<div class="alert alert-info" style="display: flex;flex-direction:row; padding-bottom: 100px">
<div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
  </ul>
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="<c:url value="${tour.image1}"/>" alt="Hinh1" width="100%" height="330px">
    </div>
    <div class="carousel-item ">
        <img src="<c:url value="${tour.image2}"/>" alt="Hinh2" width="100%" height="330px">
    </div>
    <div class="carousel-item ">
        <img src="<c:url value="${tour.image3}"/>" alt="Hinh3" width="100%" height="330px">
    </div>
    <div class="carousel-item ">
        <img src="<c:url value="${tour.image4}"/>" alt="Hinh4" width="100%" height="330px">
    </div>
    <div class="carousel-item ">
        <img src="<c:url value="${tour.image5}"/>" alt="Hinh5" width="100%" height="330px">
    </div>
<!--   Left and right controls -->  
   <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <img name="Hinh" src="/QuanLyTourDuLich/images/previous.png"
           onmouseover="document.Hinh.src='/QuanLyTourDuLich/images/previous2.png'"
           onmouseout="document.Hinh.src='/QuanLyTourDuLich/images/previous.png'">
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <img name="Hinh2" src="/QuanLyTourDuLich/images/next.png"
         onmouseover="document.Hinh2.src='/QuanLyTourDuLich/images/next2.png'"
         onmouseout="document.Hinh2.src='/QuanLyTourDuLich/images/next.png'"/>
  </a>
</div>
    <c:if test="${tour.quantity == 0}" >
        <h1 class="text-center text-danger">Tình trạng: HẾT CHỖ</h1>
    </c:if>
     
    <c:if test="${tour.quantity > 0}" >
        <h1 class="text-center text-success">Tình trạng: Còn ${tour.quantity}</h1>
    </c:if>
    
    <c:if test="${errMsg != null}" >
        <div class="text-danger">${errMsg}</div>
    </c:if>
</div>
    <div class="text-center" style="margin-left: 20px;margin-top: 0px;width: 500px">
        <h2 class="alert alert-success">${tour.name}</h2>
        <h3 class="alert alert-primary">Ngày khởi hành: ${tour.startDay}</h3>
        <h3 class="alert alert-danger">Ngày kết thúc: ${tour.endDay}</h3>
      
        <c:if test="${tour.quantity > 0}" >
        <c:url value="/dattour/${tour.id}" var="action" />
        <form:form method="post" action="${action}" modelAttribute="order">
            <div class="form-group">
                <label for="adultquantity">Số lượng người lớn - ${tour.adultPrice}/ 1 người:</label>
                <form:input type="number" value="0" min="0" id="adultquantity" path="adultQuantity" cssClass="form-control"/>
                <form:errors path="*" cssClass="text-danger" element="div" />
            </div>
            <div class="form-group">
                <label for="childquantity">Số lượng trẻ em - ${tour.childPrice}/ 1 người:</label>
                <form:input type="number" value="0" min="0" id="childquantity" path="childQuantity" cssClass="form-control"/>
                <form:errors path="childQuantity" cssClass="text-danger" element="div" />
            </div>
            <input type="submit" value="Đặt tour" class="btn btn-danger" />
        </form:form>
        </c:if>
        
    </div>
</div>

<div class="row" style="padding-top: 30px">
    <div class="col-md-9">
        <span class="alert" style="background-color: red;color: white">
          <img style="width:30px"class="img-fluid"src="<c:url value="/images/fire.png"/>"/><strong>Tour Nổi bật</strong>
        </span>
       <div id="demo1" class="carousel slide alert alert-info" data-ride="carousel" >
  <!-- The slideshow -->
 
  <div class="carousel-inner" style="">
    <div class="carousel-item active">
     <div class="row">
        <c:forEach var="p" items="${hotTours1}">
            <div class="col-md-4 col-xs-12" style="padding: 10px">
                <div class="card">
                <a href="<c:url value="/tour/${p[0]}"/>" style="height: 155px">
                    <c:choose>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="${p[3]}"/>" alt="${p[1]}"/>
                        </c:when>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${p[1]}"/>
                        </c:when>
                    </c:choose>
                </a>
                <div class="card-body">
                    <h4 class="card-title">${p[1]}</h4>
                    <hr>
                    <p class="card-text">Ngày khởi hành: ${p[6]}</p>
                    <p class="card-text">Ngày kết thúc: ${p[7]}</p>
                    <a href="<c:url value="/tour/${p[0]}"/>"><h3 class="btn btn-warning btn-lg text-white">Giá từ ${p[5]}</h3></a>
                </div>
                </div>
            </div>
        </c:forEach>
      </div>
    </div>
    <div class="carousel-item">
      <div class="row">
        <c:forEach var="p" items="${hotTours2}">
            <div class="col-md-4 col-xs-12" style="padding: 10px">
                <div class="card">
                <a href="<c:url value="/tour/${p[0]}"/>" style="height: 155px">
                    <c:choose>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="${p[3]}"/>" alt="${p[1]}"/>
                        </c:when>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${p[1]}"/>
                        </c:when>
                    </c:choose>
                </a>
                <div class="card-body">
                    <h4 class="card-title">${p[1]}</h4>
                    <hr>
                    <p class="card-text">Ngày khởi hành: ${p[6]}</p>
                    <p class="card-text">Ngày kết thúc: ${p[7]}</p>
                    <a href="<c:url value="/tour/${p[0]}"/>"><h3 class="btn btn-warning btn-lg text-white">Giá từ ${p[5]}</h3></a>
                </div>
                </div>
                
            </div> 
        </c:forEach>
          <div class="col-md-4 col-xs-12" style="padding: 10px; margin-top: 70px">
               <a href="<c:url value="/hottour/"/>" style="height: 155px">
                     <img class="img-fluid" style="width: 200px" src="<c:url value="/images/all.png  "/>"alt="Hình all"/>
               </a>
          </div>
      </div>
    </div>
  </div>
  
  <!-- Left and right controls -->
<a class="carousel-control-prev" href="#demo1" data-slide="prev">
      <img name="Hinh" src="/QuanLyTourDuLich/images/previous.png"
           onmouseover="document.Hinh.src='/QuanLyTourDuLich/images/previous2.png'"
           onmouseout="document.Hinh.src='/QuanLyTourDuLich/images/previous.png'">
  </a>
  <a class="carousel-control-next" href="#demo1" data-slide="next">
    <img name="Hinh2" src="/QuanLyTourDuLich/images/next.png"
         onmouseover="document.Hinh2.src='/QuanLyTourDuLich/images/next2.png'"
         onmouseout="document.Hinh2.src='/QuanLyTourDuLich/images/next.png'"/>
  </a>
</div>

    </div>
    <div class="col-md-3">
        <span class="badge text-dark"  style="background-color:#DA70D6; width: 100%; ">
            <h3 style="text-align: center;"><spring:message code="label.news" /></h3>
        </span>
        <c:forEach var="n" items="${latestNews}">
            <h4><a href="<c:url value="/news/${n[0]}" />">${n[1]}</a></h4>
            <h7 style="color: #87CEFA;"><i>(Ngày: ${n[2]})</i></h7>
        </c:forEach>
    </div>
</div>
    
    
    

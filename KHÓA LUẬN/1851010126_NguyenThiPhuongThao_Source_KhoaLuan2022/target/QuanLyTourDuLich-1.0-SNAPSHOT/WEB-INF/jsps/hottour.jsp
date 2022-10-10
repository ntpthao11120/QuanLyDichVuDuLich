    <%-- 
    Document   : index
    Created on : 30 Aug 2021, 14:18:38
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<c:url value="/javascript/jsTour.js"/>"></script>

<div class="alert" style="background-color: red;color: white">
          <img style="width:30px"class="img-fluid"src="<c:url value="/images/fire.png"/>"/><strong>Tour Nổi bật</strong>
</div>
<!--Nội dung Tour-->
<c:forEach var="p" items="${hottours}">
        <div class="row p-2 mb-2 bg-light bg-gradient" >
                <div class="col-md-5" >
                    <a href="<c:url value="/tour/${p[0]}"></c:url>">
                        <c:if test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="${p[3]}"/>" alt="${p[1]}" />
                        </c:if>
                        <c:if test="${p[3] == null || p[3].startsWith('https') == false}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${p[1]}" />
                        </c:if>
                    </a>        
                    
                </div>
                <div class="col-md-5">
                    <h1><a href="<c:url value="/tour/${p[0]}"></c:url>">${p[1]}</a> </h1>
                    <p>${p[2]}</p>           
                </div>
                <div class="col-md-2">
                    <a href="<c:url value="/tour/${p[0]}"/>"<button class="btn btn-warning btn-lg text-white">Giá từ ${p[5]}</button></a>
                    <br/><br/>
                    <span>${p[6]}</span>
                    <br/><br/>
                    <span>${p[7]}</span>
                </div>
        </div>
</c:forEach>



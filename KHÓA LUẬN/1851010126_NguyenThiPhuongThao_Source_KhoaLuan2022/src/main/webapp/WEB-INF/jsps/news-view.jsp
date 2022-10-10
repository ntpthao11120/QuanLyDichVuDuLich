<%-- 
    Document   : news-view
    Created on : 13 Oct 2021, 19:36:43
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-9">
        <c:forEach var="n" items="${news}">
            <div class="media" style="background-color: #F8F8FF;" >
            <img src="<c:url value="${n.featureImg}" />" class="align-self-start mr-3 img-fluid rounded img1" style="cursor: pointer; width:120px; height: 80px;">
            <div class="media-body">
                <h4><a href="<c:url value="/news/${n.id}" />">${n.title}</a></h4>
            </div>
          </div>
        </c:forEach>
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
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(countNews/6)}" var="page">
                <li class="page-item"><a class="page-link" href="<c:url value="/news-view" />?page=${page}">${page}</a></li>
            </c:forEach>
        </ul>

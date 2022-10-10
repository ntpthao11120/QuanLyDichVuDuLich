<%-- 
    Document   : car-manage
    Created on : 30 Oct 2021, 11:10:20
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="cartable">
    <h1 class="text-center" style="color:#00BFFF;"><spring:message code="label.car.manage" /></h1>
    <div class="row">
        
        <div class="col-md-6">
            <div>
                <a href="<c:url value="/car-add" />" class="btn" style="background-color:#87CEFA;"><spring:message code="label.car.add" /></a>
            </div>
        </div>
        <div class="col-md-5">
            <form action="">
                <div class="row">
                    <div class="col-md-11">
                        <input class="form-control" type="text" name="kw" placeholder="Nhập từ khóa..."/>
                    </div>
                    <div class="col-md-1">
                        <input style="background-color:#87CEFA;" type="submit" value="Tìm kiếm" class="btn"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
            <br>
            <div class="row">
                <div class="col-md-10"></div>
                <div class="col-md-2">
                    <div class="dropdown">
        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" style="background-color:#ADD8E6">
          <spring:message code="car.cate" />
        </button>
        <div class="dropdown-menu">
            <c:forEach var="car" items="${cateCar}">
                <c:url value="/car-manage" var="cateCarPath">
                    <c:param name="cateCarId" value="${car.id}"></c:param>
                </c:url>
                <a class="dropdown-item text-info" href="${cateCarPath}">${car.name}</a>
            </c:forEach>
        </div>
    </div>
                </div>
            </div>

            <br></br>
    <div class="table-responsive">
        <table  class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="car.id" /></th>
                    <th><spring:message code="car.name" /></th>
                    <th><spring:message code="car.price" /></th>
                    <th><spring:message code="car.cate" /></th>
                    <th><spring:message code="user.edit" /></th>
                    <th><spring:message code="user.del" /></th>
                </tr>
            </thead>
            <tbody id="view">

                <c:forEach var="c" items="${carManage}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.name}</td>
                        <td>${c.price}</td>
                        <td>${c.category.name}</td>
                        <td>
                            <a class="btn " style="background-color: #F8F8FF;" href="<c:url value="/car-add/${c.id}" />">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td>
                            <a class="btn" style="background-color: #F8F8FF;" onclick="Car(${c.id})" >
                                <span class="glyphicon glyphicon-trash" >
                                </span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="d-flex justify-content-end">
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(countCar/6)}" var="page">
            <li class="page-item"><a class="page-link" href="<c:url value="/car-manage" />?page=${page}">${page}</a></li>
        </c:forEach>
    </ul>
    </div>
</div>
                

<%-- 
    Document   : news-manage
    Created on : 12 Oct 2021, 16:38:27
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <h1 class="text-center" style="color:#00BFFF;"><spring:message code="label.news.manage" /></h1>
    <div class="row">
        
        <div class="col-md-6">
            <div>
                <a href="<c:url value="/news-detail" />" class="btn" style="background-color:#87CEFA;"><spring:message code="news.add" /></a>
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
    
    
    <br></br>
    <div class="table-responsive">
        <table id="table" class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="news.title" /></th>
                    <th><spring:message code="news.createDate" /></th>
                    <th><spring:message code="news.createdBy" /></th>
                    <th><spring:message code="user.edit" /></th>
                    <th><spring:message code="user.del" /></th>
                </tr>
            </thead>
            <tbody id="view">

                <c:forEach var="n" items="${news}">
                    <tr>
                        <td>${n.title}</td>
                        <td>${n.createdDate}</td>
                        <td>${n.createdBy}</td>
                        <td>
                            <a class="btn " style="background-color: #F8F8FF;" href="<c:url value="/news-update/${n.id}" />">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td>
                            <a class="btn" style="background-color: #F8F8FF;" onclick="News(${n.id})" >
                                <span class="glyphicon glyphicon-trash" >
                                </span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>
    
</div>
                <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(countNews/6)}" var="page">
                <li class="page-item"><a class="page-link" href="<c:url value="/news-manage" />?page=${page}">${page}</a></li>
            </c:forEach>
        </ul>

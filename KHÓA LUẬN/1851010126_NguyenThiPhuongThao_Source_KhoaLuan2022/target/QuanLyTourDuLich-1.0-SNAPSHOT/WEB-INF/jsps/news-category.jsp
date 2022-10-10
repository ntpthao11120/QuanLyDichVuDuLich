<%-- 
    Document   : news-category
    Created on : 11 May 2022, 07:46:04
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <h1 class="text-center" style="color:#00BFFF;"><spring:message code="label.news.category" /></h1>
    <div>
        <a href="<c:url value="/news-category-details" />" class="btn" style="background-color:#87CEFA;"><spring:message code="newsCate.add" /></a>
    </div>
    <br></br>
    <div class="table-responsive">
        <table id="" class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="newsCate.name" /></th>
                    <th><spring:message code="newsCate.url" /></th>
                    <th><spring:message code="user.edit" /></th>
                    <th><spring:message code="user.del" /></th>
                </tr>
            </thead>
            <tbody id="">

                <c:forEach var="n" items="${newsCate}">
                    <tr>
                        <td>${n.name}</td>
                        <td>${n.url}</td>
                        <td>
                            <a class="btn " style="background-color: #F8F8FF;" href="<c:url value="" />">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td>
                            <a class="btn" style="background-color: #F8F8FF;" onclick="" >
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

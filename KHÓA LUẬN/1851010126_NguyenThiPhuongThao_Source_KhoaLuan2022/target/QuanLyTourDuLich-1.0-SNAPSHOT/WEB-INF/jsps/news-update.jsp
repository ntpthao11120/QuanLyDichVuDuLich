<%-- 
    Document   : news-update
    Created on : 13 Oct 2021, 16:12:58
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <div class="row" style="background-color: #F8F8FF;">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h2 class="text-center"><spring:message code="label.news.fix" /></h2>
            <c:if test="${errMsg != null}">
                <div class="alert alert-info">
                    ${errMsg}
                </div>
            </c:if>
            <c:url value="/news-update/${newsId}" var="action" />

            <form:form method="post" action="${action}" modelAttribute="newsupdate" enctype="multipart/form-data">
                <div class="form-group">
                    <label  for="title"><spring:message code="news.title" /></label>
                    <form:input type="text" id="title" path="title" class="form-control" />
                    <form:errors path="title" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label  for="description"><spring:message code="news.description" /></label>                   
                    <form:textarea type="hidden" id="description" path="description" class="form-control" />
                    <form:errors path="description" cssClass="text-danger" element="div" />
                </div>
                <div class="form-group">
                    <label  for="file"><spring:message code="news.featureImg" /></label>
                    <form:input type="file" id="file" path="file" cssClass="form-control" />
                    <img style="cursor: pointer; width: 30%; height: 10%" class="img-fluid" src="<c:url value="${newsupdate.featureImg}"/>" alt="${newsupdate.id}" />
                </div>
                <div class="form-group">
                    <input style="background-color: #87CEFA; width: 100%" type="submit" value="<spring:message code="label.update" />" class="btn" />
                </div>
            </form:form>
        </div>
    </div>  
<script>
                var editor = '';
                $(document).ready(function(){
                    editor = CKEDITOR.replace('description');
                });
        </script>
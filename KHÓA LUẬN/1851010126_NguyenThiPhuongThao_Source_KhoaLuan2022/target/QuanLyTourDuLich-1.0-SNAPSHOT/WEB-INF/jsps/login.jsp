<%-- 
    Document   : login
    Created on : 30 Aug 2021, 13:52:33
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div style="background-image: url('<c:url value="/images/background.jpg"/>');">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h2 class="text-center text-light"> <spring:message code="label.login" /> </h2>
            <c:if test="${param.error != null}">
                <div class="alert alert-info">
                    Tên đăng nhập hoặc mật khẩu không đúng. Vui lòng kiểm tra lại!!!
                </div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-info">
                    Bạn không có quyền truy cập!
                </div>
            </c:if>
            <c:url value="/login" var="action" />
            <form:form method="post" action="${action}">
                <div class="form-group">
                    <label class="text-light" for="username"><spring:message code="user.username" /></label>
                    <input type="text" id="username" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    <label class="text-light" for="password"><spring:message code="user.password" /></label>
                    <input type="password" id="password" name="password" class="form-control"/>
                </div>
                <div class="form-group">
                    <input style="width: 100%; border-radius: 4px; background-color:#00BFFF;" type="submit" value="<spring:message code="label.login" />" class="btn text-light"/>
                </div>
                <div class="form-group text-center">
                    <label class="text-light" for="password">
                        Bạn chưa có tài khoản?  <a class="text-light" href="<c:url value="/register" />">Đăng ký</a>
                    </label>
                </div>
            </form:form>
        </div>
    </div>
    
</div>



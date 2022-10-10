<%-- 
    Document   : user
    Created on : 19 Sept 2021, 16:13:26
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div>
    <h1 class="text-center" style="color:#00BFFF;"><spring:message code="label.staff.manage" /></h1>
    <div class="row">
        
        <div class="col-md-6">
            <div>
                <a href="<c:url value="/user-detail" />" class="btn" style="background-color:#87CEFA;"><spring:message code="user.addStaff" /></a>
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
        <table id="mytable" class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="user.firstName" /></th>
                    <th><spring:message code="user.lastName" /></th>
                    <th><spring:message code="user.phone" /></th>
                    <th><spring:message code="user.email" /></th>
                    <th><spring:message code="user.username" /></th>
                    <th><spring:message code="user.userRole" /></th>
                    <th><spring:message code="user.edit" /></th>
                    <th><spring:message code="user.del" /></th>
                </tr>
            </thead>
            <tbody id="view">

                <c:forEach var="u" items="${staff}">
                    <tr>
                        <td>${u.firstName}</td>
                        <td>${u.lastName}</td>
                        <td>${u.phone}</td>
                        <td>${u.email}</td>
                        <td>${u.username}</td>
                        <td>${u.userRole}</td>
                        <td>
                            <a class="btn " style="background-color: #F8F8FF;" href="<c:url value="/user-detail/${u.id}" />">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td>
                            <a class="btn" style="background-color: #F8F8FF;" onclick="delUser(${u.id})" >
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
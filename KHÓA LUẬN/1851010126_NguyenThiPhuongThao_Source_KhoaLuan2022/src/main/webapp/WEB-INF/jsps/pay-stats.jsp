<%-- 
    Document   : pay-stats
    Created on : 13 Nov 2021, 14:40:42
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="text-center text-primary"  ><spring:message code="stats.pay" /></h1>
<form action="">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group"><!-- comment -->
                <label> Từ ngày: </label>
                <input type="date" name="fromDate" class="form-control" />
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group"><!-- comment -->
                <label> Đến ngày: </label>
                <input type="date" name="toDate" class="form-control" />
            </div>
        </div>
    </div>
    <input type="submit" value="Thống kê" class="btn btn-primary" />
</form>
<br>
<div>
  <canvas id="myPayChart"></canvas>
</div> 
<br>
<div class="table-responsive">
        <table  class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="pay.money" /></th>
                    <th><spring:message code="pay.paypal" /></th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="c" items="${payStats}">
                    <tr>
                        <td>${c.id}</td>
                        <td>${c.status}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
</div>
                


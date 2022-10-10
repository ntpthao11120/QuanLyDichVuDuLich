<%-- 
    Document   : car-month-stats
    Created on : 4 Nov 2021, 16:51:05
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="text-center text-primary"  ><spring:message code="stats.sale" /></h1>
<form action="">
    <div class="form-group"><!-- comment -->
        <label> Nhập từ khóa: </label>
        <input type="text" name="kw" class="form-control" />
    </div>
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
  <canvas id="myCarSaleMonthStatsChart"></canvas>
</div> 
<br>
<div class="table-responsive">
        <table  class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="car.month" /></th>
                    <th><spring:message code="car.sale" /></th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="c" items="${saleMonthStats}">
                    <tr>
                        <td>${c[0]}/${c[1]}</td>
                        <td>${c[2]} VND</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
</div>
                
                <script>
    let carLabels=[], carInfo=[];
    
    <c:forEach var="c" items="${saleMonthStats}">
        carLabels.push('${c[0]}/${c[1]}')
        carInfo.push(${c[2]})
    </c:forEach>
    
    window.onload = function(){
        salecarMonthChart("myCarSaleMonthStatsChart", carLabels, carInfo)
    }
</script>

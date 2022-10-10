<%-- 
    Document   : car-stats
    Created on : 4 Nov 2021, 13:42:39
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="text-center text-primary"  ><spring:message code="stats.car.category" /></h1>
<div>
  <canvas id="myCarStatsChart"></canvas>
</div> 
<br>
<div class="table-responsive">
        <table  class="table table-bordred table-hover">
            <thead>
                <tr style="background-color:#87CEFA;">
                    <th><spring:message code="cate.stats" /></th>
                    <th><spring:message code="cate.name.stats" /></th>
                    <th><spring:message code="cate.num.stats" /></th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="c" items="${carStats}">
                    <tr>
                        <td>${c[0]}</td>
                        <td>${c[1]}</td>
                        <td>${c[2]}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
</div>
<script>
    let carLabels=[], carInfo=[];
    
    <c:forEach var="c" items="${carStats}">
        carLabels.push('${c[1]}')
        carInfo.push(${c[2]})
    </c:forEach>
    
    window.onload = function(){
        carChart("myCarStatsChart", carLabels, carInfo)
    }
</script>
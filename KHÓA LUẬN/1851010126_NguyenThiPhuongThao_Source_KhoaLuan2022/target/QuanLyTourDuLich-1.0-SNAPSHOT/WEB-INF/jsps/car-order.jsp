<%-- 
    Document   : car-order
    Created on : 27 Oct 2021, 20:03:25
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row" style="background-color:#F8F8FF;">
    <div class="col-md-2" ></div>
    <div class="col-md-8">
        <form class="order" >
            <h2 class="text-center">${carOrder.name}</h2><!-- comment -->
            <h3 class="text-primary">Giá: ${carOrder.price}VNĐ/ngày</h3>
            <div class="form-group">
                <label><spring:message code="date.number.rent" /></label>
                <input id="dateNum" type="number" min ="1" class="form-control" name="dateNum" value="1" onblur="updateDate(this, ${carOrder.id})" />
            </div>
            <div class="form-group">
                <label><spring:message code="date.rent" /></label>
                <input min="minDate" type="text" id="dateRent" name="dateRent" class="form-control" />
                <form:errors path="dateRent" cssClass="text-danger" element="div" />
            </div>

                <h4 class="text-danger">Tổng tiền: <span id="amount" name="amount">${stats}</span>VNĐ</h4>
                 
                <div class="form-check-inline">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="optradio" value="money"><spring:message code="pay.money" />
                    </label>
                  </div>
                  <div class="form-check-inline">
                    <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="optradio" value="paypal"><spring:message code="pay.paypal" />
                    </label>
                  </div>
                    <div class="form-group collapse money box">
                        <input style="width: 100%; border-radius: 4px; background-color:#1E90FF;" type="button" value="Thanh toán" onclick="addOrderCarMoney(${carOrder.id})" class="btn text-light" />
                    </div>
                    
                    <div class="form-group collapse paypal box" >
                        <input style="width: 100%; border-radius: 4px; background-color:#1E90FF;" type="button" value="Đặt xe" onclick="addOrderCar(${carOrder.id})" class="btn text-light" />
                    </div>
                <br><br>
        </form>
                    
    </div>
</div>

    <script>    
    window.onload = function () {
     $('#dateRent').datepicker({  
         minDate: 0
      });
 }
 
    $(document).ready(function () {
                $('input[type="radio"]').click(function () {
                    var inputValue = $(this).attr("value");
                    var targetBox = $("." + inputValue);
                    $(".box").not(targetBox).hide();
                    $(targetBox).show();
                });
            });
 </script>





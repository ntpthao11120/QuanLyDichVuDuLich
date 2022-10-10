    <%-- 
    Document   : index
    Created on : 30 Aug 2021, 14:18:38
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<c:url value="/javascript/jsTour.js"/>"></script>



<div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
        <img src="resources/images/car1.jpg" alt="Phu-yen" width="100%" height="330px">
        <div class="carousel-caption  ">
            <h3>Du lịch cùng VN GO Travel</h3>
            <p>ĐA DẠNG - CHẤT LƯỢNG</p>
          </div>
    </div>
    <div class="carousel-item ">
        <img src="resources/images/car2.jpg" alt="Vinh-ha-long" width="100%" height="330px">
        <div class="carousel-caption  ">
            <h3>Du lịch cùng VN GO Travel</h3>
            <p>NHIỀU SỰ LỰA CHỌN</p>
        </div>
    </div>
    <div class="carousel-item">
        <img src="resources/images/car3.jpg" alt="Phu-quoc" width="100%" height="330px">
        <div class="carousel-caption  ">
            <h3>Du lịch cùng VN GO Travel</h3>
            <p>ƯU ĐÃI BẤT NGỜ</p>
        </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<br>

<div class="row" style="padding-top: 30px">
    <div class="col-md-9">
        <span class="alert" style="background-color: red;color: white">
          <img style="width:30px"class="img-fluid"src="<c:url value="/images/fire.png"/>"/><strong>Tour Nổi bật</strong>
        </span>
       <div id="demo1" class="carousel slide alert alert-info" data-ride="carousel" >
  <!-- The slideshow -->
 
  <div class="carousel-inner">
    <div class="carousel-item active">
     <div class="row">
        <c:forEach var="p" items="${hotTours1}">
            <div class="col-md-4 col-xs-12" style="padding: 10px">
                <div class="card">
                <a href="<c:url value="/tour/${p[0]}"/>" style="height: 155px">
                    <c:choose>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="${p[3]}"/>" alt="${p[1]}"/>
                        </c:when>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${p[1]}"/>
                        </c:when>
                    </c:choose>
                </a>
                <div class="card-body">
                    <h4 class="card-title">${p[1]}</h4>
                    <hr>
                    <p class="card-text">Ngày khởi hành: ${p[6]}</p>
                    <p class="card-text">Ngày kết thúc: ${p[7]}</p>
                    <a href="<c:url value="/tour/${p[0]}"/>"><h3 class="btn btn-warning btn-lg text-white">Giá từ ${p[5]}</h3></a>
                </div>
                </div>
            </div>
        </c:forEach>
      </div>
    </div>
    <div class="carousel-item">
      <div class="row">
        <c:forEach var="p" items="${hotTours2}">
            <div class="col-md-4 col-xs-12" style="padding: 10px">
                <div class="card">
                <a href="<c:url value="/tour/${p[0]}"/>" style="height: 155px">
                    <c:choose>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="${p[3]}"/>" alt="${p[1]}"/>
                        </c:when>
                        <c:when test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img class="card-img-top img-fluid" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${p[1]}"/>
                        </c:when>
                    </c:choose>
                </a>
                <div class="card-body">
                    <h4 class="card-title">${p[1]}</h4>
                    <hr>
                    <p class="card-text">Ngày khởi hành: ${p[6]}</p>
                    <p class="card-text">Ngày kết thúc: ${p[7]}</p>
                    <a href="<c:url value="/tour/${p[0]}"/>"><h3 class="btn btn-warning btn-lg text-white">Giá từ ${p[5]}</h3></a>
                </div>
                </div>
                
            </div> 
        </c:forEach>
          <div class="col-md-4 col-xs-12" style="padding: 10px; margin-top: 70px">
               <a href="<c:url value="/hottour/"/>" style="height: 155px">
                     <img class="img-fluid" style="width: 200px" src="<c:url value="/images/all.png  "/>"alt="Hình all"/>
               </a>
          </div>
      </div>
    </div>
  </div>
  
  <!-- Left and right controls -->
<a class="carousel-control-prev" href="#demo1" data-slide="prev">
      <img name="Hinh" src="/QuanLyTourDuLich/images/previous.png"
           onmouseover="document.Hinh.src='/QuanLyTourDuLich/images/previous2.png'"
           onmouseout="document.Hinh.src='/QuanLyTourDuLich/images/previous.png'">
  </a>
  <a class="carousel-control-next" href="#demo1" data-slide="next">
    <img name="Hinh2" src="/QuanLyTourDuLich/images/next.png"
         onmouseover="document.Hinh2.src='/QuanLyTourDuLich/images/next2.png'"
         onmouseout="document.Hinh2.src='/QuanLyTourDuLich/images/next.png'"/>
  </a>
</div>

    </div>
    <div class="col-md-3">
        <span class="badge text-dark"  style="background-color:#DA70D6; width: 100%; ">
            <h3 style="text-align: center;"><spring:message code="label.news" /></h3>
        </span>
        <c:forEach var="n" items="${latestNews}">
            <h4><a href="<c:url value="/news/${n[0]}" />">${n[1]}</a></h4>
            <h7 style="color: #87CEFA;"><i>(Ngày: ${n[2]})</i></h7>
        </c:forEach>
    </div>
</div>


<!--Nội dung Tour-->
<c:forEach var="tour" items="${tours}">
        <div class="row p-2 mb-2 bg-light bg-gradient" >
                <div class="col-md-5" >
                    <a href="<c:url value="/tour/${tour.id}"></c:url>">
                        <c:if test="${tour.image != null && tour.image.startsWith('https') == true}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="${tour.image}"/>" alt="${tour.name}" />
                        </c:if>
                        <c:if test="${tour.image == null || tour.image.startsWith('https') == false}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${tour.name}" />
                        </c:if>
                    </a>        
                    
                </div>
                <div class="col-md-5">
                    <h1><a href="<c:url value="/tour/${tour.id}"></c:url>">${tour.name}</a> </h1>
                    <p>${tour.trip}</p>           
                </div>
                <div class="col-md-2">
                    <a href="<c:url value="/tour/${tour.id}"/>"<button class="btn btn-warning btn-lg text-white">Giá từ ${tour.childPrice}</button></a>
                    <br/><br/>
                    <span>${tour.startDay}</span>
                    <br/><br/>
                    <span>${tour.endDay}</span>
                </div>
        </div>
</c:forEach>

<hr>
<c:forEach var="p" items="${hotTours}">
        <div class="row p-2 mb-2 bg-light bg-gradient" >
                <div class="col-md-5" >
                    <a href="<c:url value="/tour/${p[0]}"></c:url>">
                        <c:if test="${p[3] != null && p[3].startsWith('https') == true}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="${p[3]}"/>" alt="${tour.name}" />
                        </c:if>
                        <c:if test="${p[3] == null || p[3].startsWith('https') == false}">
                            <img style="cursor: pointer; width: 285px; height: 177px" class="img-fluid img1" src="<c:url value="/images/vinh-ha-long.jpg"/>" alt="${tour.name}" />
                        </c:if>
                    </a>        
                    
                </div>
                <div class="col-md-5">
                    <h1><a href="<c:url value="/tour/${p[0]}"></c:url>">${p[1]}</a> </h1>
                    <p>${p[2]}</p>           
                </div>
                <div class="col-md-2">
                    <a href="<c:url value="/tour/${p[0]}"/>"<button onclick="" class="btn btn-warning btn-lg text-white">Giá từ ${p[5]}</button></a>
                    <br/><br/>
                    <span>${p[6]}</span>
                    <br/><br/>
                    <span>${p[7]}</span>
                </div>
        </div>
</c:forEach>
<!--page-->
<!--<ul class="pagination">
        <c:forEach  var="i" begin="1" end="${Math.ceil(counter/5)}">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${i}">${i}</a></li>
        </c:forEach>
</ul>-->

<script src="https://www.gstatic.com/firebasejs/6.6.1/firebase-app.js"></script>
 
<!-- include firebase database -->
<script src="https://www.gstatic.com/firebasejs/6.6.1/firebase-database.js"></script>


<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:if test="${currentUser.userRole == 'ROLE_CLIENT'}">
        <script>
    // Your web app's Firebase configuration
    var firebaseConfig = {
        apiKey: "AIzaSyBUnNXV9QgU5ineGTNje70WMpIG5aQoUUg",
        authDomain: "quanlytourdulich-27b3f.firebaseapp.com",
        databaseURL: "https://quanlytourdulich-27b3f-default-rtdb.firebaseio.com/",
        projectId: "quanlytourdulich-27b3f",
        storageBucket: "quanlytourdulich-27b3f.appspot.com",
        messagingSenderId: "77665993357",
        appId: "1:77665993357:web:8acccdd35beb9ea1d498c4",
        measurementId: "G-5ER2WSJ1BB"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
    var myName = "${currentUser.firstName}" + " ${currentUser.lastName}";
    function sendMessage() {
        // get message
        var message = document.getElementById("message").value;
 
        // save in database
        firebase.database().ref("${currentUser.id}").push().set({
            "sender": myName,
            "message": message
        });
 
        // prevent form from submitting
        return false;
    }
    
    firebase.database().ref("${currentUser.id}").on("child_added", function (snapshot) {
            var html = "";
            html += "<id='message-" + snapshot.key + "'>";
            html += "<p id='" + snapshot.key + "'  >" + snapshot.val().message +"</p>";
            
        document.getElementById("messages").innerHTML += html;
        if(snapshot.val().sender === "VN Go Travel"){
            $("#" + snapshot.key + "").addClass("response-ai");
        }else{
            $("#" + snapshot.key + "").addClass("sentto");
        }
        document.getElementById("message").value = "";       
    });
</script>

    <div class="chatbox-icon" chat-open="no">
        <img class="chaticon" src="<c:url value="/images/message.png"/>">
      </div>
      <div class="message-box">
        <div class="message-top">
          <span><span class="name">Liên hệ với VN Go Travel</span></span>
        </div>
        <div id="messages" class="message-center">
      <!--    <p class="response-ai">Hi, I'm Jesse. Nice to meet you. How can I help you?</p>-->
        </div>
          <form class="message-bottom" onsubmit="return sendMessage();">
              <input class="input-msg" id="message" autocomplete="off">

              <input class="btn-send" type="submit" value="Gửi">
          </form>
      </div>
    </c:if>

</c:if>

<script src="https://cdn.jsdelivr.net/vue/latest/vue.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/botui/build/botui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="https://unpkg.com/botui/build/botui-theme-default.css" />
<link rel="stylesheet" href="https://unpkg.com/botui/build/botui.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<script>
    $(document).ready(function(){
  
  var chaticon = $(".chatbox-icon");
  var message = $(".message-box");
  var openmess = $(".open");
  var cicon = $(".chaticon");
  var jesse = $(".response-ai");
  
  //Duplicating outage notifications
  Cookies.set("outage", "yes");
  
  jesse.fadeIn("medium").delay(1000);
  
  chaticon.click(function(){
    if (chaticon.attr("chat-open") == "yes") {
       message.css("bottom", "-1000px");
       chaticon.attr("chat-open", "no");
       cicon.attr("src", "<c:url value="/images/message.png"/>");
    } else {
       message.css("bottom", "94px");
       chaticon.attr("chat-open", "yes");
       cicon.attr("src", "<c:url value="/images/message.png"/>");
    }
    
  });
  
});
</script>

<style>
    .chatbox-icon {
  width: 60px;
  height: 60px;
  border-radius: 100%;
  background-color: #87CEFA;
  box-shadow: 0px 0px 4px 2px rgba(0, 0, 0, 0.25);
  position: fixed;
  bottom: 20px;
  right: 20px;
  transition: .5s ease-in-out background-color;
  display: block;
  cursor: pointer;
}

.chaticon {
  width: 40px;
  margin-top: 10px;
  margin-left: 10px;
}

.message-box {
    width: 350px;
    height: 420px;
    background-color: rgb(238, 241, 238);
    border-radius: 12px;
    box-shadow: 0px 0px 3px 1px rgba(0, 0, 0, 0.14);
    position: fixed;
    right: 20px;
    bottom: -1000px;
    display: block;
    transition: bottom .3s ease-in-out;
}

.message-bottom {
    margin-top: 10px;
    margin-left: 10px;
    
}

.message-bottom input{
    height: 30px;
}

.input-msg{
    width: 250px;
    border: 1px solid #DFECF0;
}

.btn-send{
    background: #87CEFA;
    padding-left: 10px;
    padding-right: 10px;
    border: none;
    width: 65px;
    border-radius: 5px;
}

.message-top {
    width: 100%;
    height: 60px;
    background-color: #DFECF0;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    color: black;
}

.profile-icon {
    width: 40px;
    border-radius: 100%;
    border: 2px solid #fff;
    box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.35);
    float: left;
    margin-right: 10px;
    margin-left: 10px;
    margin-top: 7px;
}

.name {
    font-family: sans-serif;
    margin-top: 20px;
    margin-left: 10px;
    position: absolute;
    font-weight: bold;
    font-size: 17px;
}

.message-center {
    width: 100%;
    height: 290px;
    background-color: rgba(255, 255, 255, 0.27);
    overflow-x: scroll;
}

.message-value {
    outline: 0px;
    width: 93.5%;
    height: 37px;
    border: 0px;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    padding-top: 10px;
    padding-left: 10px;
    padding-bottom: 10px;
    padding-right: 10px;
    font-family: sans-serif;
    font-size: 14px;
}

.sentto {
    font-family: sans-serif;
    font-size: 15px;
    background: #87CEFA;
    color: black;
    border-radius: 5px;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 15px;
    padding-right: 15px;
    box-shadow: 0px 0px 3px 1px rgba(0, 0, 0, 0.23);
    margin-bottom: 10px;
    width: 75%;
    margin-left: 65px;
}

.response-ai {
    font-family: sans-serif;
    font-size: 15px;
    background-color: #C1C7C4;
    color: black;
    padding-top: 10px;
    padding-left: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    margin-left: 5px;
    margin-top: 5px;
    border-radius: 4px;
    box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.32);
    width: 75%;
}
</style>



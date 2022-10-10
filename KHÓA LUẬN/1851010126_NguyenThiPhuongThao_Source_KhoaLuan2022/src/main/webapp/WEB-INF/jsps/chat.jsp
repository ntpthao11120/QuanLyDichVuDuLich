<%-- 
    Document   : cart
    Created on : 7 Sept 2021, 20:41:05
    Author     : ntpth
--%>

<%-- 
    Document   : chat
    Created on : 13 May 2022, 23:35:31
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <h2 class="text-center text-danger">TƯ VẤN</h2>
  <div class="loadgrid">
    <div class="tabs-left">
      <div id="title_starts" class="chat-title">
          
        <ul id="menu" class="nav nav-tabs">
            <span class="search">Cuộc trò chuyện</span>
            <c:forEach var="chatClient" items="${chatClient}">
            <li class="a${chatClient.id} hover"><a><h3 class="name">${chatClient.firstName} ${chatClient.lastName}</h3></a></li>
            </c:forEach>
<!--          <li class=""><a href=""><h3 class="name">Nguyễn Xuân Lan</h3><span class=""></span><h4 class="sub-msg">Bên mình có hỗ trợ cho thuê xe nhiều ngày không ạ?</h4></a></li>
          <li class="active"><a href=""><h3 class="name">Xuân Nguyen</h3><h4 class="sub-msg">Không. Tôi cảm ơn!</h4></a></li>
          <li class=""><a href=""><h3 class="name">Phương Nguyễn</h3><h4 class="sub-msg">Đi du lịch hiện nay cần giấy test covid không ạ?</h4></a></li>-->
        </ul>
        
      </div>
        <c:forEach var="chatClient" items="${chatClient}">
      <div id="section-msg" class="tab-content chat-des">
          
        <div id="m${chatClient.phone}"  class="tab-pane hover">
                <span class="title"><h3>${chatClient.firstName} ${chatClient.lastName}</h3></span>
                <div id="${chatClient.email}"  class="message-info ">
<!--                      <div class="full"><span class="text">Chào mừng bạn đến với VN Go Travel</span></div>
                  <div class="full snd_row"><span class="text">Xin chào!</span></div>
                  <div class="full"><span class="text">Chúng tôi có thể giúp gì cho bạn không?</span></div>
                  <div class="full snd_row"><span class="text">Không. Tôi cảm ơn!</span></div>-->
                </div>
            <form onsubmit="return ${chatClient.firstName}${chatClient.lastName}();">
                <div class="reply">
                    <div class="reply-area">
                      <textarea id="${chatClient.id}" class="form-control" placeholder="Nhập nội dung...." autocomplete="off"></textarea>
                    </div>
                    <div class="reply-submit">
                      <button type="submit" class="btn btn-default simple-btn text-center">Gửi</button>
                    </div>
                </div>
            </form>
        </div>
                    
      </div>
                    </c:forEach>
    </div>
  </div>
    
</div>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.6.1/firebase-app.js"></script>
 
<!-- include firebase database -->
<script src="https://www.gstatic.com/firebasejs/6.6.1/firebase-database.js"></script>
 
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:forEach var="chatClient" items="${chatClient}">
<!--        

        <form onsubmit="return ${chatClient.firstName}${chatClient.lastName}();">
        <input id="${chatClient.id}" placeholder="Enter message" autocomplete="off">

        <input type="submit">-->
<!--    </form>
    <ul id="${chatClient.email}"></ul>-->
    
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
        if (firebase.apps.length === 0) {
      firebase.initializeApp(firebaseConfig);
    }
        var myName = "VN Go Travel";
        
        function ${chatClient.firstName}${chatClient.lastName}() {
            var message = document.getElementById("${chatClient.id}").value;
            // get message
            // save in database
            firebase.database().ref("${chatClient.id}").push().set({
                "sender": myName,
                "message": message
            });

            // prevent form from submitting
            return false;
        }

        firebase.database().ref("${chatClient.id}").on("child_added", function (snapshot) {
            
            var html = "";
            html += "<div id='" + snapshot.key + "' class='full'><span class='text'>" + snapshot.val().message + "</span></div>";
            
            
//            html += "<li id='${chatClient.id}-" + snapshot.key + "'>";
//            // show delete button if message is sent by me
//            html += snapshot.val().sender + ": " + snapshot.val().message;
//            html += "</li>";

            document.getElementById("${chatClient.email}").innerHTML += html;
            if(snapshot.val().sender === "VN Go Travel"){
                $("#" + snapshot.key + "").addClass("snd_row");
            }
            $("#menu li").first().addClass("active");
            if($('#menu li.active').hasClass("a${chatClient.id}")){   
                $('#section-msg .active').removeClass('active').addClass('hover');
                $("#m${chatClient.phone}").addClass("active").removeClass('hover');
            }
            $('#menu li').click(function(){
                $('#menu li.active').removeClass('active').addClass('hover');                
                $(this).addClass('active').removeClass('hover');
                if($('#menu li.active').hasClass("a${chatClient.id}")){   
                    $('#section-msg .active').removeClass('active').addClass('hover');
                    $("#m${chatClient.phone}").addClass("active").removeClass('hover');
                }
            });
            document.getElementById("${chatClient.id}").value = "";
        });   
    </script>
    </c:forEach>
        

</c:if>

<style>

a:active {outline:0;}

.clear {clear:both;}
#wrapper{width:1100px;margin: 0px auto;/* float: left; */clear: both;}
.loadgrid{float: left;width: 1100px;margin: 10px auto;border:0;}
.loadgrid .tabs-left {float: left;margin-top: 0;margin-bottom: 0;}
.loadgrid .chat-title{float: left;width: 275px;border-right: 0px #ddd solid;height: 470px;background:#87CEFA;}
.loadgrid .chat-title ul{padding: 0;list-style: none;width:275px;margin-bottom: 0;border: 0px;min-height: 282px;max-height: 282px;/* overflow: auto; *//* overflow-x: hidden; */}
.loadgrid .chat-title ul .search{padding-top:20px;width: 275px;float: left;border-bottom: 1px #f6f6f6 solid; height: 54px; color: black; text-align: center; font-size: 17px; font-weight: bold;}

/*.loadgrid .chat-title ul .title{background: black;}
.loadgrid .chat-title ul .title h3{width: 275px;float: left;padding: 9px 9px;background: black;border: 1px #212c38 solid;margin:0px;font-size: 18px;color: #fff;line-height: 5px;}*/
.loadgrid .chat-title ul li{cursor: pointer;padding: 0px;width: 275px;border-right: 0px; }
/*.loadgrid .chat-title ul li .unread{color: #000;background:#fff;border-radius:50px;border: 0px #212c38 solid;float:right;width:25px;height:5px;padding:3px 4px;line-height: 5px;text-align: center;font-size: 12px;margin-right:20px;}*/
/*.loadgrid .chat-title ul li:last-child{border-right: 0px #ddd solid;}*/
.loadgrid .chat-title ul li a{padding: 12px 15px 8px 15px;background: #87CEFA;width: 275px;color: black;float: left;clear: both;}
.loadgrid .chat-title ul li a .name{font-size: 13px;font-weight: normal; margin: 0px; width: 275px; float: left;}
/*.loadgrid .chat-title ul li a .online{ background: #25b000; padding: 3px; width: 2px;height: 2px;  float: left;  position: relative; border-radius: 20px;top: -20px;right: 0;left: 45px;display: inline-block;}
.loadgrid .chat-title ul li a .sub-msg{font-size: 11px;color: #979ea6;margin: 5px 0;float: left;width: 80%;}
.loadgrid .chat-title ul li a .min{font-size: 11px;color: #979ea6;margin: 5px 0;float: right;width: 16%;text-align: right;}*/
.loadgrid .chat-title ul li.active a:hover {background:#B6BFBF;color: black;width:275px; border-right:0px;}
.loadgrid .chat-title ul li.active a {background: #B6BFBF;color: black;margin-left: 0px;border: 0px;}
.loadgrid .chat-title ul li a:hover {background: #B6BFBF;color: black;border: 0px;/* float: left; *//* width: 100%; */}
.loadgrid .chat-des{float: left;width: 825px;margin-left: 0px;/* z-index: 999999999; */border-left: 1px #ddd solid;background: #fff;}
.loadgrid .chat-des .tab-pane{}
.loadgrid .chat-des .tab-pane .title{width: 100%;float: left;padding: 0;background: #fff;border-bottom: 1px #ddd solid;height: 55px;}
.loadgrid .chat-des .tab-pane .title h3{float: left;font-size: 14px;margin: 0px;line-height: 25px;color: #282e35;padding: 15px 7px; font-weight:600;}
.loadgrid .chat-des .tab-pane .title h3 strong{ font-size:10px; font-weight:600;}
.loadgrid .chat-des .tab-pane .title .icons{line-height: 25px;color: #282e35;padding: 15px 7px;width: 55px;text-align: center;border: 1px #ddd solid;/* margin: -1px; */border-top: 0px;cursor: pointer;float: right;border-right: 0px;}
.loadgrid .chat-des .tab-pane .message-info{width: 100%;padding: 10px;float: left;min-height: 370px;max-height: 370px;overflow: auto;overflow-x: hidden;background: #f6f6f6;}
.loadgrid .chat-des .tab-pane .message-info .full{width: 94%;margin:5px 0;float: left;}
.loadgrid .chat-des .tab-pane .message-info .full.snd_row{width: 94%;margin:5px 0;float: right;}
.loadgrid .chat-des .tab-pane .message-info .full .date-change{ width: 100%; margin:0; float: left; text-align:center;}
.loadgrid .chat-des .tab-pane .message-info .full .text{position: relative;line-height: 17px;color: #66696a;font-weight: normal;font-size: 12px;background-color: #cdeafc;padding: 6px 10px;white-space: pre-line;word-wrap: break-word;border-radius: 5px;text-align: left;max-width: 100%;box-sizing: border-box;float: left;display: inline-block;}
.loadgrid .chat-des .tab-pane .message-info .full .text:after {right: 100%;top: 50%;border: solid transparent;content: " ";height: 0;width: 0;position: absolute;pointer-events: none;border-color: f1f3f5;border-right-color: #cdeafc;border-width: 5px;margin-top: -6px;}
.loadgrid .chat-des .tab-pane .message-info .full.snd_row .text{position: relative;line-height: 17px;color: #000;font-weight: normal;font-size: 12px;background-color: #e8e8e8;padding: 6px 10px;white-space: pre-line;word-wrap: break-word;border-radius: 3px;text-align: left;max-width: 100%;box-sizing: border-box;float: right;display: inline-block;}
.loadgrid .chat-des .tab-pane .message-info .full.snd_row .text:after {left: 100%;top: 50%;border: solid transparent;content: " ";height: 0;width: 0;position: absolute;pointer-events: none;border-color: d3d3d3;border-left-color: #e8e8e8;border-width: 5px;margin-top: -6px;}
.loadgrid .chat-des .tab-pane .message-info .full h5{color: #66696a;font-size: 10px;display: inline-block;width: 100%; margin-bottom:0px;}
.loadgrid .chat-des .tab-pane .message-info .full.snd_row h5{color:#66696a;font-size:10px;display:inline-block;width:100%;margin-bottom:0px;text-align: right;}
.loadgrid .chat-des .tab-pane .reply{float:left;width:100%;border-top: 1px #ddd solid;padding: 0;background: #fff;}
.loadgrid .chat-des .tab-pane .reply .reply-area{width: 83%;float:left;}
.loadgrid .chat-des .tab-pane .reply .attach{line-height: 25px;color: #282e35;padding: 11px 7px;width: 44px;height: 44px;text-align: center;border: 0px #ddd solid;margin: -1px;cursor: pointer;float: left;border-right: 0px;}
.loadgrid .chat-des .tab-pane .reply .reply-area textarea{border-radius:0px;box-shadow:none;margin-right: 0px;float:left;resize:none;border: 0px;font-size: 12px;height: 44px;}
.loadgrid .chat-des .tab-pane .reply .reply-submit{border-radius:0px; box-shadow:none; margin-left:5px; float:left;}
.loadgrid .chat-des .tab-pane .reply .reply-submit .btn{box-shadow:none;margin-left:5px;float:left;padding: 7px 24px 4px 24px;font-size:13px;text-transform:uppercase;background: #cdeafc;color: #777;margin-top: 7px;border: 1px #777 solid;border-radius: 40px;font-weight: 600;}

</style>



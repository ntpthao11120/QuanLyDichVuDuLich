<%-- 
    Document   : news
    Created on : 13 Oct 2021, 20:32:14
    Author     : ntpth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <c:url value="/news/${newsId}" var="action" />
            <form:form method="get" action="${action}" modelAttribute="news" enctype="multipart/form-data">
                <h2>${news.title}</h2>
                <h7 style="color: #87CEFA;"><i>Ngày: ${news.createdDate}</i></h7>
                <p>${news.description}</p>
            </form:form>
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
    <form id="comment" class="d">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <div class="form-group">
                <textarea class="form-control" id="commentId" placeholder="Nhập bình luận của bạn..."></textarea>
                <br>
                <input type="button" value="Gửi" onclick="addComment(${newsId})" class="btn btn-primary">
            </div>
        </c:if>
        <c:forEach var="c" items="${comment}">
            <div id="commentAre" class="b${c.id}">                       
                <div class="row">
                    <div class="col-md-1" style="padding: 10px">
                        <img style="width: 70%" class="img-fluid" src="<c:url value="${c.userId.image}" />"/>
                    </div>
                    <div class="col-md-11 date">
                        <c:if test="${c.userId.userRole == 'ROLE_ADMIN'}">
                            <b> VNGo Travel</b>
                        </c:if>
                        <c:if test="${c.userId.userRole == 'ROLE_STAFF'}">
                            <b> VNGo Travel</b>
                        </c:if>
                        <c:if test="${c.userId.userRole == 'ROLE_CLIENT'}">
                            <b> ${c.userId.firstName}</b>
                        </c:if>
                        <p>${c.content}</p>
                        <i>${c.createdDate}</i>
                        <div>
                            <a class="btn btn-primary" data-toggle="collapse" data-target="#a${c.id}" >Phản hồi</a>
                        </div>
                        <c:if test="${c.userId.username == pageContext.request.userPrincipal.name}">
                            <div class="d-flex justify-content-end">
                                <a class="btn"  onclick="getComment(${c.id})">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                                <a class="btn"  onclick="Comment(${c.id})" >
                                    <span class="glyphicon glyphicon-trash" >
                                    </span>
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>
            <div id="a${c.id}" class="collapse">
                  
                <div id="replyArea">
                         <div class="row">                                                               
                        <c:forEach var="p" items="${c.commentCollection}">
                            <div id="commentArea" class=" d${p.id}" > 
                                <div class="col-md-1"></div>
                                <div class="col-md-1" style="padding: 10px">
                                    <img style="width: 70%" class="img-fluid" src="<c:url value="${p.userId.image}" />"/>
                                </div>
                                <div class="col-md-10 date">
                                    <c:if test="${p.userId.userRole == 'ROLE_ADMIN'}">
                                        <b> VNGo Travel</b>
                                    </c:if>
                                    <c:if test="${p.userId.userRole == 'ROLE_STAFF'}">
                                        <b> VNGo Travel</b>
                                    </c:if>
                                    <c:if test="${p.userId.userRole == 'ROLE_CLIENT'}">
                                        <b> ${p.userId.firstName}</b>
                                    </c:if>
                                    <p>${p.content}</p>
                                    <i>${p.createdDate}</i>
                                    <div>
                                        <a class="btn btn-primary" data-toggle="collapse" data-target="" >Phản hồi</a>
                                    </div>
                                    <c:if test="${p.userId.username == pageContext.request.userPrincipal.name}">
                                        <div class="d-flex justify-content-end">
                                            <a class="btn"  onclick="getReply(${p.id})">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </a>
                                            <a class="btn"  onclick="Comment(${p.id})" >
                                                <span class="glyphicon glyphicon-trash" >
                                                </span>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                        </c:forEach>

                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <c:if test="${pageContext.request.userPrincipal.name != null}">
                                <div class="form-group">
                                    <textarea class="form-control" id="ReplyId" placeholder="Nhập bình luận của bạn..."></textarea>
                                    <br>
                                    <input type="button" value="Gửi" onclick="addReply(${newsId}, ${c.id})" class="btn btn-primary">
                                </div>
                            </c:if>
                        </div>

                    </div>

                </div>
            </div>


        </c:forEach>

    </form>
</div>
<script>
    window.onload = function () {
        let dates = document.querySelectorAll(".date > i")

        for (let i = 0; i < dates.length; i++) {
            let d = dates[i]
            moment.locale('vi')
            moment().format('LL')
            d.innerText = moment(d.innerText).fromNow()
        }

    }
</script>
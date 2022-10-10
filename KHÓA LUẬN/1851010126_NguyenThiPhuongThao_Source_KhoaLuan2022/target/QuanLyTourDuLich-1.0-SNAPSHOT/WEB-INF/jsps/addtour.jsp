<%-- 
    Document   : tour
    Created on : 7 Sept 2021, 21:24:52
    Author     : ntpth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<h1 class="text-center text-danger"> THÊM TOUR </h1>

<c:url value="/admin/addtour" var="action" />

<c:if test="${errMsg != null}" >
    <div class="text-danger">${errMsg}</div>
</c:if>

<form:form method="post" action="${action}" modelAttribute="tour" enctype="multipart/form-data">
  
    <div class="form-group">
        <label for="name">Tên tour</label>
        <form:input type="text" id="name" path="name" cssClass="form-control"/>
        <form:errors path="name" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="trip">Chuyến đi</label>
        <form:input type="text" id="trip" path="trip" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="description">Mô tả</label>
        <form:textarea id="description" path="description" cssClass="form-control" />
    </div>
    
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">Ngày bắt đầu: </span>
      </div>
      <form:input type="text" id="startdate" path="startDay" class="form-control" placeholder="dd/MM/yyyy"/>
      <div class="input-group-prepend">
        <span class="input-group-text">Ngày kết thúc: </span>
      </div>
      <form:input type="text" id="enddate" path="endDay" class="form-control" placeholder="dd/MM/yyyy"/>
    </div>  
    
    <div class="form-group">
        <label for="adult_price">Giá người lớn</label>
        <form:input type="text" id="adult_price" path="adultPrice" cssClass="form-control" />
        <form:errors path="adultPrice" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="child_price">Giá trẻ em</label>
        <form:input type="text" id="child_price" path="childPrice" cssClass="form-control" />
        <form:errors path="childPrice" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="cat">Danh mục</label>
        <form:select id="cat" path="maLoai" cssClass="form-control" >
            <c:forEach var="cat" items="${categories}">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </form:select>
        <form:errors path="category" cssClass="text-danger" element="div" />
    </div>
    <div class="form-group">
        <label for="file">Ảnh chính tour</label>
        <form:input type="file" id="file" path="file" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="file">Ảnh slide tour 1</label>
        <form:input type="file" id="file1" path="file1" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="file">Ảnh slide tour 2</label>
        <form:input type="file" id="file2" path="file2" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="file">Ảnh slide tour 3</label>
        <form:input type="file" id="file3"  path="file3" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="file">Ảnh slide tour 4</label>
        <form:input type="file" id="file4" path="file4" cssClass="form-control" />
    </div>
    <div class="form-group">
        <label for="file">Ảnh slide tour 5</label>
        <form:input type="file" id="file5" path="file5" cssClass="form-control" />
    </div>
 
    <div class="form-group">
        <input type="submit" value="Thêm tour" class="btn btn-danger" />
    </div>
</form:form>
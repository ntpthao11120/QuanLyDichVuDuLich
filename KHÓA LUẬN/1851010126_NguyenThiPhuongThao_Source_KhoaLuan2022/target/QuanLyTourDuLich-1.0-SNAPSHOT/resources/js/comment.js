/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global fetch, moment */

 
function addComment(newsId){
    fetch("/QuanLyTourDuLich/api/addComment",{
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("commentId").value,
            "newsId": newsId
        }),
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);
        
        let area = document.getElementById("commentAre");
        
        area.innerHTML = `
            <div class="row">
                    <div class="col-md-1" style="padding: 10px">
                        <img style="width: 70%" class="img-fluid" src="${data.userId.image}" />
                    </div>
                    <div class="col-md-11 date">
                        <b>${data.userId.firstName}</b>
                        <p>${data.content}</p>
                        <i>${moment(data.createdDate).fromNow()}</i>
                    </div>
                </div>
            ` + area.innerHTML
    })
}


function addReply(newsId, parentId){
    fetch("/QuanLyTourDuLich/api/addReply",{
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("ReplyId").value,
            "newsId": newsId,
            "parentId": parentId
        }),
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);
        
        let area = document.getElementById("replyArea");
        
        area.innerHTML = `
            <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1" style="padding: 10px">
                        <img style="width: 70%" class="img-fluid" src="${data.userId.image}" />
                    </div>
                    <div class="col-md-10 date">
                        <b>${data.userId.firstName}</b>
                        <p>${data.content}</p>
                        <i>${moment(data.createdDate).fromNow()}</i>
                    </div>
                </div>
            ` + area.innerHTML
    })
}

function getComment(commentId){
    fetch("/QuanLyTourDuLich/api/getComment/"+ commentId +"",{
        method: 'get',
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);       
        
        $('.b' + `${data.id}` +'').replaceWith( `
            <div class="row b${data.id}">
                <div class="col-md-1" style="padding: 10px">
                    <img style="width: 70%" class="img-fluid" src="${data.userId.image}" />
                </div>
                <div class="col-md-11">
                    <div class="form-group">
                        <textarea class="form-control" id="cmt" >${data.content}</textarea>
                        <br>
                        <input type="button" value="Gửi" onclick="updateComment(${data.id})" class="btn btn-primary">
                    </div>
                </div>
            </div>
            `);
    })
}


function updateComment(commentId){
    fetch("/QuanLyTourDuLich/api/updateComment/"+ commentId +"",{
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("cmt").value,
            "commentId": commentId
        }),
        headers:{
            "Content-Type": "application/json"
        },
    }).then(function (res) {
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);           
        $("#comment").load(window.location + " #comment");
    })
}

function getReply(commentId){
    fetch("/QuanLyTourDuLich/api/getComment/"+ commentId +"",{
        method: 'get',
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);       
        
        $('.d' + `${data.id}` +'').replaceWith( `
            <div class="row d${data.id}">
                <div class="col-md-1"></div>
                <div class="col-md-1" style="padding: 10px">
                    <img style="width: 70%" class="img-fluid" src="${data.userId.image}" />
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <textarea class="form-control" id="cmt" >${data.content}</textarea>
                        <br>
                        <input type="button" value="Gửi" onclick="updateComment(${data.id})" class="btn btn-primary">
                    </div>
                </div>
            </div>
            `);
    })
}



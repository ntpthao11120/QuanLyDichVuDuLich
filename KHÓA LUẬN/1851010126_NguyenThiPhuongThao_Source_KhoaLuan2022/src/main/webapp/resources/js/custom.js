/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
function willDel(userId) {
    $.ajax({
        type: "POST",
       url: "/QuanLyTourDuLich/api/delUser/"+ userId +"",
       success:function(response){
           $("#mytable").load(window.location + " #mytable");
       }
    });
} 

function delNews(newsId) {
    $.ajax({
        type: "POST",
       url: "/QuanLyTourDuLich/api/delNews/"+ newsId +"",
       success:function(response){
           $("#table").load(window.location + " #table");
       }
    });
}

function delComment(commentId) {
    $.ajax({
        type: "POST",
       url: "/QuanLyTourDuLich/api/delComment/"+ commentId +"",
       success:function(response){
           $("#comment").load(window.location + " #comment");
       }
    });
}

function delCar(carId){
    $.ajax({
        type: "POST",
       url: "/QuanLyTourDuLich/api/delCar/"+ carId +"",
       success:function(response){
           $("#cartable").load(window.location + " #cartable");
       }
    });
}

function News(newsId){
    swal({
    title: "Bạn có chắc chắn muốn xóa không?",
    text: "Bạn sẽ không thể khôi phục dữ liệu sau khi xóa! ",
    icon: "warning",
    buttons: ["Thoát", "Xác nhận"],
    dangerMode: true
  }).then((willDelete) => {
  if (willDelete) {
        delNews(newsId);
        swal("Đã xóa thành công", {
        icon: "success",
    });
    } else {
        swal("Xóa thất bại!");
  }
});
}


function delUser(userId){
    swal({
    title: "Bạn có chắc chắn muốn xóa không?",
    text: "Bạn sẽ không thể khôi phục dữ liệu sau khi xóa! ",
    icon: "warning",
    buttons: ["Thoát", "Xác nhận"],
    dangerMode: true
  }).then((willDelete) => {
  if (willDelete) {
        willDel(userId);
        swal("Đã xóa thành công", {
        icon: "success",
    });
    } else {
        swal("Xóa thất bại!");
  }
});
}

function Comment(commentId){
    swal({
    title: "Bạn có chắc chắn muốn xóa không?",
    text: "Bạn sẽ không thể khôi phục dữ liệu sau khi xóa! ",
    icon: "warning",
    buttons: ["Thoát", "Xác nhận"],
    dangerMode: true
  }).then((willDelete) => {
  if (willDelete) {
        delComment(commentId);
        swal("Đã xóa thành công", {
        icon: "success",
    });
    } else {
        swal("Xóa thất bại!");
  }
});
}

function Car(carId){
    swal({
    title: "Bạn có chắc chắn muốn xóa không?",
    text: "Bạn sẽ không thể khôi phục dữ liệu sau khi xóa! ",
    icon: "warning",
    buttons: ["Thoát", "Xác nhận"],
    dangerMode: true
  }).then((willDelete) => {
  if (willDelete) {
        delCar(carId);
        swal("Đã xóa thành công", {
        icon: "success",
    });
    } else {
        swal("Xóa thất bại!");
  }
});
}


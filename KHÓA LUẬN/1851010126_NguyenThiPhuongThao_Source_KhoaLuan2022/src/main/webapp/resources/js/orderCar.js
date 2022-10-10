/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function updateDate(obj, carId){
    fetch("/QuanLyTourDuLich/api/car-order",{
        method: "put",
        body: JSON.stringify({
            "carId": carId,
            "dateNum": obj.value
        }),
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function(res){
        console.info(res);
        return res.json();
    }).then(function(data){
        let amount = document.getElementById("amount")
        amount.innerText = data
    })
}

function addReceipt(carId){
    fetch("/QuanLyTourDuLich/api/addReceipt",{
        method: 'post',
        body: JSON.stringify({
            "dateNum": document.getElementById("dateNum").value,
            "dateRent": document.getElementById("dateRent").value,
            "carId": carId
        }),
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function(res){
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);
        
        $('.order').replaceWith(`
        <form method="post" action="/QuanLyTourDuLich/pay/${data.id}">
            <h3 class="text-center">Cảm ơn bạn đã lựa chọn dịch vụ của chúng tôi</h3>
            <h3 class="text-center">Bạn vui lòng đến cửa hàng để nhận xe vào ngày <span>${data.dateRent}</span> nhé!</h3>
            <h3 class="text-center">Tổng tiền bạn cần thanh toán là: <input class="text-center text-danger" type="text" value="${data.amount}" name="price" readonly /></h3>
        <div class="d-flex justify-content-center">    
            <button style="width: 60%; border-radius: 4px; background-color:#1E90FF;" class="btn text-light" type="submit">Thanh toán</button>
        </div>
        </form>
            <br><br>
        `);
    })
}

function addOrderCar(carId){
    swal({
    title: "Bạn có chắc chắn muốn đặt xe không?",
    icon: "warning",
    buttons: ["Thoát", "Xác nhận"],
    dangerMode: true
  }).then((willDelete) => {
  if (willDelete) {
        addReceipt(carId);
        swal("Đặt xe thành công", {
        icon: "success",
    });
    } else {
        swal("Đặt xe thất bại!");
  }
});
}

function addReceiptMoney(carId){
    fetch("/QuanLyTourDuLich/api/addReceipt/money",{
        method: 'post',
        body: JSON.stringify({
            "dateNum": document.getElementById("dateNum").value,
            "dateRent": document.getElementById("dateRent").value,
            "carId": carId
        }),
        headers:{
            "Content-Type": "application/json"
        }
    }).then(function(res){
        console.info(res);
        return res.json();
    }).then(function(data){
        console.info(data);
        
        $('.order').replaceWith(`
            <h3 class="text-center">Cảm ơn bạn đã lựa chọn dịch vụ của chúng tôi</h3>
            <h3 class="text-center">Bạn cần thanh toán số tiền: <span class="text-danger">${data.amount}</span>VNĐ khi đến nhận xe.</h3>
            <h3 class="text-center">Bạn vui lòng đến cửa hàng để nhận xe vào ngày <span class="text-danger">${data.dateRent}</span> nhé!</h3>
            
            <br><br>
        `);
    })
}

function addOrderCarMoney(carId){
    swal({
    title: "Bạn có chắc chắn muốn đặt xe không?",
    icon: "warning",
    buttons: ["Thoát", "Xác nhận"],
    dangerMode: true
  }).then((willDelete) => {
  if (willDelete) {
        addReceiptMoney(carId);
        swal("Đặt xe thành công", {
        icon: "success",
    });
    } else {
        swal("Đặt xe thất bại!");
  }
});
}



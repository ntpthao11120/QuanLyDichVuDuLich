/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function generateColor(){
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    
    return `rgb(${r}, ${g}, ${b})`
}
function carChart(id, carLabels=[], carInfo=[]){
    const data = {
  labels: carLabels,
  datasets: [{
    label: 'Thống kê xe thuê theo danh mục',
    data: carInfo,
    backgroundColor: [
      'rgba(75, 192, 192, 0.2)',
      'rgba(153, 102, 255, 0.2)',
      'rgba(255, 99, 132, 0.2)'
      
    ],
    hoverOffset: 4
  }]
};

    const config = {
  type: 'doughnut',
  data: data,
};

    let c = document.getElementById(id).getContext("2d")
    new Chart(c, config)
}

function salecarChart(id, carLabels=[], carInfo=[]){
    let colors = []
    for(let i = 0; i < carInfo.length; i++)
        colors.push(generateColor());
    const data = {
  labels: carLabels,
  datasets: [{
    label: 'Thống kê doanh thu theo xe',
    data: carInfo,
    backgroundColor: colors,
    borderColor: 'rgb(75, 192, 192)',
    hoverOffset: 4
  }]
};

    const config = {
  type: 'bar',
  data: data,
};

    let c = document.getElementById(id).getContext("2d")
    new Chart(c, config)
}

function salecarMonthChart(id, carLabels=[], carInfo=[]){
    let colors = []
    for(let i = 0; i < carInfo.length; i++)
        colors.push(generateColor());
    const data = {
  labels: carLabels,
  datasets: [{
    label: 'Thống kê doanh thu theo xe',
    data: carInfo,
    backgroundColor: colors,
    borderColor: 'rgb(75, 192, 192)',
    hoverOffset: 4
  }]
};

    const config = {
  type: 'bar',
  data: data,
};

    let c = document.getElementById(id).getContext("2d")
    new Chart(c, config)
}

function payChart(id, carLabels=[], carInfo=[]){
    let colors = []
    for(let i = 0; i < carInfo.length; i++)
        colors.push(generateColor());
    const data = {
  labels: carLabels,
  datasets: [{
    label: 'Thống kê theo hình thức thanh toán',
    data: carInfo,
    backgroundColor: colors,
    borderColor: 'rgb(75, 192, 192)',
    hoverOffset: 4
  }]
};

    const config = {
  type: 'bar',
  data: data,
};

    let c = document.getElementById(id).getContext("2d")
    new Chart(c, config)
}

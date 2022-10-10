/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(()=> {
    $('#next').click(function(){
        changImage('next');
    })
    $('#prev').click(function(){
       changImage('prev');
    })
    function changImage(type){
        let imgSelectVisible = $('img.slide:visible');
        let imgVisible = parseInt(imgSelectVisible.attr('stt'));
        let eqNumber = 0;
        if(type === 'next'){
            eqNumber  = imgVisible + 1;
        }
        else{
            eqNumber  = imgVisible - 1;
        }
        if(eqNumber >= $('.slide').length){
            eqNumber = 0;
        }
        $('img.slide').eq(eqNumber).show();
        imgSelectVisible.hide();
    }
    
    setInterval(function(){
        $('#next').click();
    },15000);
})


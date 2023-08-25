window.onload=function(){

    function test(){
        console.log('test');
    }   
    let open = document.getElementById('open');
    let close = document.getElementById('close');
    let modal = document.getElementById('modal-box');

    open.addEventListener('click', function(){
        modal.classList.add('active');
    });

    close.addEventListener('click', function(){
        modal.classList.remove('active');
    });

}
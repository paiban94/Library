$('add_btn').on('click',function(){
    
    
    let title = $('#board_title').val();
    let content = $('#board_content');

    if( title == "" || content.length < 0){
        alert("빈공간이 있습니다");
    }
});
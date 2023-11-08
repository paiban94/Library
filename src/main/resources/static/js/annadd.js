let idx = 1;
$('add_btn').on('click',function(){
    
    
    let title = $('#board_title').val();
    let content = $('#board_content');

    if( title == "" || content.length < 0){
        alert("빈공간이 있습니다");
    }
});

$("#fileAdd").on('click',function(){
  
    if (idx <6) {
        console.log("click fileAdd");

        let r = '<div class="a mb-3 w-50" id="file "'+idx+'>';
    
        r = r.concat('<input type="file" class="form-control" id="pic" name="files1" </div>');
       
        r= r.concat('<div class="a df mt-2 mx-2" data-id="file" '+ idx +'>x</div>')
        
        $("#fileList").append(r);
        idx++;
    }else{
        alert('최대 첨부파일 수 는 5개 입니다.')
    }
});

$('#add_cancel').on('click',function(){
    history.back();
});
let idx=0;

$("#fileAdd").click(function(){

    let r = '<div class="col-lg-8 mb-3" id="file "'+idx+'>';

    r = r.concat('<label for="pic" class="form-label">파일첨부</label>');

    r = r.concat('<input type="file" class="form-control" id="pic" name="files1" </div>');
   
    r= r.concat('<div class="col-lg-4 df" data-id="file" '+ idx +'>x</div>')
    

    $("#fileList").append(r);
    idx++;
})

$("#fileList").on("click",".df", function(){
    
    $(this).parent().remove();
    
})



$(".delets").each(function(i,e){

    let num = this.getAttribute("data-delete-num");
    
    
    $(e).click(function(){  
        console.log(e);
        console.log(num);

        $.ajax({
            type:'GET',
            url: "./fileDelete",
            data:{
                fileNo:num
            },
            success:function(result){
                if(result.trim()=='1'){

                    $("#"+num).remove();
                    $(e).remove();
                    
                }
            },
            error:function(){
                console.log("error");
            }
        })
    })
})

$("#summernote").summernote({
    height: 400,
    callbacks: {
        onImageUpload: function(files){
            alert('이미지 업로드');
            //이미지를 server로 전송하고
            //응답으로 이미지경로와 파일명을 받아서
            //img 태그를 만들어서 src속성에 이미지 경로를 넣는것
            let formData = new FormData(); // <form></form>
            formData.append("files",files[0]); // <input type="file" name="files"> 를 폼안에 추가

            $.ajax({
                type:"post",
                url:'./setContentsImg',
                data:formData,
                enctype: 'multipart/form-data',
                cache: false,
                processData: false,
                contentType: false,
                success:function(result){
                    console.log(result)
                    $("#contents").summernote('insertImage', result.trim());
                },
                error:function(){
                    console.log('error');
                }	
            });

        },
        onMediaDelete:function(files){
            let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명
            console.log("del");
            $.ajax({
                type:'post',
                url:'./setContentsImgDelete',
                data:{
                    path:path
                },
                success:function(result){
                    console.log(result);
                },
                error:function(){
                    console.log('error');
                }
            })
        }

    }
})


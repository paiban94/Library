
// $('#board_content').summernote({
//     height: 500,
//     lang: "ko-KR",
//     callbacks: {
//         onImageUpload: function(files){
//             alert('이미지 업로드');
//             //이미지를 server로 전송하고
//             //응답으로 이미지경로와 파일명을 받아서
//             //img 태그를 만들어서 src속성에 이미지 경로를 넣는것
//             let formData = new FormData(); // <form></form>
//             formData.append("files",files[0]); // <input type="file" name="files"> 를 폼안에 추가

//             $.ajax({
//                 type:"post",
//                 url:'./setContentsImg',
//                 data:formData,
//                 enctype: 'multipart/form-data',
//                 cache: false,
//                 processData: false,
//                 contentType: false,
//                 success:function(result){
//                     console.log(result)
//                     $("#summernote").summernote('insertImage', result.trim());
//                 },
//                 error:function(){
//                     console.log('error');
//                 }	
//             });

//         },
//         onMediaDelete:function(files){
//             let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명
//             console.log("del");
//             $.ajax({
//                 type:'post',
//                 url:'./setContentsImgDelete',
//                 data:{
//                     path:path
//                 },
//                 success:function(result){
//                     console.log(result);
//                 },
//                 error:function(){
//                     console.log('error');
//                 }
//             })
//         }

//     }
// })

$(document).ready(function() {
    $('#board_content').summernote({
        height: 500,
        lang: "ko-KR",
        callbacks: {
            onImageUpload: function(files) {
                uploadImage(files[0]);
            },
            onMediaDelete: function(files) {
                // 이미지 삭제 시의 로직 추가 (추가 기능)
            }
        }
    });


});

function uploadImage(file) {
    var formData = new FormData();
    formData.append("file", file);
    
    $.ajax({
        url: "/board/uploadImage",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(data) {
            var imageUrl = data;
            $('#board_content').summernote('insertImage', imageUrl);
        },
        error: function() {
            console.log('Error uploading image');
        }
    });
}
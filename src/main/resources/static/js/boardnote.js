
$(document).ready(function () {
    let idx = 1;

    $(document).ready(function() {
        $('#add_btn').on('click', function(e) {
            e.preventDefault(); 
            
            let title = $('#board_title').val();
            let content = $('#board_content').val();
    
            if (title.trim() === '' || content.trim() === '') {
                alert('빈 공간이 있습니다');
            } else {
                
                $('#announcementForm').submit(); 
            }
        });
    
        $("#fileList").on("click", ".df", function() {
            $(this).parent().remove();
        });
    
        $("#fileAdd").on('click', function() {
            if (idx < 6) {
                let r = '<div class="a mb-3 w-50" id="file ' + idx + '">';
                r = r.concat('<input type="file" class="form-control" id="pic" name="files1" </div>');
                r = r.concat('<div class="a df mt-2 mx-2" data-id="file" ' + idx + '>x</div>')
                $("#fileList").append(r);
                idx++;
            } else {
                alert('최대 첨부파일 수는 5개 입니다.');
            }
        });
    
        $('#add_cancel').on('click', function() {
            history.back();
        });
    
    
        $(document).on('click', function (event) {
            if (!$(event.target).closest('#memberList, #tags').length) {
                $('#memberList').empty().hide();
            }
        });
        function displayMemberList(members, query) {
            var memberList = $('#memberList');
            memberList.empty();
            for (var i = 0; i < members.length; i++) {
                var memberName = members[i].empName;
                if (memberName.toLowerCase().includes(query.substring(1).toLowerCase())) {
                    var listItem = $('<li>').text(memberName);
                    memberList.append(listItem);
                }
            }
            if (memberList.children().length > 0) {
                memberList.show();
            } else {
                memberList.hide();
            }
        }
    });
    

    $('#board_content').summernote({
        height: 500,
        lang: "ko-KR",
        // data: json,
        callbacks: {
            onImageUpload: function (files1) {
                uploadImages(files1);
            },
            onMediaDelete: function (target) {
                handleImageDelete(target[0].src);
            }
        }
    });

    function uploadImages(files1) {
        var formData = new FormData();
        for (var i = 0; i < files1.length; i++) {
            formData.append("files1", files1[i]);
        }

        $.ajax({
            url: "/board/uploadImages",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                var imageUrls = data;
                for (var i = 0; i < imageUrls.length; i++) {
                    $('#board_content').summernote('insertImage', imageUrls[i]);
                }
            },
            error: function () {
                console.log('upload image fail ... error...');
            }
        });
    }

    function handleImageDelete(imageUrl) {
        $.ajax({
            url: "/board/deleteImage/" + encodeURIComponent(imageUrl),
            type: "DELETE",
            success: function () {
                console.log('success delete image');
            },
            error: function () {
                console.log('fail delete image..fk...');
            }
        });
    }
});


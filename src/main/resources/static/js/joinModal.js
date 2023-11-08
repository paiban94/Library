let emo_no = document.getElementById("joinModal")

$(document).ready(function() {
    $('#joinModal').click(function() {
        //비동기방식으로 해야 사원번호를 가져올 수 있어서 ajax사용
        $.ajax({
            url: '/member/join', 
            type: 'POST',
            success: function(data-emp_no) {
              if(data-emp_no){
                $('#emp_info').text('당신의 사원번호는 ' + data-emp_no+ '입니다.');
                }
            },
            error: function() {
                alert('사원번호 가져오기에 실패했습니다.');
            }
        });
    });
});
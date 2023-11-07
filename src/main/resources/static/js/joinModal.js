(document).ready(function() {
    // "사원번호 확인" 버튼 클릭 시 이벤트
    $('#joinModal').click(function() {
        // 서버에서 사원번호 가져오는 Ajax 요청 (서버에서 사원번호 생성 및 반환)
        $.ajax({
            url: '/getEmpNo', // 실제 경로에 맞게 수정
            type: 'GET',
            success: function(empNo) {
                // 모달 창의 텍스트 업데이트
                $('#emp_info').text('당신의 사원번호는 ' + empNo + '입니다.');
            },
            error: function() {
                alert('사원번호 가져오기에 실패했습니다.');
            }
        });
    });
});
const joinModal = document.getElementById("joinModal")



joinModal.addEventListener("click",function(){

			let empNo = $('#joinModal').data('emp_no');
			console.log("사원번호:"+empNo)
       
			
			//let data = {emp_no : empNo};
			function getEmpNO(empNo){
			//비동기방식으로 해야 사원번호를 가져올 수 있어서 ajax사용
			$.ajax({
				url: '/member/login', 
				type: 'POST',
				data:{emp_no : empNo},
				success: function(data) {	
				console.log('사원번호..:',data.emp_no)
				if(data.emp_no){
					$('#emp_info').text('당신의 사원번호는 ' + data + '입니다.');
					}
				},
				error: function() {
					alert('사원번호 가져오기에 실패했습니다.');
				}
			});
            }
            getEmpNO(empNo);
})
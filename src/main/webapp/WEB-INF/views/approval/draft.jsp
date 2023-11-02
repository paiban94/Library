<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
<style type="text/css">
.a {
	display: flex;
}


    .scrollable-card {
 
        height: 550px;
  
    }
    .scrollable-card1 {
 
        height: 70px;
  
    }
    
     .scrollable-card2 {
 
        height: 300px;
  
    }
    
    .custom_table {
    		
        width: 90%;
        }
    
    .custom_table tr {
    		
            height: 5px; 
            font-size: 12px;
        }
        
    #sign {
        height: 100px;
    }
    
    #sign_img{
		height: 80px;
		width: 140px;'    
    }
    
    #lastTr{
    	height: 35px;
    }

    

</style>


</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- sidebar -->
		<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>

				<main id="main" class="main">

					<section class="section dashboard">

						<div class="container">
							<form action="/approval/draft" method="post" id="frm"
								enctype="multipart/form-data">

								<input type="hidden" id="grp_cd" name="grp_cd" value="H">
								<input type="hidden" id="approval_state" name="approval_state" value="G">
								<input type="hidden" id="temp_save" name="temp_save" value="N">
								<input type="hidden" id="midApp" name="midApp" value="">
								<input type="hidden" id="lastApp" name="lastApp" value="">

								<div class="row">
									<!-- 각 영역 크기조절하기 -->
									<div class="col-lg-12">
										<div class="card">
											<h1 class="my-5 " align="center">업무 기안</h1>

											<!-- 상단 왼쪽 strart -->
											<div class="row grid text-center mx-3">
												<div class="col-lg-2">
													<table class="table table-bordered">

														<tr>
															<th class="table-light">기안자</th>
															<td>홍길동</td>
														</tr>


														<tr>
															<th class="table-light">소속</th>
															<td>총무부</td>
														</tr>
														<tr>
															<th class="table-light">기안일</th>
															<td>2023-10-12</td>
														</tr>
														<tr>
															<th class="table-light">문서번호</th>
															<td>1</td>
														</tr>

													</table>


												</div>
												<!-- 상단 왼쪽 end -->
												<div class="col-lg-4"></div>

												<!-- 상단 오른쪽 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered custom_table">

														<tr>
															<th class="table-light">신청</th>
															
														</tr>


														<tr id="sign">
															<td><img id="sign_img" src="/files/draft/공지3.PNG"></td>
														</tr>
														
														<tr>

															<td>r</td>
														</tr>


													</table>


												</div>


												<!-- 상단 오른쪽 end -->
												<!-- 상단 오른쪽 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered custom_table">

														<tr>
															<th class="table-light">중간</th>
															
														</tr>


														<tr id="sign">
	
															<td> </td>
														</tr>
														<tr id="lastTr">

															<td id="midP"></td>
														</tr>


													</table>


												</div>


												<!-- 상단 오른쪽 end -->
												<!-- 상단 오른쪽 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered custom_table">

														<tr>
															<th class="table-light">최종</th>
															
														</tr>


														<tr id="sign">
															<td></td>
														</tr>
														
														<tr id="lastTr">
															<td id="lastP"></td>
														</tr>

													</table>


												</div>


												<!-- 상단 오른쪽 end -->
											</div>

											<!-- 본문 -->
											<div class="row mx-3 text-center">
												<div class="col-lg-12">
													<table class="table table-bordered">
														<tr>
															<th class="table-light" style="width: 10%">시행일자</th>
															<td><input type="date" class="form-control w-25"
																id="startDate" name="start_date"></td>
														</tr>
														<tr>
															<th class="table-light">참조자</th>
															<td id="refDoc"></td>
														</tr>
														<tr>
															<th class="table-light">제목</th>
															<td><input type="text" class="form-control w-75"
																id="title" name="doc_title"></td>
														</tr>
														<tr>
															<td colspan="2">
																<div>
																	<textarea id="summernote" name="doc_contents"></textarea>
																</div>
															</td>

														</tr>
													</table>
												</div>

											</div>
											<!-- 본문 end  -->

											<div class="row mx-3 my-3">
												<div class="col-lg-12">

													<!-- file -->

													<div id="fileList"></div>


													<div class="mb-3">
														<button type="button" class="btn btn-outline-primary"
															id="fileAdd">File추가</button>
													</div>

													<!-- button  -->
													<button type="button" id="doc_send" class="btn btn-primary btn-sm">결재요청</button>
													<button type="button" id="temp_send" class="btn btn-primary btn-sm">임시저장</button>
													<button type="button" class="btn btn-primary btn-sm">취소</button>
													<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
															data-bs-target="#basicModal" id ='btnGetMem'>결재선</button> 

															

												</div>


											</div>



										</div>


									</div>




								</div>
							</form>

						</div>
			</div>


			</section>

			</main>
			<!-- End #main -->

			<!-- 모달 -->

			<div class="modal fade" id="basicModal" tabindex="-1">
				<div class="modal-dialog modal-lg" style="max-width: 60%; width: 60%;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Basic Modal</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body style="max-height: 300px; overflow-y: auto;">
						
						<div class=row>
							<div class="col-sm-3">
						
							<div>조직도</div>
							<div class="card border scrollable-card">
								<div class="overflow-auto " id="readyMem">
									
								</div>
							</div>
							
							</div>
							
							<div class="col-sm-4">
							
							<div>사원목록</div>
							<div class="card border scrollable-card">
								<div class="overflow-auto" id="memList">
									
							
									
								</div>
							
							</div>
							
							</div>
							
							<div class="col-sm-1 ">
							
							
							<div class="scrollable-card1 text-center d-flex flex-column justify-content-center align-items-center">
								<i class="bi bi-arrow-right mt-5" id="midAW"></i>
							</div>
							
							<div class="scrollable-card1 text-center d-flex flex-column justify-content-center align-items-center mt-5">
								<i class="bi bi-arrow-right mt-5" id="lastAW"></i>
							</div>
							
							<div class="scrollable-card2 text-center d-flex flex-column justify-content-center align-items-center mt-5">
								<i class="bi bi-arrow-right mt-4" id="refAW"></i>
							</div>
							
						
			
							</div>
								
							
							<div class="col-sm-4 scrollable-card">
							<div>중간 승인자</div>
							<div class="card border scrollable-card1 overflow-auto" id="fLine">
								
							</div>
							
							<div>최종 승인자</div>
							<div class="card border scrollable-card1 overflow-auto" id="lLine">
								
							</div>
							
							<div>참조자</div>
							<div class="card border scrollable-card2 overflow-auto" id="refLine">
								
							</div>
							
							</div>
						
						</div>
							</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" id="modalSave">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
			

			<!-- End Basic Modal-->



		</div>

	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	</div>



	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>




	<script src="/js/file.js"></script>
	<script type="text/javascript">
	
		$('#doc_send').click(function() {
	
			if($('#lastApp').val()==""){
				alert("최종 결재자는 필수 값입니다");
				return false;
			}
				
			$("#frm").submit();
	
		});
	
	
		$('#temp_send').click(function() {

			$("#temp_save").val("Y");
			$("#frm").submit();

		});
		
			
		
		$('#btnGetMem').click(function() {

			$("#refLine").empty();  //참조자 비우기
			$("#readyMem").empty(); //조직도 비우기
			$('#memList').empty();	//사원정보 비우기
			$('#fLine').empty();	//중간승인자 비우기
			$('#lLine').empty();	//최종승인자 비우기
			
			$.ajax({
				url:"/dept/getDeptInfo"
				,data:{}
				,dateType:"json"
				,method:"post"
				,success:function(data){
					console.log(data);
					
					
					
					let readyMemElement = $("#readyMem");
					
					let ul = $("<ul>"); 

					
					for (let i = 0; i < data.length; i++) {
					    let deptName = data[i].cd_nm;
					    
					    
					    let id = 'a' + i;
		                
		                let li = '<div id="' + id + '" class="mt-3 memList"><li>' + deptName + '</li></div>';
					    
					    
					    ul.append(li);
					}

					
					readyMemElement.append(ul);
					
					       
				}
				
			});
			
			
			

		});
		
		
		//이벤트 위임 부서 클릭시		
  		   $("#readyMem").on("click", ".memList", function () {
			 
  			   
  			 let deptName = $(this).text();
  			 
  			 
  			//부서 클릭시 emp_name값가져옴
  			let emp_team = getDeptList(deptName);
  	
	
			   $.ajax({
					url:"/dept/getEmpInfo"
					,data:{
						emp_team:emp_team
					}
					,method:"post"
					,success:function(data){
						console.log(data);
						
						$('#memList').empty();
						
						
						
				        // 머리글을 변수에 저장
				        let tableHeader = '<thead><tr>' +
				            '<th></th>' +
				            '<th>이름</th>' +
				            '<th>직책</th>' +
				            '<th>부서</th>' +
				            '</tr></thead>';

				        // 테이블 시작 태그
				        let tableStart = '<table class="table table1">';
				        $('#memList').append(tableStart);

				        // 테이블 머리글 추가
				        $('.table1').append(tableHeader);

				        // 테이블 본문 시작 태그
				        $('.table1').append('<tbody>');

				        for (let i = 0; i < data.length; i++) {
				            let emp = data[i];

				            let newRow = '<tr>' +
				                '<td><input type="radio" name="selectNm" value="' + emp.emp_no + '"></td>' +
				                '<td>' + emp.name + '</td>' +
				                '<td>' + emp.emp_position + '</td>' +
				                '<td>' + emp.emp_team + '</td>' +
				                '</tr>';

				            // 테이블 본문에 행 추가
				            $('.table1').append(newRow);
				        }

				        // 테이블 본문 종료 태그
				        $('.table1').append('</tbody>');

				        // 테이블 종료 태그
				        $('#memList').append('</table>');
						}
					,
					error: function(error) {
						console.log('Error:', error);
						
						
						       
					}
					
				});
	 
	        }); 
		
  		 function getDeptList(deptName) {
  		    let emp_team = "";

  		    switch (deptName) {
  		  		case "대표":
	            	emp_team = "A";
	            	break;
  		    	
  		        case "운영과":
  		            emp_team = "B";
  		            break;
  		        case "정책과":
  		            emp_team = "C";
  		            break;
  		        case "서비스과":
  		            emp_team = "D";
  		            break;
  		        case "가발령":
  		            emp_team = "E";
  		            break;
  		    }

  		    return emp_team;
  		}

  		//중간결재자 화살표 클릭시
  		$("#midAW").click(function() {
  		    // 체크된 항목을 가져오기
  		    $("#fLine").empty();
  		    let selectedEmps = [];
  		    $("#memList input[name='selectNm']:checked").each(function() {
  		    	
  		    	
  		        // 여기서 "emp" 객체로 변환
  		        let emp = {
  		        	emp_no:$(this).val(),
  		            name: $(this).closest('tr').find('td:eq(1)').text(), // emp.name 가져오기
  		            emp_position: $(this).closest('tr').find('td:eq(2)').text(), // emp.emp_position 가져오기
  		            emp_team: $(this).closest('tr').find('td:eq(3)').text() // emp.emp_team 가져오기
  		        };
  		        selectedEmps.push(emp);
  		       
  		    });
  		    
	  		  let fLine = $("#fLine");
			    for (let emp of selectedEmps) {
			        let newRow = '<div><table class="table">' +
			            '<tr id="midEmpNo" data-mid-empNo="'+ emp.emp_no+'"><td id="mn">' + emp.name + '</td>' +
			            '<td id="mp">' + emp.emp_position + '</td>' +
			            '<td>' + emp.emp_team + '</td>' +
			            '<td><span id="fx">x</span></td></tr></table></div>';
			        fLine.append(newRow);
			    }

  		});
  		
  	  	
  		//최종결재자 화살표 클릭시
  		$("#lastAW").click(function() {
  		    // 체크된 항목을 가져오기
  		    $("#lLine").empty();
  		    let selectedEmps = [];
  		    $("#memList input[name='selectNm']:checked").each(function() {
  		    	
  		        // 여기서 "emp" 객체로 변환
  		        let emp = {
  		        	emp_no:$(this).val(),
  		            name: $(this).closest('tr').find('td:eq(1)').text(), // emp.name 가져오기
  		            emp_position: $(this).closest('tr').find('td:eq(2)').text(), // emp.emp_position 가져오기
  		            emp_team: $(this).closest('tr').find('td:eq(3)').text() // emp.emp_team 가져오기
  		        };
  		        selectedEmps.push(emp);
  		        
  		     	
  		    });
  		    
  		    
	  		  let lLine = $("#lLine");
	  		  
			    for (let emp of selectedEmps) {
			        let newRow = '<div><table class="table">' +
			            '<tr id="lastEmpNo" data-last-empNo="'+ emp.emp_no+'"><td id="ln">' + emp.name + '</td>' +
			            '<td id="lp">' + emp.emp_position + '</td>' +
			            '<td>' + emp.emp_team + '</td>' +
			            '<td><span id="lx">x</span></td></tr></table></div>';
			        lLine.append(newRow);
			       
			    }

  		});
  		
  		//참조자 화살표 클릭시
  		$("#refAW").click(function() {
  		    // 체크된 항목을 가져오기
  		    
  		    let selectedEmps = [];
  		    $("#memList input[name='selectNm']:checked").each(function() {
  		    	
  		        // 여기서 "emp" 객체로 변환
  		        let emp = {
  		        	emp_no:$(this).val(),
  		            name: $(this).closest('tr').find('td:eq(1)').text(), // emp.name 가져오기
  		            emp_position: $(this).closest('tr').find('td:eq(2)').text(), // emp.emp_position 가져오기
  		            emp_team: $(this).closest('tr').find('td:eq(3)').text() // emp.emp_team 가져오기
  		        };
  		        selectedEmps.push(emp);
  		        
  		     	
  		    });
  		    
  		    
	  		  let refLine = $("#refLine");
	  		  
			   /*  for (let emp of selectedEmps) {
			        let newRow = '<div><table class="table">' +
			            '<tr id="refEmpNo" data-ref-empNo="'+ emp.emp_no+'"><td id="rn">' + emp.name + '</td>' +
			            '<td>' + emp.emp_position + '</td>' +
			            '<td>' + emp.emp_team + '</td>' +
			            '<td><span id="rx">x</span></td></tr></table></div>';
			        refLine.append(newRow);
			       
			    }  */
			    
 			    for (let i = 0; i < selectedEmps.length; i++) {
			        let emp = selectedEmps[i];
			        console.log(selectedEmps.length);
			        let newRow = '<div><table class="table">' +
			            '<tr id="refEmpNo' + i + '" data-ref-empNo="' + emp.emp_no + '"><td id="rn">' + emp.name + '</td>' +
			            '<td>' + emp.emp_position + '</td>' +
			            '<td>' + emp.emp_team + '</td>' +
			            '<td><span id="rx">x</span></td></tr></table></div>';
			        refLine.append(newRow);
			    } 

  		});
  		
  		$("#fLine").on('click', '#fx', function () {
  		    $(this).parent().parent().parent().remove(); 
  		});
  		
  		$("#lLine").on('click', '#lx', function () {
  		    $(this).parent().parent().parent().remove(); 
  		});
  		
  		$("#refLine").on('click', '#rx', function () {
  		    $(this).parent().parent().parent().parent().remove(); 
  		});
		
  		
		$('#modalSave').click(function() {
			
			    $('#midP').text($('#mp').text()+" "+$("#mn").text());
			    $('#lastP').text($('#lp').text()+" "+$("#ln").text());
			    $("#refDoc").text($('#rn').text());
			    
			    
			    
			    let midApp =$("#midEmpNo").attr("data-mid-empNo");
			    let lastApp =$("#lastEmpNo").attr("data-last-empNo");
			    
			    
			    let refApp0 =$("#refEmpNo0").attr("data-ref-empNo");
			    let refApp1 =$("#refEmpNo1").attr("data-ref-empNo");
			    let refApp2 =$("#refEmpNo2").attr("data-ref-empNo");
			    
			  
			    
			    
			    $("#midApp").val(midApp);
			    $("#lastApp").val(lastApp);
			    
			   
			     
			    
		
	
			$('#basicModal').modal("hide");
			
			
		});
		

		
	</script>
</body>

</html>
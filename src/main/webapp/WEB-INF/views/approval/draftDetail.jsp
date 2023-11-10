<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>



<link href="/css/doc.css" rel="stylesheet">
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
							
		
			<sec:authentication property="principal" var="vo"></sec:authentication> 

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
															<td >${docVO.name}</td>
														</tr>


														<tr>
															<th class="table-light">소속</th>
															
															<td>
																${docVO.emp_team}
															</td>
														</tr>

														<tr>
															<th class="table-light">기안일</th>
															<td> ${docVO.reg_date}</td>
														</tr>
														<tr>
															<th class="table-light">문서번호</th>
															<td>${docVO.doc_no}</td>
														</tr>

													</table>


												</div>
												<!-- 상단 왼쪽 end -->
												<div class="col-lg-4"></div>

												<!-- 신청 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered custom_table">

														<tr>
															<th class="table-light">신청</th>
															
														</tr>


														<tr id="sign">
															<td><img id="sign_img" src="/files/sign/"></td>
														</tr>
														
														<tr>

															<td>${docVO.emp_team} ${docVO.name}</td>
														</tr>


													</table>


												</div>


												<!-- 신청 end -->
												<!-- 중간 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered custom_table">

														<tr>
															<th class="table-light">중간</th>
															
														</tr>


														<tr>
														
														 <td id="midSign"></td>
															
														</tr>
														<tr>

															<td id="midP" data-midEmp="${appLine0.emp_no}"  data-a="${docVO}">${appLine0.emp_team} ${appLine0.name}</td>
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


														<tr >
														
															<td id="lastSign"></td>
														</tr>
														
														<tr>
															<td id="lastP" data-lastEmp="${appLine1.emp_no}">${appLine1.emp_team} ${appLine1.name}</td>
														</tr>

													</table>


												</div>


												<!-- 상단 오른쪽 end -->
											</div>

										
											<!-- 본문 -->
											<c:choose>
												<c:when test="${docVO.grp_cd eq 'A'}">
													<c:import url="./temp_detail_d.jsp"></c:import>
												</c:when>
												<c:when test="${docVO.grp_cd eq 'B'}">
													<c:import url="./temp_detail_e.jsp"></c:import>
												</c:when>
												<c:otherwise>
													<c:import url="./temp_detail_l.jsp"></c:import>
												</c:otherwise>
											</c:choose>
											
											<!-- 본문 end  -->

											<div class="row mx-3 my-3">
												<div class="col-lg-12">

													<!-- file -->

													<div id="fileList" ></div>


													<!-- button  -->
													<div class="btn-group my-3" role="group" aria-label="Document Approval Buttons">
														<button type="button" id="btn_appr" onClick="doc_approval('S')" style="display:none" class="btn btn-primary btn-sm mx-1">승인</button>
														<button type="button" id="btn_refusal" href="javascript:doc_approval('C')" style="display:none" class="btn btn-primary btn-sm mx-1">반려</button>
														<button type="button"  id="btn_cancle" style="display:none" class="btn btn-primary btn-sm mx-1">기안취소</button>
														<a href="./list?k=${param.k}">목록111</a>
													
													</div>
									 				<c:forEach items="${docVO.fileVOs}" var="f">
														<div>첨부파일 <a href="./fileDown?fileNo=">${f.file_oriName}</a><div>
													</c:forEach> 

												</div>


											</div>



										</div>


									</div>




								</div>
						

						</div>
			</div>


			</section>

			</main>
			<!-- End #main -->

		



		</div>

	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	</div>



	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

	<script type="text/javascript">
	let midEmpNo = $("#midP").attr("data-midEmp");
	let lastEmpNo = $("#lastP").attr("data-lastEmp");
	let loginEmpNo = "${loginEmpNo}";
	let docWriter = "${docVO.emp_no}";
	
	var midPElement = $("#midP");

	// data() 메서드를 사용하여 "data-a" 데이터 속성의 값을 가져옵니다.
	var dataAValue = midPElement.data("a");
	console.log(dataAValue)
	
	$(document).ready(function(){
		
		if(loginEmpNo == docWriter){
			if("${appLine0.approval_state}"=="R" && "${appLine1.approval_state}"=="R"){
				$("#btn_cancle").css("display","block");
			}
		}else if(midEmpNo == loginEmpNo){
			if("${appLine0.approval_state}"=="R"){
				$("#btn_appr").css("display","block");
				$("#btn_refusal").css("display","block");
			}
		}else if(lastEmpNo == loginEmpNo){
			if("${appLine0.approval_state}"=="S" && "${appLine1.approval_state}"=="R"){
				$("#btn_appr").css("display","block");
				$("#btn_refusal").css("display","block");
			}
		}
		
		if("${appLine0.approval_state}"=="S"){
			var strHtml = "<img id='sign_img' src='/files/sign/${appLine0.sign_name}'>";
			
			$("#midSign").append(strHtml);
				
		}
		
		if("${appLine1.approval_state}"=="S"){
			var strHtml = "<img id='sign_img' src='/files/sign/${appLine1.sign_name}'>";
			
			$("#lastSign").append(strHtml);
				
		}
		

	});
	
	function doc_approval(val){
		var flag = "";
		if(loginEmpNo == "${appLine0.emp_no}"){
			flag = "G";
		}else if(loginEmpNo == "${appLine1.emp_no}"){
			flag = "O";
		}
		
		$.ajax({
			type: "post",
			url : "/approval/docApproval",
			data: {"approval_state":val, "EMP_NO" : loginEmpNo, "DOC_NO" : "${docVO.doc_no}", "flag" : flag},
			dataType:"json" , 
			success: function(result){
				console.log(result);
				if(result.code="0000"){
					location.reload();
				}else{
					alert("다시시도해주세요.");
				}
			},
			error:function(){  
	            //에러가 났을 경우 실행시킬 코드
			}
		})
	}
	
	</script>
	<script src="/js/file.js"></script>

</body>

</html>
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
							<form action="./expense" method="post" id="frm" enctype="multipart/form-data">


							<div class="row">
								<!-- 각 영역 크기조절하기 -->
								<div class="col-lg-12">
									<div class="card">
										<h1 class="my-5" align="center">휴가 신청서</h1>

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
														<th class="table-light" style="width: 12%">제목</th>
														<td></td>
													</tr>
													<tr>
														<th class="table-light">휴가종류</th>
														<td></td>
													</tr>
													<tr>
														<th class="table-light">기간 및 일시</th>
														<td></td>
													</tr>
													<tr>
														<th class="table-light"">반차</th>
														<td>
															
														</td>
													</tr>
													<tr>
														<th class="table-light">연차일수</th>
														<td></td>
													</tr>
													<tr>
														<th class="table-light">참조자</th>
														<td></td>
													</tr>
													<tr >
														<td colspan="2"> <div><textarea id="summernote"></textarea></div></td>
														
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
											<button type="button" class="btn btn-outline-primary" id="fileAdd">File추가</button>
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
							

					
							</div>
								
							
							<div class="col-sm-4 scrollable-card">
							<div>중간 승인자</div>
							<div class="card border scrollable-card1 overflow-auto" id="fLine">
								
							</div>
							
							<div>최종 승인자</div>
							<div class="card border scrollable-card1 overflow-auto" id="lLine">
								
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
	<script src="/js/appLine.js"></script>
</body>

</html>
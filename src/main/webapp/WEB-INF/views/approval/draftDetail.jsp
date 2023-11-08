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
							<form action="/approval/draft" method="post" id="frm"
								enctype="multipart/form-data">

								<input type="hidden" id="grp_cd" name="grp_cd" value="A">
								<input type="hidden" id="approval_state" name="approval_state" value="R">
								<input type="hidden" id="temp_save" name="temp_save" value="N">
								<input type="hidden" id="midApp" name="midApp" value="">
								<input type="hidden" id="lastApp" name="lastApp" value="">

	
	 							
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
															<td>${docVO.name}</td>
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
											<div class="row mx-3" id="Body">
												<div class="col-lg-12">
													<table class="table table-bordered">
														<tr>
															<th class="table-light" style="width: 10%">시행일자</th>
															<td>${docVO.start_date}</td>
														</tr>
														
														<tr>
															<th class="table-light">제목</th>
															<td>${docVO.doc_title}</td>
														</tr>
														<tr>
															<td colspan="2">
																<div>
																	${docVO.doc_contents}
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
															id="fileAdd">File추가 </button>
													</div>
	
													<!-- button  -->
													
													<c:if test="${vo.emp_no ne docVO.emp_no}">
														<button type="button" id="doc_send" class="btn btn-primary btn-sm">결재요청</button>
													<button type="button" id="temp_send" class="btn btn-primary btn-sm">임시저장</button>
													<button type="button" class="btn btn-primary btn-sm">취소</button>
													<button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal"
															data-bs-target="#basicModal" id ='btnGetMem'>결재선</button> 
														
													</c:if>
													
													
									 				<c:forEach items="${docVO.fileVOs}" var="f">
														<div>첨부파일 <a href="./fileDown?fileNo=">${f.file_name}</a><div>
													</c:forEach> 

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

		



		</div>

	</div>

	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

	</div>



	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>




	<script src="/js/file.js"></script>

</body>

</html>
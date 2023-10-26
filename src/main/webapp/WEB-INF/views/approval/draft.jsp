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
								<input type="hidden" id="temp_save" name="temp_save" value="N">

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
													<table class="table table-bordered">

														<tr>
															<th rowspan="4" class="table-light">신청</th>
															<td>홍길동1</td>
														</tr>


														<tr>

															<td rowspan="2">총무부</td>
														</tr>
														<tr></tr>
														<tr>

															<td>2023-10-12</td>
														</tr>


													</table>


												</div>


												<!-- 상단 오른쪽 end -->
												<!-- 상단 오른쪽 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered">

														<tr>
															<th rowspan="3" class="table-light">신청</th>
															<td>홍길동1</td>
														</tr>


														<tr>

															<td>총무부</td>
														</tr>
														<tr>

															<td>2023-10-12</td>
														</tr>


													</table>


												</div>


												<!-- 상단 오른쪽 end -->
												<!-- 상단 오른쪽 strart -->

												<div class="col-lg-2">
													<table class="table table-bordered">

														<tr>
															<th rowspan="3" class="table-light"><br>신<br>청</th>
															<td>홍길동1</td>
														</tr>


														<tr>

															<td>총무부</td>
														</tr>
														<tr>

															<td>2023-10-12</td>
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
															<td></td>
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
													<button type="submit" class="btn btn-primary btn-sm">결재
														요청</button>
													<button type="button" id="temp_send"
														class="btn btn-primary btn-sm">임시저장</button>
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
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Basic Modal</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
						
						<div class=row>
							<div class="col-sm-4">
						
							<div class="card border " id='readyMem'>
							123
							</div>
							
							</div>
							
							<div class="col-sm-4">
						
							<div class="card border">
							123
							</div>
							
							</div>
							
							<div class="col-sm-4">
					
							<div class="card border">
								123
							</div>
							
							<div class="card border">
								123
							</div>
							
							</div>
						
						</div>
							</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
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
		$('#temp_send').click(function() {

			$("#temp_save").val("Y");
			$("frm").submit();

		});
		$('#btnGetMem').click(function() {

			$.ajax({
				url:"/dept/getDeptInfo"
				,data:{}
				,dateType:"json"
				,cache:false
				,method:"post"
				,success:function(data){
					console.log(data);
					console.log(data.deptList);
					
				}
			});

		});
		
		
		
	</script>
</body>

</html>
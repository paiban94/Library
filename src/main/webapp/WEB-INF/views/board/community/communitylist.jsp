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
</head>
<style>
.dataTables_info{
	float: right;
	 margin-bottom: 30px;
	margin-right: 30px; 
	}
</style>
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

						<div class="container-fluid">


							<div class="row">
								<!-- 각 영역 크기조절하기 -->
								<div class="col-lg-12">
									<div class="card">
										<div class="">
											<table class="table datatable">
												<thead>
													<tr>
														<th  style="width: 10%;">NO</th>
														<th  style="width: 40%;">제목</th>
														<th  style="width: 20%;">작성자</th>
														<th  style="width: 15%;">날짜</th>
														<th  style="width: 15%;">조회수</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${list}" var="vo">
														<tr>
															<td scope="row">${vo.boardNo}</td>
															<td><a href="./communityDetail?boardNo=${vo.boardNo}">${vo.boardTitle}</a></td>
															<td>${vo.boardWriter}</td>
															<td>${vo.boardDate}</td>
															<td>${vo.boardHit}</td>
														</tr>
													</c:forEach>
												</tbody>
								
											</table>
											<!-- End Table with stripped rows -->
											<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
												<a href="./addCommunity" class="btn btn-primary btn-icon-split">
												  <span class="icon text-white-50">
													  <i class="fas fa-flag"></i>
												  </span>
												  <span class="text">글작성</span>
											   </a>
											  </div>
										</div>

									</div>
								</div>
							</div>
					</section>
			</div>
		</div>
	</div>

	</div>
	<!-- End Sales Card -->
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
</body>
</html>
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
.container-fluid {
	height: 800px;
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

						<div class="container-fluid">


							<div class="row">

								<div class="col-lg-6">
									<div class="card-body pb-0">
										<h5 class="card-title">최근 공지사항</h5>

										<table class="table table-borderless">
											<colgroup>
												<col style="width: 18%;">
												<col style="width: 45%;">
												<col style="width: 20%;">
												<col style="width: 17%;">
											</colgroup>
											<thead>
												<tr>
													<th class="board_no">번호</th>
													<th class="board_title">제목</th>
													<th class="reg_id">작성자</th>
													<th class="reg_date">작성날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="d" varStatus="i">
													<tr>
														<td>${d.board_no}
														</th>
														<td><a href="/board/annDetail?board_no=${d.board_no}">${d.board_title}</a>
														</td>
														<td>${d.board_wirter}</td>
														<td class="fw-bold">${d.reg_date}</td>
												</c:forEach>
												</tr>
										</table>

									</div>
								</div>


								<div class="col-lg-6">
									<div class="card-body pb-0">
										<h5 class="card-title">기안문서함</h5>

										<table class="table table-borderless">
											<colgroup>
												<col style="width: 18%;">
												<col style="width: 20%;">
												<col style="width: 45%;">
												<col style="width: 17%;">
											</colgroup>
											<thead>
												<tr>
											<thead>
												<th>기안일</th>
												<th>결재양식</th>
												<th>제목</th>
												<th>상태</th>
											</thead>
											</tr>
											</thead>
											<tbody>
												<c:forEach items="${ar}" var="d" varStatus="i">
													<tr>
														<th scope="row">${d.reg_date}</th>
														<td>${d.grp_cd}</td>
														<td><a
															href="/approval/draftDetail?k=com&doc_no=${d.doc_no}"
															class="text-primary fw-bold">${d.doc_title}</a></td>
														<td class="fw-bold">${d.approval_state}</td>
													</tr>
												</c:forEach>
										</table>

									</div>
								</div>

							</div>

						</div>

					</section>

				</main>
				<!-- End #main -->


				<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
				<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
</body>

</html>
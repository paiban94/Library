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
.card-body {
 	width: 60%;
    padding: 0 20px 20px 20px;
}
.box {
  width: 150px;
  height: 100px;
  background: lightskyblue;
  margin: 4px;
}

.fixed {
  position: fixed;
}

.top-right {
  	top: 10px;
	right: 10px;
}
<style>
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
								<div class="col-lg-6 box card-body fixed top-right">
									<!-- Recent Activity -->
									<div class="card">
										<div class="filter">
											<a class="icon" href="#" data-bs-toggle="dropdown"><i
												class="bi bi-three-dots"></i></a>
											<ul
												class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
												<li class="dropdown-header text-start">
													<h6>Filter</h6>
												</li>

												<li><a class="dropdown-item" href="#">Today</a></li>
												<li><a class="dropdown-item" href="#">This Month</a></li>
												<li><a class="dropdown-item" href="#">This Year</a></li>
											</ul>
										</div>

										<div class="card-body">
											<h5 class="card-title">
												 <span>결재 대기</span>
											</h5>

											<div class="activity">

												<div class="activity-item d-flex">
													<div class="activite-label">32 min</div>
													<i
														class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
													<div class="activity-content">
														Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo
															officiis</a> beatae
													</div>
												</div>
												<!-- End activity item-->
											</div>

										</div>
									</div>
									<!-- End Recent Activity -->
								</div>

							</div>
						</div>
			</div>

			</section>

			</main>
			<!-- End #main -->

			<div class="container-fluid">

				<div class="row">
					<!-- 각 영역 크기조절하기 -->
					<div class="col-lg-6">
						<div class="card">


							<div class=""></div>
						</div>

					</div>

					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

				</div>



				<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
</body>

</html>
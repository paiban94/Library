<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Insert title here</title>
					<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>

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
												<!-- 각 영역 크기조절하기 -->
												<div class="col-lg-12">
													<div class="card">
														
														<table class="table mt-5">
		
		<thead class="table-dark">
			 <th>ID</th><th>TITLE</th><th>DATE</th><th>HIT</th><th>HIT</th>
		</thead>
														<c:forEach items="${list}" var="d">
															<tr>
																<td>${d.reg_date}</td>
																<td><a class="text-decoration-none" href="./detail?boardNo=${d.doc_no}">${d.grp_cd}</a></td>
																<td>${d.doc_title}</td>
																<td>${d.doc_no}</td>
																<td>${d.approval_state}</td>
															</tr>
														</c:forEach>
														
															</tbody>
															</table>	
													</div>
												</div>

											</div>
										</div>	

							</div>

							</section>

							</main><!-- End #main -->



						</div>

					</div>

					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

					</div>



					<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
				</body>

				</html>
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


														<section class="container my-5 mx-auto"
															style="width: 70%; padding-top: 25px;">
															<div class="d-flex flex py-5 my-5">
																<div class="flex-fill">
																	<div
																		class="border-4 border-bottom border-dark-subtle">
																		<h3>${data.board_title}</h3>
																	</div>
																	<div class="pb-2 pt-1">
																		<span class=""
																			style="float: left;">${data.reg_date}</span>
																		<span class="date m_no"
																			style="float: right; width: 25%;">${data.reg_date}</span>
																	</div>
																	<br>
																	<div class="mt-2">
																		<article class="article article-borderless">
																			<div class="contents">
																				<p>${data.board_content}</p>
																			</div>
																		</article>
																	</div>
																</div>
															</div>

															<button id="likeButton" class="btn btn-primary"
																onclick="likeAnnouncement(${data.board_no})">좋아요</button>

															<!-- 게시글 좋아요 수 -->
															<div id="likeCount">${data.board_like}</div>

															<div class="mb-3 border-bottom ">
																<ul class="nav nav-underline">
																	<li class="nav-item"><a class="nav-link active fs-5"
																			id="review" data-target="review"
																			aria-current="page" href="#">댓글</a>
																	</li>
																</ul>
															</div>


															<form action="./addComment" method="post">
																<div id="reviewInfo" class="mb-5">
																	<div class="d-flex mb-5 pt-3">
																		<div class="col-sm-8">
																			<input type="hidden" name="board_no"
																				value="${data.board_no}">
																			<textarea name="comment_content"
																				id="comment_content"
																				class="form-control"
																				placeholder="댓글을 달아주세요"></textarea>
																		</div>
																		<div class="ms-3">
																			<button type="submit" id="reviewAdd"
																				class="btn btn-dark h-100"
																				style="background-color: var(--bs-btn-hover-bg);">등록</button>
																		</div>
																	</div>
																	<div id="reviewList" style="color: white;"></div>
																</div>
															</form>
															<div>
																<h2>댓글</h2>
																<c:forEach items="${comments}" var="comment">
																	<p>${comment.comment_content}</p>
																	<p>${comment.reg_date}</p>
																</c:forEach>
															</div>
														</section>



													</div>
												</div>

											</div><!-- End Sales Card -->
										</div>

							</div>

							</section>

							</main><!-- End #main -->



						</div>

					</div>

					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

					</div>



					<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
					<script>
						function likeAnnouncement(boardNo) {
							$.ajax({
								type: "POST",
								url: "/board/likeAnnouncement",
								data: {
									board_no: boardNo
								},
								success: function (response) {
									if (response === "success") {
										console.log(" like success!!");
										let likeCountElement = document.getElementById("likeCount_" + boardNo);

										
										let currentLikeCount = parseInt(likeCountElement.innerText);

										
										currentLikeCount++;
										likeCountElement.innerText = currentLikeCount;
									}
								},
								error: function () {
									// 에러 처리 로직
								}
							});
						}
					</script>
				</body>

				</html>
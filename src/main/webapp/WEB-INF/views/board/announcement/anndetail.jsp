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
																		<span class="" style="float: left;">${data.board_wirter}</span>
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

															<div>
																<button id="likeButton"
																	onclick="likeAnnouncement(${data.board_no})">좋아요</button>
																<button id="unlikeButton"
																	onclick="unlikeAnnouncement(${data.board_no})">좋아요
																	취소</button>
																<span id="likeCount">${data.board_like} 명이 이 글을 좋아합니다.</span>
															</div>
															<div id="logined">
																<input type="hidden" id="view" name="view" data-view="${ready}">
																<button id="modifyBtn" type="button" class="btn btn-primary btn-sm" data-val="${data.board_no}">수정</button>
																<button id="deleteBtn" type="button" class="btn btn-primary btn-sm" onclick="deleteBoard(${data.board_no})">삭제</button>
															</div>
															<button id="goList" type="button" class="btn btn-primary btn-sm">목록</button>
															<br>
															
															<div><span>첨부파일</span></div>
															<br>
															<br>
															<div class="row">
																<ul>
																	<c:forEach items="${files}" var="file">
																		<li>
																			<a href="./fileDown/${file.file_no}">${file.file_oriName}</a>
																		</li>
																	</c:forEach>
																</ul>
															</div>



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
																			<input type="hidden" name="reg_id"
																			value="${data.reg_id}">
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
																	<p>${comment.reg_id}</p>
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
					<script src="/js/anndetail.js"></script>
				</body>

				</html>
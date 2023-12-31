	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>My Page</title>
	<style>

		.profile-image {
   	  	 width: 300px; 
     	 height: 300px; 
    	}
	  </style>
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
				
							
					<div class="row" id="image" data-image="${photo.file_name}" data-ww="${ww}">
						<!-- 왼쪽 열: 프로필 이미지 -->
						<div class="col-lg-6">
						  <h1>마이 페이지</h1>
						  <br>
						  <form action="/member/update" method="post" enctype="multipart/form-data">
							<!-- 프로필 이미지 -->
							<div class="form-group">
							  <c:choose>
								<c:when test="${not empty profileImage and not empty profileImage.file_oriName}">
								  <img src="${filePath}" alt="프로필사진" class="rounded-circle profile-image">
								</c:when>
								<c:otherwise>
								  <img src="/assets/img/defalut_image.jpg" alt="프로필사진" class="rounded-circle profile-image">
								</c:otherwise>
							  </c:choose>
							</div>
							<br>
							
						</div>
						
						<!-- 오른쪽 열: 개인 정보 -->
						<div class="col-lg-6">
						  <div class="form-group">
							<br>
							<label for="name">이름</label>
							<input type="text" value="${memberVO.name}" name="name" class="form-control" readonly/>
						  </div>
						  <div class="form-group">
							<br>
							<label for="emp_no">사원번호</label>
							<input type="text" value="${memberVO.emp_no}" name="emp_no" class="form-control" readonly/>
						  </div>
						  <div class="form-group">
							<br>
							<label for="email">이메일</label>
							<input type="email" value="${memberVO.email}" name="email" class="form-control" readonly/>
						  </div>
						  <div class="form-group">
							<br>
							<label for="birth">생일</label>
							<input type="date" value="${memberVO.birth}" name="birth" class="form-control" readonly/>
						  </div>
						  <div class="form-group">
							<br>
							<label for="phone">전화번호</label>
							<input id="phone" type="tel" value="${memberVO.phone}" placeholder="010-1234-5678" name="phone" pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" class="form-control" readonly/>
						  </div>
						  <div class="form-group">
							<br>
							<label for="emp_team">부서</label>
							<input id="emp_team" type="text" value="${memberVO.emp_team}" class="form-control" readonly/>
						  </div>
						  <div class="form-group">
							<br>
							<label for="emp_position">직급</label>
							<input id="emp_position" type="text" value="${memberVO.emp_position}" class="form-control" readonly/>
						  </div>
						  
						 <div class="form-group">
							<br>
							<label for="remain_holiday">연차</label>
							<input id="remain_holiday" type="text" value="${memberVO.remain_holiday}" class="form-control" readonly/>
						  </div>
						 <br> 
						  <button type="submit" class="btn btn-primary" href="/member/update">정보수정</button>
						  </form>
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
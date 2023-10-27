<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
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
					<div class="col-lg-6">
						
				<form:form modelAttribute="memberVO" method="post" enctype="multipart/form-data">
    	 			  <div class="form-group">
    	 			  	<form:label path="name">이름</form:label>
					    <form:input id="name"  path="name" cssClass="form-control"/>
					    <form:errors path="name"></form:errors>
					  </div>
					  
					
					<div class="form-group">
						<br>
						<form:label path="password">비밀번호</form:label>
					    <form:password path="password" cssClass="form-control" id="password" aria-describedby="pwstyle"/>
						<small id="pwstyle" class="form-text text-muted">비밀번호는 6~12자 이며 소문자,특수문자,숫자를 하나 이상씩 넣어야합니다.</small>
					    <form:errors path="password"></form:errors>
					</div> 
				    <div class="form-group">
						<br>
					    <form:label path="passwordCheck">비밀번호확인</form:label>
					    <form:password path="passwordCheck" cssClass="form-control" id="passwordCheck"/>
					    <form:errors path="passwordCheck"></form:errors>
				    </div>
				    <div class="form-group">
						<br>
				    	<form:label path="email">이메일</form:label>
				    	<form:input id="email" type="email" path="email" cssClass="form-control"/>
				    	<form:errors path="email"></form:errors>
				    </div>

				    
				      <div class="form-group">
						<br>
    	 			  	<form:label path="birth">Birth</form:label>
					    <form:input id="birth" type="date" path="birth" cssClass="form-control"/>
					    <form:errors path="birth"></form:errors>
					  </div>	
					  
					  <div class="form-group">
						<br>
    	 			  	<form:label path="emp_in_date">입사일</form:label>
					    <form:input id="emp_in_date" type="date" path="emp_in_date" cssClass="form-control"/>
					    <form:errors path="emp_in_date"></form:errors>
					  </div>
				    	
			
					  <div class="form-group">
						<br>
						<label for="phone">전화번호</label>
						<input id="phone" type="tel" placeholder="010-1234-5678" name="phone" pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" class="form-control"/>
					</div>

						<div class="form-group">
							<br>
							<form:label path="emp_team">부서</form:label>
							<form:select id="emp_team" path="emp_team" cssClass="form-control">
								<form:option value="" label="부서 선택 시 클릭하세요" /> 
								<form:option value="M" label="운영과" />
								<form:option value="P" label="정책과" />
								<form:option value="S" label="서비스과" />
								<form:option value="N" label="미정" />
							</form:select>
							<form:errors path="emp_team"></form:errors>
						</div>
						
					
					    <div class="form-group">
						<br>
    	 			  	<form:label path="emp_position">직급</form:label>
					    <form:select id="emp_position"  path="emp_position" cssClass="form-control">
							<form:option value="" label="직급 선택 시 클릭하세요" /> 
							<form:option value="D" label="관장" /> 
							<form:option value="T" label="팀장" /> 
							<form:option value="A" label="주무관" /> 
							<form:option value="L" label="사서" /> 
						</form:select>
					    <form:errors path="emp_position"></form:errors>
					  </div>
				    
				    <div class="form-group">
						<br>
				    	<label for="proflie">프로필사진</label>
				    	<input type="file" name="proflie" class="form-control" id="proflie" aria-describedby="photoHelp">
				    	  <small id="photoHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				    </div>
					<br>
				 <button type="submit" class="btn btn-primary">회원가입</button>
					
					               <!-- Basic Modal -->
								   <!-- <button type="button" id="joinModal" class="btn btn-primary" data-id="${memberVO.emp_no}" data-bs-toggle="modal" data-bs-target="#basicModal">
									회원가입
								  </button>
							
								   <div class="modal fade" id="basicModal" tabindex="-1">
									<div class="modal-dialog">
									  <div class="modal-content">
										<div class="modal-header">
										  <h5 class="modal-title">사원번호</h5>
										  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
										
										</div>
										<div class="modal-footer">
										   <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" href="member/login">확인</button>
										</div>
									  </div>
									</div>
								  </div>
								  <script>
									$("#joinModal").click(function(e){
										var emo_no = $(this).data('id');
										$(".modal-body").text('당신의 사원번호는'+ emo_no +'입니다.');
									});
								
								  </script> -->



				</form:form>
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
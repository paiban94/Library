<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


			<div class="container">

				<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				  <div class="container">
					<div class="row justify-content-center">
					  <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
		  
						<div class="d-flex justify-content-center py-4">
						  <a href="index.html" class="logo d-flex align-items-center w-auto">
							<img src="assets/img/logo.png" alt="">
							<span class="d-none d-lg-block">NiceAdmin</span>
						  </a>
						</div><!-- End Logo -->
						<form:form modelAttribute="memberVO" method="post" enctype="multipart/form-data">
						<div class="card mb-3">
							
						  <div class="card-body">
		  
							<div class="pt-4 pb-2">
							  <h5 class="card-title text-center pb-0 fs-4" style="font-weight: bold;">로그인</h5>
							  <p class="text-center small">사원번호와 비밀번호를 입력하세요.</p>
							</div>
		  
							<form class="row g-3 needs-validation" novalidate>
		  
							  <div class="col-12">
								<label for="yourUsername" class="form-label">사원번호</label>
								<div class="input-group has-validation">
								  <input type="text" name="username" class="form-control" id="yourUsername" required>
								  <div class="invalid-feedback">사원번호를 입력하세요.</div>
								</div>
							  </div>
		  
							  <div class="col-12">
								<label for="yourPassword" class="form-label">비밀번호</label>
								<input type="password" name="password" class="form-control" id="yourPassword" required>
								<div class="invalid-feedback">비밀번호를 입력하세요.</div>
							  </div>
		  
							  <!-- <div class="col-12">
								<div class="form-check">
								  <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
								  <label class="form-check-label" for="rememberMe">Remember me</label>
								</div>
							  </div> -->
							  <!-- 가운데 정렬 -->
							  <div class="col-12">
								<button class="btn btn-primary w-100" type="submit">Login</button>
							  </div>
							  <div class="col-12 text-center">
								<span class="small mb-0"><a href="pages-register.html">사원번호 찾기</a></span>&nbsp|&nbsp
								<span class="small mb-0"><a href="pages-register.html">비밀번호 찾기</a></span>&nbsp|&nbsp
								<span class="small mb-0"><a href="pages-register.html">회원가입</a></span>  
							</div>
							</form>
		  
						  </div>
						</div>
						</form:form>
					
					  </div>
					</div>
				  </div>
		  
				</section>
		  
			  </div>
			
			</div>
	
			

		  </main><!-- End #main -->	

    	 		 
    	 	
    	 	</div>
			 
		</div>
    	
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import> 
    
	</div>
    
    

<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
</body>
</html>
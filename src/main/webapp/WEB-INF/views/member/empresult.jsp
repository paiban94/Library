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


			
			<section class="section dashboard">

			<div class="container-fluid">
			
				<div class="col-12 text-center"> <!-- 가운데 정렬 -->
					<div class="card mx-auto mb-3" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">사원번호</h5>
							<p class="card-text">당신의 사원번호는 ${FindEmpNo.emp_no}입니다.</p>
						</div>
					</div>
					<button class="btn btn-primary btn-sm" type="button" onclick="location.href='/member/login'">확인</button>
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
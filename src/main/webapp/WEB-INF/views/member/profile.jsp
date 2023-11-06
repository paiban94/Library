<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
                        <h1>마이 페이지</h1>
						
				<form action="/member/update" method="post" enctype="multipart/form-data">		  
					

                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" value="${memberVO.name}" name="name" class="form-control" readonly/>
					  </div>
					  
                    


                    <div class="form-group">
						<br>
				    	<label for="photo">프로필사진</label>
				    	<input type="file" name="photo" class="form-control" id="photo">
				    </div>
					<br>
                    <div class="form-group">
						<br>
				    	<label for="photo">서명이미지</label>
				    	<input type="file" name="sign" class="form-control" id="sign" >
				    </div>
					<br>
					  
                    
                    
                    
                    
				    
                   
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
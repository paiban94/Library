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
                        <h1>개인 정보 수정</h1>
						
				<form:form modelAttribute="memberVO" method="post" action="/member/adminUpdate" enctype="multipart/form-data">  
					
			

				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" value="${memberVO.name}" name="name" class="form-control" readonly/>
				  </div>
				  <br>
				
						<div class="form-group">	
							<label for="emp_no">사원번호</label>
							<input type="text" value="${memberVO.emp_no}" name="emp_no" class="form-control" readonly/>
						</div>
				
				

					<div class="form-group">
						<br>
				    	<form:label path="email">이메일</form:label>
				    	<form:input  value="${memberVO.email}" id="email" type="email" path="email" cssClass="form-control"/>
				    	<form:errors path="email"></form:errors>
				    </div>

					  
				
					
					<div class="form-group">
						<br>
						<label for="phone">전화번호</label>
						<input id="phone" type="tel" value="${memberVO.phone}" placeholder="010-1234-5678" name="phone" pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" class="form-control"/>
					</div>

					
					<div class="form-group">
						<br>
						<label for="emp_in_date">입사일</label>
						<input id="emp_in_date_display" type="text" class="form-control" value="${memberVO.emp_in_date}" readonly="true"/>
					</div>
					
                    <div class="form-group">
						<br>
						<form:label path="emp_out_date">퇴사일</form:label>
						<form:input id="emp_out_date" type="date" path="emp_out_date" cssClass="form-control"/>
						<form:errors path="emp_out_date"></form:errors>
					</div>
                    
					<div class="form-group">
						<br>
						<form:label path="emp_team">부서</form:label>
						<form:select name="selectTeam" id="emp_team" path="emp_team" cssClass="form-control">
							<form:option value="" label="부서 선택 시 클릭하세요" />
							<form:option value="A" label="대표" />
							<form:option value="B" label="운영과" />
							<form:option value="C" label="정책과" />
							<form:option value="D" label="서비스과" />
							<form:option value="E" label="미정" />
						</form:select>
						<form:errors path="emp_team"></form:errors>
					</div>
					
					<div class="form-group">
						<br>
						<form:label path="emp_position">직급</form:label>
						<form:select name="selectPosition" id="emp_position" path="emp_position" cssClass="form-control">
							<form:option value="" label="직급 선택 시 클릭하세요" /> 
							<form:option value="A" label="관장" /> 
							<form:option value="B" label="팀장" /> 
							<form:option value="C" label="주무관" /> 
							<form:option value="D" label="사서" /> 
						</form:select>
						<form:errors path="emp_position"></form:errors>
					</div>
					
						


					<br>
				  <button type="submit" class="btn btn-primary">수정하기</button> 
						
						
									
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
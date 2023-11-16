<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
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
                        <h1>사원 수정</h1>
						
                        <table class="table">
                            <thead>
                                <tr id="sector">
                                    <th scope="col">사원번호</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">부서</th>
                                    <th scope="col">직급</th>
                                    <th scope="col">전화번호</th>
                                </tr> 
                            </thead>
                            <tbody>
                                <c:forEach items="${adminMemList}" var="memberVO">
                                    <tr>
                                        <td>${memberVO.emp_no}</td>
                                        <td><a href="/member/adminDetailPage?emp_no=${memberVO.emp_no}">${memberVO.name}</a></td>
                                        <td>${memberVO.emp_team}</td>
                                        <td>${memberVO.emp_position}</td>
                                        <td>${memberVO.phone}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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

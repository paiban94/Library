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
                        <h1>관리자 기능</h1>
                        
                        <table class="table">
                            <thead>
                                <tr id="sector">
                                    <th scope="col">수정목록</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                            
                                    <tr>
                                        <td><button class="btn btn-primary w-50" type="button" onclick="location.href='/member/adminMemberPage'">사원목록</button></td>
                                    </tr>
                          
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

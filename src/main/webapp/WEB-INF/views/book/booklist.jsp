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
<style type="text/css">
.add-btn{width:80px;
position:relative;
left:905px;
top:20px}
.del-btn{width:80px;
position:relative;
left:1000px;
top:-10px}
.card{width:1400px}
.col-lg-6 {width:1400px }
.tg  {border-collapse:collapse;border-spacing:0;width:1080px}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
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
						<div class="card">
						
						<h1>도서목록</h1>
						
						<button type="submit" class="add-btn">추가</button>
						<button type="submit" class="del-btn">폐기</button>
						
						<table class="tg">
							<thead>
							  <tr>
							    <th class="tg-0lax">선택</th>
							    <th class="tg-0lax">도서번호</th>
							    <th class="tg-0lax">도서명</th>
							    <th class="tg-0lax">저자명</th>
							    <th class="tg-0lax">발행처</th>
							    <th class="tg-0lax">입고일</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
							    <td class="tg-0lax"></td>
							    <td class="tg-0lax"></td>
							    <td class="tg-0lax"></td>
							    <td class="tg-0lax"></td>
							    <td class="tg-0lax"></td>
							    <td class="tg-0lax"></td>
							   </tr>
							</tbody>
							</table>
						<div class=""></div>
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
</body>
</html>
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
.update-btn{width:80px;
	position:relative;
	left:1110px;
	top:90px;
	}
.add-btn{width:80px;
position:relative;
left:900px;
top:30px}
.del-btn{width:80px;
position:relative;
left:1000px;
top:0px}
.title{
text-align:center;
}
.card{width:1400px}
.hstack{width:1100px}
.col-lg-6 {width:1400px }
.tg  {border-collapse:collapse;border-spacing:0;width:1100px}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
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
						
						<h1 class="title">공용품리스트</h1>
						
						  <div class="hstack gap-3 text-decoration-underline">
								  <div class="p-1">전체</div>
								  <div class="p-2">시설</div>
								  <div class="p-3">공용품</div>
								 </div>
						
						<button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addFacilityModal">추가</button>
													<!-- Modal -->
						<form id="addForm" action="./add" method="post">
							<div class="modal fade" id="addFacilityModal" tabindex="-1" aria-labelledby="addFacilityModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="addFacilityModalLabel">공용품추가</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							       <label for="taskId" class="col-form-label">종류구분</label>
                        				<input type="text" class="form-control" id="grp_cd" name="grp_cd">
							        <label for="taskId" class="col-form-label">공용품명</label>
                        				<input type="text" class="form-control" id="facility_name" name="facility_name">
							        <label for="taskId" class="col-form-label">상세내용</label>
                        				<input type="text" class="form-control" id="facility_contents" name="facility_contents">
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary" id="addFacility">추가</button>
							      </div>
							    </div>
							  </div>
							</div>
							</form>
						<button type="submit" class="del-btn">삭제</button>
						
						
						<table class="tg">
							<thead>
							  <tr>
							    <th class="tg-0pky">선택</th>
							    <th class="tg-0pky">공용품번호</th>
							    <th class="tg-0pky">공용품이미지</th>
							    <th class="tg-0pky">공용품이름</th>
							    <th class="tg-0pky">상세내용</th>
							  </tr>
							</thead>
							<tbody>
							<div>
							  <tr>
							  <c:forEach items="${list}" var="list">
							    <td class="tg-0pky">
							    <div class="input-group mb-3">
								  <div class="input-group-text">
								    <input class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input">
								  </div>
							    </td>
							    <td class="tg-0pky"></td>
							    <td class="tg-0pky"></td>
							    <td class="tg-0pky"></td>
							    <td class="tg-0pky"></td>
							  <button type="button" class="update-btn" data-bs-toggle="modal" data-bs-target="#updateFacilityModal">수정</button>
													<!-- Modal -->
						<form id="updateForm" action="./update" method="post">
							<div class="modal fade" id="updateFacilityModal" tabindex="-1" aria-labelledby="updateFacilityModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="updateFacilityModalLabel">공용품수정</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							       <label for="taskId" class="col-form-label">종류구분</label>
                        				<input type="text" class="form-control" id="grp_cd" name="grp_cd">
							        <label for="taskId" class="col-form-label">공용품명</label>
                        				<input type="text" class="form-control" id="facility_name" name="facility_name">
							        <label for="taskId" class="col-form-label">상세내용</label>
                        				<input type="text" class="form-control" id="facility_contents" name="facility_contents">
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary" id="updateFacility">추가</button>
							      </div>
							    </div>
							  </div>
							</div>
							</form>
							</c:forEach>
							  </tr>
							</div>
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
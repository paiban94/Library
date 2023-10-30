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
<style>
.btn-danger{
    float: right;
	 margin-bottom: 30px;
	margin-right: 30px; 
}
.btn-secondary{
    float: right;
	 margin-bottom: 30px;
	margin-right: 10px; 
}
.col-sm-12{
    text-align: center;
}
.col-sm-8{
 margin-left: 17%;
 margin-top: 5%;
}

</style>
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

                        <div class="row col-sm-8">
                            <h2 class="font-weight-bold text-primary heading">공지사항</h2>
                        </div>
								
                            <div class="row col-sm-8">
                                <form action="addAnn" method="post" enctype="multipart/form-data">
                                  <!--  <sec:csrfInput/>-->
                                    <div class="mb-3">
                                        <label for="board_title" class="form-label">Title</label>
                                        <input type="text" class="form-control" name="board_title" id="board_title" placeholder="제목을 입력하세요">
                                    </div>
                                    <div class="mb-3">
                                        <label for="board_writer" class="form-label">Writer</label>
                                        <input type="text" class="form-control" name="board_writer" id="board_writer" value="${member.name}" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="board_contents" class="form-label">Contents</label>
                                        <textarea class="form-control" id="board_contents" name="board_contents" rows="17"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <input type="file" class="form-control" name="files">
                                    </div>
                                    <div class="mb-3">
                                        <input type="file" class="form-control" name="files">
                                    </div>
                                    <button class="btn btn-danger">등록</button>
                                    <button class="btn btn-secondary">취소</button>
                                </form>
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
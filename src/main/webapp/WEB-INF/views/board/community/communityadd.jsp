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
			
						
				<div class="row">
					<!-- 각 영역 크기조절하기 -->
					<div class="col-lg-12">
                        <div class="row col-sm-12">
                          <form action="add" method="post" enctype="multipart/form-data">
                            <!--  <sec:csrfInput/>-->
                              <div class="mb-3">
                                  <label for="boardTitle" class="form-label">Title</label>
                                  <input type="text" class="form-control" name="boardTitle" id="boardTitle" placeholder="제목을 입력하세요">
                              </div>
                              <div class="mb-3">
                                  <label for="boardWriter" class="form-label">Writer</label>
                                  <input type="text" class="form-control" name="boardWriter" id="boardWriter">
                              </div>
                              <div class="mb-3">
                                  <label for="boardContents" class="form-label">Contents</label>
                                  <textarea class="form-control" id="boardContents" name="boardContents" rows="3"></textarea>
                              </div>
                              <div class="mb-3">
                                  <input type="file" class="form-control" name="files">
                              </div>
                              <div class="mb-3">
                                  <input type="file" class="form-control" name="files">
                              </div>
                              <button class="btn btn-danger">Add</button>
                              </form>
                            </div>
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
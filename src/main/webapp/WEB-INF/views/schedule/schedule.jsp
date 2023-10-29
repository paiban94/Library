<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@page import="java.util.List"%>
<%@page import="com.lib.fin.schedule.ScheduleVO"%>
<%@page import="java.util.ArrayList"%>

<%
List<ScheduleVO> list=(ArrayList<ScheduleVO>)request.getAttribute("getSchedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import> 
<meta charset='utf-8'>
	
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>calendar</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- fullcalendar -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>


   <script type="text/javascript">
		const arr = new Array();
		
		function timeFormat(time){
		      return String(time).padStart(2, "0");
		   }
		
		$.ajax({
			  type: "GET", 
			  url: "/schedule/schedule",
			  async: false,
			  success: function (res) {
			    for (const key in res) {
			      let obj = new Object();
			      
			      obj.title = res[key].schedule_tilte;
			      
			      obj.start_time = res[key].schedule_start_time;
			      
			      obj.end_time = res[key].schedule_end_time;
			      
			      obj.schedule_no = res[key].schedule_no;
			      
			      obj.emp_no = res[key].emp_no;

			      obj.schedule_contents = res[key].schedule_contents;
			      
			      obj.schedule_kind = res[key].schedule_kind;
			      
			      arr.push(obj);
			    }
			    console.log(arr);
			
			  },
			  error: function (XMLHttpRequest, textStatus, errorThrown) {
			    console.log('error')
			  },
			});


	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      locale: "ko",
	      timeZone: 'Asia/Seoul',
	      initialView: 'dayGridMonth',
	      selectable: true,
	      select: function(){
	    	  $("#calendarAddModal").modal("show");
	    	  
	   
	    	  
	    	  $('#sprintSettingModalClose').click(function(){
	    			$('#calendarAddModal').modal('hide')	
	    		})
	    		
	      },
	      
	      customButtons: {
	    	    myCustomButton: {
	    	      text: '일정 추가',
	    	      click: function() {
	    	    	  $("#calendarAddModal").modal("show");
	    	    	  
	    	    
	    	    		
	    	    	  $('#sprintSettingModalClose').click(function(){
	    	    			$('#calendarAddModal').modal('hide')	
	    	    		})
	    	    	  
	    	      }
	    	    }
	    	  },
	    	    	  
	      headerToolbar: {
	    	    left: '',
	    	    center: 'prev,title,next',
	    	    right: 'myCustomButton'
	    	  },
	    	  
	      buttonText:{
	    	  
	    	 
	      },
	      
	      
	      
        	events:arr,
        	
        	
	    	  
	    });
	    calendar.render();
	  });
	
	
	
		

	</script>
    <style>
        #calendarBox{
            width: 70%;
            padding-left: 15%;
            width:1000px;
        }
		.calendar{
		width:1000px;	
		}
		.card{
		width:1200px;
		height:850px;	
		}
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
						  <div id="calendarBox">
						       <div class="hstack gap-3 text-decoration-underline">
								  <div class="p-1">전체</div>
								  <div class="p-2">일정</div>
								  <div class="p-3">예약</div>
								</div>
        <div id="calendar"></div>
    </div>
 <!------------------------------------------------- Add modal ------------------------------------------------->
 <div class="modal fade" id="calendarAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" onclick="location.href='/schedule/schedule'">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./add" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<input type="hidden" value="memberVO.emp_no">
                    	
                    					
                        <label for="taskId" class="col-form-label">일정시작일</label>
                        <input type="date" class="form-control" id="schedule_start_time" name="schedule_start_time">
                        
                        <label for="taskId" class="col-form-label">일정종료일</label>
                        <input type="date" class="form-control" id="schedule_end_time" name="schedule_end_time">
                        
                        <label for="taskId" class="col-form-label">일정 종류</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="schedule_content" name="schedule_kind">
						  <option selected>일정종류을 선택하세요</option>
						  <option value="1">연차</option>
						  <option value="2">회의</option>
						  <option value="3">교육</option>
						  <option value="4">외근</option>
						  <option value="5">출장</option>
						</select>
						
                        <label for="taskId" class="col-form-label">일정제목</label>
                        <input type="text" class="form-control" id="schedule_title" name="schedule_title">
                        
                        
                        <label for="taskId" class="col-form-label">일정내용</label>
                        <textarea class="form-control" id="schedule_contents" name="schedule_contents"></textarea>
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose" onclick="location.href='/schedule/schedule'">취소</button>
                </div>
    			</form>
            </div>
        </div>
    </div>
<!------------------------------------------------- Add modal ------------------------------------------------->
    			
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
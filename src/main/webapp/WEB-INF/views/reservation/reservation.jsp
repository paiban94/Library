<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@page import="java.util.List"%>
<%@page import="com.lib.fin.schedule.ScheduleVO"%>
<%@page import="java.util.ArrayList"%>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import> 
	
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
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

   
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
		.fc .fc-daygrid-day-number {
    position: relative;
    z-index: 4;
    padding: 4px;
    color: black;
  }
   .fc-prev-button{
  position:relative;
  top:35px;
  left:-50px;
  }
  .fc-next-button{
  position:relative;
  top:-37px;
  left:170px;
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
								  
								  <a href="/schedule/getSchedule">일정</a>
								  <a href="/reservation/getReservation">예약</a>
								</div>
						        <div id="calendarR"></div>
						    </div>
 <!------------------------------------------------- Add modal ------------------------------------------------->
 <div class="modal fade" id="addReservationModal" tabindex="-1" role="dialog" aria-labelledby="addReservationModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addReservationModalLabel">예약추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" onclick="location.href='/schedule/getSchedule'">&times;</span>
                    </button>
                </div>
                
                <form id="addForm" action="./add" method="post">
                <div class="modal-body">
                    <div class="form-group">
                    	<input type="text" class="form-control" value="${member.emp_no}" name="emp_no" id="emp_no">
                    					
                        <label for="taskId" class="col-form-label">예약시작일</label>
                        <input type="date" class="form-control" id="res_start_time" name="res_start_time">
                        
                        <label for="taskId" class="col-form-label">예약종료일</label>
                        <input type="date" class="form-control" id="res_end_time" name="res_end_time">
                        
                        <label for="taskId" class="col-form-label">예약 종류</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="grp_cd" name="grp_cd">
						  <option selected>예약종류을 선택하세요</option>
						  <option value="R001">회의실</option>
						  <option value="R002">빔프로젝트2</option>
						  <option value="R003">노트북</option>
						</select>
						<label for="taskId" class="col-form-label">예약상세종류</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="cd" name="cd">
						  <option selected>예약종류을 선택하세요</option>
						  <option value="A">1</option>
						  <option value="B">2</option>
						  <option value="C">3</option>
						</select>
							                     
                        <label for="taskId" class="col-form-label">사용목적</label>
                        <textarea class="form-control" id="res_purpose" name="res_purpose"></textarea>
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addReservation">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose" onclick="location.href='/reservation/getReservation'">취소</button>
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
<script type="text/javascript">

		
var obj = ${List};
const arr = new Array();
const res = arr.keys();
function timeFormat(time){
      return String(time).padStart(2, "0");
   }

 $.ajax({
        url: "/reservation/reservation",
        data: "json",
        processData: false,    // 필수
        contentType: false,    // 필수
        method: "get",
        cache: false,
        enctype: 'resultMap',
        dataType: "json",
        success: function (data) {
            console.log(data);
            if (data.success === "Y") {
                $("#reservation_no").val(data.reservation_no);
                $("#res_start_time").val(data.res_start_time);
                $("#res_end_time").val(data.res_end_time);
                console.log(data.reservation_no);
               
            } else {
                alert("잠시 후 다시 시도해주세요.");
            }
        },
        error: function (error) {
            console.log("Error:", error);
        }
    });
		/*
		$.ajax({
			  type: "GET", 
			  url: "/schedule/scheduleList",
			  async: false,
			  success: function (res) {
			   
			    console.log(res);
			    
			    
			
			  },
			  error: function (XMLHttpRequest, textStatus, errorThrown) {
			    console.log('error')
			  }
			});
*/

	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendarR');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	 
	    	locale: "ko",
	      timeZone: 'Asia/Seoul',
	      initialView: 'dayGridMonth',
	      navLinks:true,
	      eventLimit:true,
	    
	      
	      
	      customButtons: {
	    	  myResButton:{
	    		  text:'예약추가',
	    		click: function() {
		    	    $("#addReservationModal").modal("show");
		    	    	  
		    	    
		    	    		
		    	   $('#sprintSettingModalClose').click(function(){
		    	    $('#addReservationModal').modal('hide')	
		    	    })
		    	 }
	    	}
	      },
	    	    	  
	      headerToolbar: {
	    	    left: '',
	    	    center: 'prev,title,next',
	    	    right: 'myResButton'
	    	  },
	    	  
	      
	      
        	events:[
        		{
        			title:'test',
        			start:'2023-11-01',
        			end:'2023-11-01'
        			
        		}
        		
        	]
        
        	
        	
	    	  
	    });
	    
	    calendar.render();
	  });
	
	
	
		

	</script>
</body>
</html>
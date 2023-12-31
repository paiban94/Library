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
                    	<input type="hidden" class="form-control" value="${memberVO.emp_no}" name="emp_no" id="emp_no">
						<input type="hidden" class="form-control" value="${memberVO.emp_no}" name="red_id" id="red_id">
                    					
                        <label for="taskId" class="col-form-label">예약시작일</label>
                        <input type="date" class="form-control" id="res_start_time" name="res_start_time">
                        
                        <label for="taskId" class="col-form-label">예약종료일</label>
                        <input type="date" class="form-control" id="res_end_time" name="res_end_time">
                        
                        <label for="taskId" class="col-form-label">예약 종류</label>
                        <select class="form-select form-select-sm" aria-label="Small select example" id="grp_cd" name="grp_cd">
						  <option selected>예약종류을 선택하세요</option>
						  <option value="R001">회의실</option>
						  <option value="R002">빔프로젝트</option>
						  <option value="R003">노트북</option>
						</select>
						<label for="taskId" class="col-form-label">상세 종류</label>
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

	var resListJson;
		const arr = new Array();
		const res = arr.keys();
		function timeFormat(time){
		      return String(time).padStart(2, "0");
		   }

		   $(document).ready(function(){
	            $.ajax({
	                url: "/reservation/reservationList",
	                data: {"EMP_NO":"${emp_no}"},
	                method: "post",
	                cache: false,
	                dataType: "text",
	                success: function (data) {

	                    var test = JSON.parse(data);
	                    resListJson=test.list;
	                    console.log(resListJson);

	    var calendarEl = document.getElementById('calendarR');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	 
	    	locale: "ko",
	      timeZone: 'Asia/Seoul',
	      initialView: 'dayGridMonth',
	      navLinks:true,
	      eventLimit:true,
	      editable:true,
	      dayMaxEvents: 1,
	      
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
	    	  
	      
	      
        	events:resListJson,
        	eventDrop: function (info){
            	console.log(info);
            	if(confirm(""+ info.event.title+"'일정을 수정하시겠습니까?")){
            		
            	}
            	 var events = new Array();
                 var obj = new Object();

                 obj.title = info.event._def.title;
                 obj.start = info.event._instance.range.start;
                 obj.end = info.event._instance.range.end;
                 events.push(obj);

                 console.log(events);
                 $(function deleteData() {
                     $.ajax({
                         url: "/schedule/schedulelist",
                         method: "PATCH",
                         dataType: "json",
                         data: JSON.stringify(events),
                         contentType: 'application/json',
                     })
                 })
            },
            eventClick: function (info){
                if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까 ?")){
                   
                    info.event.remove();
                }

                console.log(info.event);
                var events = new Array();
                var obj = new Object();
                    obj.title = info.event._def.title;
                    obj.start = info.event._instance.range.start;
                    events.push(obj);

                console.log(events);
                $(function deleteData(){
                    $.ajax({
                        url: "/schedule/schedulelist",
                        method: "DELETE",
                        dataType: "json",
                        data: JSON.stringify(events),
                        contentType: 'application/json',
                    })
                })
            },

			
        
        	
        	
	    	  
	    });
	    
	    calendar.render();
	          },
	          error: function (error) {
	              console.log("Error:", error);
	          }
	       });
	  });
	
	
	
		

	</script>
</body>
</html>
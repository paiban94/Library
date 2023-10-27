<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<%@page import="java.util.List"%>
<%@page import="com.lib.fin.schedule.ScheduleVO"%>
<%
List<ScheduleVO> list=(ArrayList<ScheduleVO>)request.getAttribute("showSchedule");
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
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                timeZone: 'UTC',
                initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                selectable:true,
                events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                    {
                        title:'일정',
                        start:'2023-10-26 00:00:00',
                        end:'2023-10-27 24:00:00' 
                        // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                    },
                	{
                		title:'test',
                		start:'2023-10-28 00:00:00',
                		end:'2023-10-30 00:00:00'
                	},
                	<%for(int i =0;i<list.size(); i++){
                		ScheduleVO scheduleVO = (ScheduleVO)list.get(i);
                	%>
                	{
                    	title : '<%=scheduleVO.getSchedule_title()%>',
                        start : '<%=scheduleVO.getSchedule_start_time()%>',
                        end : '<%=scheduleVO.getSchedule_end_time()%>',
                         },
        	<%
            }
        %>
                    
                ], headerToolbar: {
                    left:'',
                    center: 'prev,title,next',// headerToolbar에 버튼을 추가
                    right:'addEventButton,addEventButton2'
                },customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "일정 추가",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                            $("#calendarModal").modal("show"); // modal 나타내기

                            $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                                var schedule_contents = $("#schedule_content").val();
                                var schedule_start_date = $("#schedule_start_date").val();
                                var schedule_end_date = $("#schedule_end_date").val();
                                var schedule_title = $("#schedule_title").val();
                                var schedule_kind = $("#schedule_kind").val();
                                
                                //내용 입력 여부 확인
                              
                                if(schedule_start_date == "" || schedule_end_date ==""){
                                    alert("날짜를 입력하세요.");
                                }else if(new Date(schedule_end_date)- new Date(schedule_start_date) < 0){ // date 타입으로 변경 후 확인
                                    alert("종료일이 시작일보다 먼저입니다.");
                                }else if(schedule_title == null || schedule_title ==""){
                                	alert("제목을 입력하세요")
                                }else if(schedule_kind == null || schedule_kind == ""){
                                	alert("일정종류를 선택하세요")
                                }else{ // 정상적인 입력 시
                                    var obj = {
                                        "schedule_contents" : schedule_contents,
                                        "schedule_start_time" : schedule_start_time,
                                        "schedule_end_time" : schedule_end_time,
                                        "schedule_title" : schedule_title,
                                        "schedule_kind" : schedule_kind
                                       
                                    }//전송할 객체 생성

                                    console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                                }
                                addEventButton2: {
                					text: '예약추가',
                					click: function() {
                						alert('예약추가');
                					    }
                					  }
                					,
                            });
                        }
                    }
                },
                editable: true, // false로 변경 시 draggable 작동 x 
                displayEventTime: false // 시간 표시 x
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

    <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="schedule_start_date" name="schedule_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="schedule_end_date" name="schedule_end_date">
                        <label for="taskId" class="col-form-label">일정 종류</label>
                        <select class="form-control" id="schedule_kind" name="schedule_kind">
                        	<option disabled>일정종류를 선택하세요</option>
                        	<option value="A">연차</option>
                        	<option value="B">회의</option>
                        	<option value="c">교육</option>
                        	</select>
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control" id="schedule_title" name="schedule_title">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <textarea class="form-control" id="schedule_contents" name="schedule_contents"></textarea>
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-warning" id="addSchedule">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose" onclick="location.href='/schedule/calendar'">취소</button>
                </div>
    
            </div>
        </div>
    </div>
						
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
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
<style>
.col-lg-6{
width:300px;
height:400px;
}
.card{
width:300px;
height:400px;
}
.div-padding{
position:relative;
top:-400px;
left:300px;
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
						<table id="home-work-tbl">
                            <thead>
                                <tr>
                                    <th colspan="2">
                                        <h4 class="text-left font-bold">근태관리</h4>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="year" colspan="2" class="font-14">clock</td>
                                </tr>
                                <tr>
                                    <td colspan="2" id="clock" style="color:black;">clock</td>
                                </tr>
                                <tr>
                                    <td class="font-14 font-bold">업무상태</td>
                                    <td class="text-right font-14 color-red font-bold" id="work-state">출근전</td>
                                </tr>            
                                <tr>
                                    <td class="font-14 font-bold">출근시간</td>
                                    <td class="text-right font-14" id="startwork-time">미등록</td>
                                </tr>
                                <tr>
                                    <td class="font-14 font-bold">퇴근시간</td>
                                    <td class="text-right font-14" id="endwork-time">미등록</td>
                                </tr>
                                <tr>
                                    <td class="font-14 font-bold">주간 누적 근무시간</td>
                                    <td class="text-right font-14" id="totalwork-time">0h 0m 0s</td>
                                </tr>
                                <tr class="btn-tr">
                                    <td><button class="font-bold" id="btn-startwork">출근하기</button></td>
                                    <td class="text-right"><button class="font-bold" id="btn-endwork">퇴근하기</button></td>
                                </tr>
                            </tbody>
                        </table>
						<div class=""></div>
						</div>
					</div>
					<div class="div-padding">
                        <div id="date-box">
                            <h4>
                                <button id="prev-btn"><i class="fa-solid fa-chevron-left"></i></button>
                                <span id="date-text">2023.03</span>
                                <button id="next-btn"><i class="fa-solid fa-chevron-right"></i></button>
                            </h4>
                        </div>

                        <div id="work-week-container">
                            <div id="work-week-time">
                                <div>
                                    <p class="font-14">이번주 누적</p>
                                    <h4 class="main-color" id="main-totalwork-time">0h 0m 0s</h4>
                                </div>
                                <br>
                                <div>
                                    <p class="font-14">이번주 초과</p>
                                    <h4 class="main-color" id="main-week-over-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번주 잔여</p>
                                    <h4 class="main-color" id="main-work-time">40h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번달 누적</p>
                                    <h4 class="color-gray" id="main-month-work-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번달 연장</p>
                                    <h4 class="color-gray" id="main-month-over-time">0h 0m 0s</h4>
                                </div>
                            </div>
                        </div>

                        <div id="work-info-container"></div>

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
<script>
    window.addEventListener('load', function(){
        
        getStartAndEndDateOfWeek();
        
        const csrfHeader = "${_csrf.headerName}";
        const csrfToken = "${_csrf.token}";
        const headers = {};
        headers[csrfHeader] = csrfToken;
        
        $.ajax({
            url : 'attendance/attendanceHome',
            contentType : "application/json; charset=utf-8",
            success(data){
                console.log(data);
                if(data){
                    const {no,startWork,endWork,overtime,regDate,state,dayWorkTime,empId} = data;
                    var starttime = new Date(startWork);
                    var endtime = new Date(endWork);
                    
                    //하루 근무시간 계산
                    const daytimes = endtime - starttime; //퇴근시간 - 출근시간
                    console.log(daytimes);
                    
                    const workState = document.querySelector("#work-state");
                    workState.textContent = state;
                    
                    
                    if(startWork){
                      var hours = (starttime.getHours()); 
                     var minutes = starttime.getMinutes();
                     var seconds = starttime.getSeconds();
                     var startWorkTime = `\${hours < 10 ? '0' + hours : hours}:\${minutes < 10 ? '0'+minutes : minutes}:\${seconds < 10 ? '0'+seconds : seconds}`;
                     // 출근시간 정보 출력
                     document.querySelector('#startwork-time').textContent = startWorkTime;
                    }
                    
                    if(endWork){
                        var hours = (endtime.getHours()); 
                      var minutes = endtime.getMinutes();
                      var seconds = endtime.getSeconds();
                      var endWorkTime = `\${hours < 10 ? '0' + hours : hours}:\${minutes < 10 ? '0'+minutes : minutes}:\${seconds < 10 ? '0'+seconds : seconds}`;
                      // 퇴근시간 정보 출력
                       document.querySelector('#endwork-time').textContent = endWorkTime;
                    }
                    
                    if(daytimes > 0){
                        //하루 근무시간 update
                       updateDayWorkTime(daytimes);
                    }
                }
            },
            error : console.log
        });
       
    });
    
    
    
    //출근 버튼 클릭 시
    document.querySelector('#btn-startwork').addEventListener('click', function () {
        
        const csrfHeader = "${_csrf.headerName}";
        const csrfToken = "${_csrf.token}";
        const headers = {};
        headers[csrfHeader] = csrfToken;
        
        $.ajax({
           url : 'attendance/attendanceHome',
           method : 'POST',
           headers,
           contentType : "application/json; charset=utf-8",
           success(data){
                console.log(data);
               if(data.state === "성공"){
                   alert("출근이 성공적으로 등록됬습니다.");
                   location.reload();
               }else if(data.state === '출장'){
                   alert("출장시에는 자동적으로 출근처리가 완료됩니다.");
                  return;
               }else if(data.state === '연차'){
                   alert("연차중입니다.");
                   return;
               }
               else{
                   alert("이미 출근하셨습니다.");
                       return;
               }
           },
           error : console.log
       });
    });
    
    //퇴근하기 버튼 누를시
    document.querySelector('#btn-endwork').addEventListener('click', function () {
        
        const csrfHeader = "${_csrf.headerName}";
        const csrfToken = "${_csrf.token}";
        const headers = {};
        headers[csrfHeader] = csrfToken;
        
        $.ajax({
           url : 'attendance/attendanceHome',
           method : 'POST',
           headers,
           contentType : "application/json; charset=utf-8",
           success(data){
               console.log(data);
               
               if(data.state === "성공"){
                   alert("퇴근이 성공적으로 등록됬습니다.");
                   location.reload();
               }else if(data.state === '출근전'){
                   alert("출근전입니다.");
                   return;
               }else if(data.state === '출장'){
                   alert("출장시에는 자동적으로 퇴근처리가 완료됩니다.");
                  return;
               }else if(data.state === '연차'){
                   alert("연차중입니다.");
                   return;
               }
               else{
                   alert("이미 퇴근하셨습니다.");
                   return;
               }
            },
           error : console.log
       });
    });
    
    const updateDayWorkTime = (daytimes) =>{
        
        const csrfHeader = "${_csrf.headerName}";
        const csrfToken = "${_csrf.token}";
        const headers = {};
        headers[csrfHeader] = csrfToken;
        
        $.ajax({
            url: 'attendance/attendanceHome',
            method: 'POST',
            headers,
            data: {daytimes},
            success(data) {
              console.log(data);
              getStartAndEndDateOfWeek();
            },
            error: console.log
          });
        };
    
    //이번주 누적시간 가져오기
    function getStartAndEndDateOfWeek() {
          const today = new Date();
          const todayDay = today.getDay(); // 오늘 날짜의 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)
    
          const startDate = new Date(today); // 해당 주의 시작일
          startDate.setDate(startDate.getDate() - todayDay);
    
          const endDate = new Date(today); // 해당 주의 종료일
          endDate.setDate(endDate.getDate() + (6 - todayDay));
    
          const start = startDate.getFullYear() + "." + (startDate.getMonth() + 1) + "." + startDate.getDate();
          const end = endDate.getFullYear() + "." + (endDate.getMonth() + 1) + "." + endDate.getDate();
          
          $.ajax({
              url : "attendance/attendanceHome",
              data : {start, end},
              contentType : "application/json; charset=utf-8",
              success(data){
                  console.log(data);
                  const {totalMonthOverTime ,totalMonthTime, weekOverTime ,weekTotalTime} = data;
                  const totalWorkTime = document.querySelector("#totalwork-time");
                  
                  totalWorkTime.textContent = chageWorkTime(weekTotalTime + weekOverTime);
              },
              error : console.log
              
          });
    }
    
    function chageWorkTime(times){
        const time = times / 1000;
        const hours = Math.floor(time / 3600); // 시간 계산
        const minutes = Math.floor((time % 3600) / 60); // 분 계산
        const seconds = Math.floor(time % 60); // 초 계산
        
        return `\${hours}h \${minutes}m \${seconds}s`;	
    }
    
    </script>					
</body>
</html>
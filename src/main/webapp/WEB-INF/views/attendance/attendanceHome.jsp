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
left:310px;
width:900px;
}
.font-14{
float:left;
}
.main-color{
float:left;
}
.color-gray{
float:left;
}
#work-week-container{
    position: relative;
    border: .5px solid gray;
    height: 100px;
    width: 100%;
}
#work-week-time{
    position: absolute;
    display: flex;
    justify-content: space-around;
    text-align: center;
    height: 100%;
}
#work-week-time div{
    width: 180px;
    padding-top: 17px;
}
#work-week-time p {
    margin-bottom: 5px;
}
#date-box{
    text-align: center;
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

                        <div class="work-week-container" id="work-week-container">
                            <div id="work-week-time">
                                
                                <div>
                                    <p class="font-14">이번주 누적</p><br>
                                    <h4 class="main-color" id="main-totalwork-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번주 초과</p><br>
                                    <h4 class="main-color" id="main-week-over-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번주 잔여</p><br>
                                    <h4 class="main-color" id="main-work-time">40h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번달 누적</p><br>
                                    <h4 class="color-gray" id="main-month-work-time">0h 0m 0s</h4>
                                </div>
                                <div>
                                    <p class="font-14">이번달 연장</p><br>
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
</body>
</html>
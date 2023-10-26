<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JSP에서 properties이 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>

<style>
	.dataTables_info {
		position: absolute;
    	right: 1%;
   		bottom: 3%;
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

									<div class="card">
										
									
										<table id="grid"></table>
    									<div id="pager"></div>
											
										<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
												  <a href="./addAnn" class="btn btn-primary btn-icon-split">
													<span class="icon text-white-50">
														<i class="fas fa-flag"></i>
													</span>
													<span class="text">글작성</span>
												 </a>
										</div>
									</div>
								</div>
							</div>
					</section>
			</div>
		</div>
	</div>

	
	<!-- End Sales Card -->
	
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
    <script>
        // jqGrid를 설정하고 게시판 리스트 데이터를 표시
        $(document).ready(function() {
            $("#grid").jqGrid({
                datatype: 'local',
                colNames: ['번호', '제목', '작성자', '날짜', '조회수'],
                colModel: [
                    { name: 'boardNo', index: 'boardNo', width: 50 },
                    { name: 'boardTitle', index: 'boardTitle', width: 200 },
                    { name: 'boardWriter', index: 'boardWriter', width: 100 },
                    { name: 'boardDate', index: 'boardDate', width: 80 },
                    { name: 'boardHit', index: 'boardHit', width: 70 }
                ],
                rowNum: 10, // 페이지당 보여줄 행 수
                rowList: [10, 20, 30], // 페이지당 보여줄 행 수 선택 옵션
                pager: '#pager',
                viewrecords: true,
                autowidth: true,
                height: 'auto'
            });

            // 게시판 데이터를 JSP 페이지에서 받아서 jqGrid에 표시
            var boardList = ${list}; // 컨트롤러에서 Model에 추가한 데이터
            for (var i = 0; i < boardList.length; i++) {
                $("#grid").jqGrid('addRowData', i, boardList[i]);
            }
        });
    </script>
</body>
</html>
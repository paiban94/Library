<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    .dataTables_info {
                        position: absolute;
                        right: 7%;
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

                                                    <div class="card" data-list="${list}" id="jqgriddata">
                                                        <table id="grid" style="margin:5px auto;"></table>

                                                        <div id="pager"></div>

                                                        <!-- End Table with stripped rows -->


                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                          
                                            <div class="first">
                                                <form action="" method="get">
                                                    <input type="hidden" value="1" name="page" id="page">
                                                    <select name="kind" id="k" class="form-select w-25" aria-label="Default select example" style="background: #666; color: #27292a;">
                                                        <option class="kind" value="employee">EMPLOYEE</option>
                                                        <option class="kind" value="title">TITLE</option>
                                                    </select>
                                                </form>
                                            </div>
                                            <div class="dataTables_info" role="status"
                                                aria-live="polite">
                                                <a href="./addAnn" class="btn btn-primary btn-icon-split">
                                                    <span class="icon text-white-50">
                                                        <i class="fas fa-flag"></i>
                                                    </span>
                                                    <span class="text">글작성</span>
                                                </a>
                                            </div>
                                            <br><br>
                                    </section>
                                </main>
                            </div>
                        </div>
                    </div>
                    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
                    <c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
                    <script>


                        $(document).ready(function () {
                            $("#grid").jqGrid({

                                url: "/board/announcementlist?page=1&pageSize=20",// 데이터를 가져올 서버 엔드포인트의 URL
                                datatype: "json", // 데이터 타입을 JSON으로 설정
                                colNames: ['번호', '제목', '작성자', '날짜', '조회수'],
                                colModel: [
                                    {
                                        name: 'board_no',
                                        index: 'board_no',
                                        hidedlg: true,
                                        width: 50,
                                        align: 'center'
                                    },

                                    {
                                        name: 'board_title',
                                        index: 'board_title',
                                        width: 200
                                    },
                                    {
                                        name: 'board_writer',
                                        index: 'board_writer',
                                        width: 100,
                                        align: 'center'
                                    },
                                    {
                                        name: 'reg_date',
                                        index: 'reg_date',
                                        width: 80,
                                        align: 'center'
                                    },
                                    {
                                        name: 'board_hit',
                                        index: 'board_hit',
                                        width: 70,
                                        align: 'center'
                                    }
                                ],
                                rowNum: 20,
                                rowList: [20, 25, 30],
                                pgbuttons: true,
                                pager: '#pager',
                                search: true,
                                viewrecords: true,
                                autowidth: true,
                                height: 'auto',
                                search: true,
                                pgbuttons: true,
                                onCellSelect: function (rowid, index, contents, event) {
                                    var data = $(this).jqGrid('getGridParam', 'colModel');
                                    if (data[index].name == "board_title") {
                                        var id = $("#grid").jqGrid("getGridParam", "selrow");

                                        var rowData = $("#grid").jqGrid("getRowData", id);
                                        let no = rowData.board_no;

                                        $.ajax({
                                            url: "./annDetail?" + no,
                                            type: "get",
                                            data: {
                                                board_no: rowData.board_no
                                            },
                                            success: function (data) {
                                                if (no !== null && no !== undefined) {
                                                    location.replace("./annDetail?board_no=" + no);
                                                }

                                            },
                                            error: function () {
                                                console.log("error");
                                            }
                                        });
                                    }
                                }
                            });
                            // $("#grid").jqGrid('filterToolbar', { searchOperators: true, stringResult: true, searchOnEnter: true });

                            // 페이지 로딩시 초기 데이터 로드
                            loadPage(1);

                            // 페이지 번호 클릭 이벤트 처리
                            $('#pager .ui-pg-input').change(function () {
                                const page = $(this).val();
                                loadPage(page);
                            });

                            function loadPage(page) {
                                $("#grid").jqGrid('setGridParam', {
                                    url: `/board/announcementlist?page=${page}`
                                }).trigger('reloadGrid');
                            }
                            $("#grid").jqGrid('filterToolbar', { autosearch: true, searchOperators: true, stringResult: true, searchOnEnter: true });
                        });
                    </script>
                </body>

                </html>
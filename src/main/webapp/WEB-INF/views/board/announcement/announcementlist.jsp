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
                    .first {
                        position: absolute;
                        left: 20%;
                    }

                    .second {
                        position: absolute;
                        right: 7%;
                    }

                    .searchCategory {
                        display: flex;
                    }

                    .searchtext {
                        margin-right: 5px;
                    }

                    .searchselect {
                        margin-left: 3px;
                        margin-right: 5px;
                    }

                    .searchBtn {
                        margin-left: 3px;
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

                                                    <div class="card" id="jqgriddata">
                                                        <table id="grid" style="margin:5px auto;"></table>

                                                        <div id="pager"></div>

                                                        <!-- End Table with stripped rows -->


                                                    </div>
                                                </div>
                                            </div>
                                            <br>

                                            <div class="first">
                                                <form action="./announcement" method="get">
                                                    <div class="searchCategory">
                                                        <div class="searchtext">
                                                            <input type="hidden" name="page" id="page" value="1" data-page="1">
                                                            <input type="text" name="search" id="search">
                                                        </div>
                                                        <div class="searchselect">
                                                            <select name="kind" id="k"
                                                                aria-label="Default select example"
                                                                style="background: #666; color: #27292a;">
                                                                <option class="kind" value="W">EMPLOYEE</option>
                                                                <option class="kind" value="N">TITLE</option>
                                                            </select>
                                                        </div>
                                                        <div class="searchBtn" id="searchBtn">
                                                            <input type="button" value="검색">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="pagination" style="text-align: center;">
                                                <c:choose>
                                                    <c:when test="${totalPages > 1}">
                                                        <c:forEach begin="1" end="${totalPages}" var="page">
                                                            <c:choose>
                                                                <c:when test="${page == currentPage}">
                                                                    <span class="current-page">${page}</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="javascript:void(0);" class="page-link"
                                                                        data-page="${page}">${page}</a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </div>
                                            <div class="second" role="status" aria-live="polite">
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
                    <script src="/js/annlist.js"></script>
                </body>

                </html>
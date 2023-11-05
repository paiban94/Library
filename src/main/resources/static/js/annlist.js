
$(document).ready(function () {


    $("#searchBtn").click(function () {
        
        let searchValue = $("#search").val();
        let kindValue = $("#k").val();


        let currentPage = $("#grid").getGridParam("page");

        $.ajax({
            url: "./announcementlist?",
            type: "get",
            data: {
                page: currentPage,
                search: searchValue,
                kind: kindValue
            },
            success: function () {
                console.log("sccuess");
                let newURL = "/board/announcementlist?page=" + currentPage + "&search=" + searchValue + "&kind=" + kindValue;
                $(location).attr('href', newURL);
            },
            error: function () {
                console.log("error");
            }

        })



        //location.href = newURL;
    });

    $("#grid").jqGrid({

        url: "/board/announcementlist?page=1&pageSize=20",// 데이터를 가져올 서버 엔드포인트의 URL
        datatype: "json", // 데이터 타입을 JSON으로 설정
        colNames: ['번호', '제목', '작성자', '날짜', '조회수'],
        colModel: [
            {
                name: 'board_no',
                index: 'board_no',
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
        rownumbers: true,
        gridview: true,
        autoencode: true,
        pager: '#pager',
        styleUI: 'Bootstrap',
        viewrecords: true,
        autowidth: true,
        height: 'auto',
        loadonce: true,
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



    // 페이지 번호 클릭 이벤트 처리

    loadPage(1);

    let currentPage = 1; // 현재 페이지를 1로 초기화

    // 페이지 번호 클릭 이벤트 처리
    $('#pager').on('click', '.page-link', function () {
        const page = $(this).data('page');
        loadPage(page);
    });

    function loadPage(page) {
        $("#grid").jqGrid('setGridParam', {
            url: `/board/announcementlist?page=${page}&pageSize=20`,
            page: page,
        }).trigger('reloadGrid');
        currentPage = page; // 현재 페이지 업데이트
    }
    function searchloadPage(page, search) {
        $("#grid").jqGrid('setGridParam', {
            url: '/board/announcementlist?page=' + page + '&search=' + search,
            page: page,
        }).trigger('reloadGrid');
        currentPage = page; // 현재 페이지 업데이트
    }
});
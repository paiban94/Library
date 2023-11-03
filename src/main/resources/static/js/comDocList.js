
$(document).ready(function () {
    $("#grid").jqGrid({
        url: "/approval/comDocListJq?page=1&pageSize=20",// 데이터를 가져올 서버 엔드포인트의 URL
        datatype: "json", // 데이터 타입을 JSON으로 설정
        colNames: ['날짜', '종류', '제목', '문서번호', '상태'],
        colModel: [
            {
                name: 'reg_date',
                index: 'reg_date',
                hidedlg: true,
                width: 50,
                align: 'center'
            },
            {
                name: 'grp_cd',
                index: 'grp_cd',
                width: 70,
                align: 'center'
            },
            {
                name: 'doc_title',
                index: 'doc_title',
                width: 200
            },
            {
                name: 'doc_no',
                index: 'doc_no',
                width: 100,
                align: 'center'
            },
            {
                name: 'approval_state',
                index: 'approval_state',
                width: 80,
                align: 'center'
            }

        ],
        rowNum: 20,
        rowList: [20, 25, 30],
        pgbuttons: true,
        pager: '#pager',
        viewrecords: true,
        autowidth: true,
        height: 'auto',
        pgbuttons: true,
        onCellSelect: function (rowid, index, contents, event) {
            var data = $(this).jqGrid('getGridParam', 'colModel');
            if (data[index].name == "doc_title") {
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
            url: `/approval/comDocListJq?page=${page}`
        }).trigger('reloadGrid');
    }
});
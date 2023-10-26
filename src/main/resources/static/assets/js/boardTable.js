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
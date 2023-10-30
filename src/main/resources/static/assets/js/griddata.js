

$("#grid").jqGrid({

    url: "/board/announcementlist/", // 데이터를 가져올 서버 엔드포인트의 URL
    datatype: "json", // 데이터 타입을 JSON으로 설정
    colNames: ['번호', '제목', '작성자', '날짜', '조회수'],
    colModel: [
        { name: 'board_no', index: 'board_no', width: 50 },
        { name: 'board_title', index: 'board_title', width: 200 },
        { name: 'board_writer', index: 'board_writer', width: 100 },
        { name: 'reg_date', index: 'reg_date', width: 80 },
        { name: 'board_hit', index: 'board_hit', width: 70 }
    ],
    rowNum: 10,
    rowList: [10, 15, 20],
    pager: '#pager',
    viewrecords: true,
    autowidth: true,
    height: 'auto',
	onCellSelect : function (rowid,index,contents,event) {
        var data = $(this).jqGrid('getGridParam','colModel');
        if (data[index].name == "board_title") {
            var id = $("#grid").jqGrid("getGridParam","selrow");

            var rowData = $("#grid").jqGrid("getRowData",id);
            let no = rowData.board_no;

            $.ajax({
                url : "./annDetail",
                type : "get",
                data : {
                    board_no : rowData.board_no
                },
                success : function(data){
                    if(no !== null && no !== undefined){
                        console.log("./annDetail?board_no="+no);
                        location.replace("./annDetail?board_no="+no);
                    }
                    
                },
                error : function() {
                    console.log("./annDetail?board_no="+no);
                    console.log("error");
                }
            });
        }
    }
});

function FacilityDelete(){
    var msg = "다음 공용품을 삭제합니다";
    var checkBoxes = document.getElementsByName("facility_no");

    for(var i = 0; i < checkBoxes.length;i++){
        if(checkBoxes[i].checked){
            msg +=("- "+ checkBoxes[i].value +"\n");
        }
    }
    alert(msg);
    
}
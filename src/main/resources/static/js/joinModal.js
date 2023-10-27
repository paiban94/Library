// $(document).ready(function () { 
//    $("#joinModal").click(function () {
//        var emp_no = $(this).data('id');
//        $(".modal-body").text('당신의 사원번호는 ' + emp_no + '입니다.');
//    });
// });


document.addEventListener("DOMContentLoaded", function() {
    const joinModal = document.getElementById("joinModal");
    joinModal.addEventListener("click", function() {
        const emp_no = joinModal.getAttribute("data-id");
        document.querySelector(".modal-body").textContent = '당신의 사원번호는 ' + emp_no + '입니다.';
    });
});
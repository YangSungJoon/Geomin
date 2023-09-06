function onChange(select) {
    var selectedValue = select.value; // 선택된 옵션의 value 값을 가져옵니다.
    var selectView = document.getElementById("select_view");
    
    selectView.innerHTML = "신청 그룹 : " + selectedValue;
}
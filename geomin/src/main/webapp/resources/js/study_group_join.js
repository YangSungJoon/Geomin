function onChange(select) {
    var selectedValue = select.value; // 선택된 옵션의 value 값을 가져옵니다.
    var selectView = document.getElementById("select_view");
    
    selectView.innerHTML = "그룹 : " + selectedValue;
    
    $(document).ready(function() {
    	  $("#select").change(function() {
    	    // 선택된 옵션의 값을 가져옵니다.
    	     selectedValue = $(this).val();

    	    // 값을 선택한 경우, "select_info"인 select 요소를 숨김.
    	    if (selectedValue === $(this).val()) {
    	      $("#select_info").hide();
    	    }
    	  });
    });
}
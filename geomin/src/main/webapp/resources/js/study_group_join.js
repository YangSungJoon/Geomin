function onChange(select) {
//	let selectedValue = document.getElementById("select").value;
//	console.log(selectedValue);
//	document.getElementById("select_view").innerText=selectedValue;
	var selectedOption = select.options[select.selectedIndex];
	var groupInfo = selectedOption.value;
	
	document.getElementById("result").innerText = groupInfo;
}
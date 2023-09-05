function onChange() {
	let selectedValue = document.getElementById("select").value;
	console.log(selectedValue);
	document.getElementById("select_view").innerText=selectedValue;
}
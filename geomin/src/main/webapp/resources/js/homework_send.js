function checkOne(element){
	const checkboxes = document.getElementsByName("checkbox");
	
	checkboxes.forEach((c) => {
		c.checked = false;
	})
	
	element.checked = true;
}
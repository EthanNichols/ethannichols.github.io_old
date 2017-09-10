var xPos = 0;

var repeat = false;

function moveContent(amount) {
	var content = document.getElementById("moveContent");
	xPos += amount;
	content.style.left = xPos + "px";
}

function stop() {
	repeat = false;
}
images = [
'url(images/evoDiceWars.png)',
'url(images/ancientPuzzle.png)',
'url(images/galaxyVendetta.png)',
'url(images/mapGeneration.png)']

var n = 0;

function left(){

	n--;

	if (n < 0){
		n = images.length-1;
	}

	document.getElementById('content').style.backgroundImage = images[n];
}

function right(){

	n++;

	if (n >= images.length){
		n = 0;
	}

	document.getElementById('content').style.backgroundImage = images[n];
}

function loadImages(){
	for (i=0; i<images.length; i++) {
		n++;
		document.getElementById('content').style.backgroundImage = images[n];
	}
}

loadImages();
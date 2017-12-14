window.onload = start;

let fileUpload, imgDisplay, canvas
let originalImage, editedImage;

let sameColors = [];
let pixelData;

function start() {
	setElements();

	fileUpload.value = "";

	setInterval(loop, 1000 / 60);
}

function loop() {

}

function setElements() {
	fileUpload = document.querySelector("#fileUpload");
	fileUpload.onchange = uploadedFile;

	imgDisplay = document.querySelector("img");

	canvas = document.createElement("canvas");
}

function uploadedFile() {
	this.className = "";
	if (this.files[0] === null || this.files[0] === undefined) { return; }

	let loadImage = new Image();
	loadImage.src = window.URL.createObjectURL(this.files[0]);

	loadImage.onload = function() {
		imgDisplay.src = loadImage.src;
		originalImage = loadImage;

		setCanvas(loadImage);

		getPixelData();
	}
}

function setCanvas(image) {
	canvas.width = image.width;
	canvas.height = image.height;

	let content = canvas.getContext('2d');
	content.drawImage(image, 0, 0);
}

function getPixelData() {

	let content = canvas.getContext('2d');
	pixelData = [];

	for (let x=0; x<originalImage.width; x++) {

		let row = []

		for (let y=0; y<originalImage.height; y++) {

			let pixelData = content.getImageData(x, y, 1, 1).data;
			let setColor = new color(pixelData[0], pixelData[1], pixelData[2], pixelData[3]);
			let similarColor;

			if (similarColor = groupColors(setColor, x, y) != null) {
				setColor = similarColor;
			}

			console.log((x * originalImage.width + y + 1) / (originalImage.width * originalImage.height));
			
			row.push(setColor);
		}

		pixelData.push(row);
	}

	console.log("Completed Image Reading!");
	console.log(sameColors);
}

function groupColors(pixelColor, xPos, yPos) {
	if (sameColors.length == 0)
	{
		sameColors.push(new sameColor(pixelColor));
		sameColors[0].addPos(new pos(xPos, yPos));
		return null;
	}

	for (let i=0; i<sameColors.length; i++) {
		if (sameColors[i].color.r == pixelColor.r &&
			sameColors[i].color.g == pixelColor.g &&
			sameColors[i].color.b == pixelColor.b &&
			sameColors[i].color.a == pixelColor.a) {
			sameColors[i].addPos(new pos(xPos, yPos));
			return sameColors[i];
		} else {
			if (pixelColor.value > sameColors[i].color.value) {
				sameColors.splice(i, 0, new sameColor(pixelColor));
				sameColors[i].addPos(new pos(xPos, yPos));
				return null;
			}
		}
	}
}
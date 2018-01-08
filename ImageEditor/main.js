window.onload = start;

let canvas, originalImage, loadingBar;
let pixelColors = [];
let sortedColors = [];
let sortedColorAmount = [];

let prevColorAmount = 0;

//This is where the program starts
function start() {

	//Find all the elements first
	setElements();

	//Start the main loop
	setInterval(loop, 1000 / 60);
}
//Get and set variables to all the relevant elements in the browser
function setElements() {
	document.querySelector("#fileUpload").onchange = uploadedFile;

	loadingBar = document.querySelector("#loadingBar");

	canvas = document.createElement("canvas");

	document.querySelector("#colorAmount").children[0].disabled = true;
	document.querySelector("#colorAmount").children[1].disabled = true;

	document.querySelector("#colorAmount").children[0].addEventListener('input', updateColorAmount);
	document.querySelector("#colorAmount").children[1].addEventListener('input', updateColorAmount);
}
//Main loop
function loop() {
	loadBar();
}



//Set the display for the loading bar
function loadBar() {


	if (loadingBar.firstElementChild.style.width == "100%") {

		//Start the timer to fade the loading bar out
		if (loadingBar.timer > 0) {
			loadingBar.timer--;
			loadingBar.style.opacity = loadingBar.timer / 100;

		//When the timer is finished don't display the loading bar
		} else {
			loadingBar.style.display = "none";
		}

	//Set the width of the loading bar
	} else {
		loadingBar.firstElementChild.style.width = ((loadingBar.progress / loadingBar.threads) * 100) + "%";
	}
}
//Reset the loading bar data
function resetLoadingBar() {
	loadingBar.progress = 0;
	loadingBar.threads = 0;
	loadingBar.timer = 100;
	loadingBar.style.display = null;
	loadingBar.style.opacity = null;

	loadingBar.firstElementChild.style.width = "0px";
}
//Set the UI values based on the image loaded
function setUI() {
	document.querySelector("#colorAmount").children[0].disabled = false;
	document.querySelector("#colorAmount").children[0].min = 1;
	document.querySelector("#colorAmount").children[0].max = sortedColors.length;
	document.querySelector("#colorAmount").children[0].value = sortedColors.length;

	document.querySelector("#colorAmount").children[1].disabled = false;
	document.querySelector("#colorAmount").children[1].min = 1;
	document.querySelector("#colorAmount").children[1].max = sortedColors.length;
	document.querySelector("#colorAmount").children[1].value = sortedColors.length;

	prevColorAmount = 0;
}
//Set all of the UI color values to be the same
function updateColorAmount() {

	//Make sure the value isn't a decimal
	this.value = Math.floor(this.value);

	//Keep the value within the min and max values
	if (this.value == "") {this.value = 1;}
	if (this.value < 1) {this.value = 1;}
	if (this.value > parseInt(this.max)) {this.value = parseInt(this.max);}

	//Set all the values equal to the changed value
	for (let i=0; i<this.parentNode.children.length; i++) {
		this.parentNode.children[i].value = this.value;
	}

	editPicture(parseInt(this.value));
	prevColorAmount = sortedColors.length - parseInt(this.value);
}



function editPicture(colorAmount, editType = null) {
	
	let content = canvas.getContext('2d');
	//content.drawImage(originalImage, 0, 0);

	//randomEdit(sortedColors.length - colorAmount);
	removeSmallestEdit(sortedColors.length - colorAmount);

	let editedImage = new Image();
	let localURL = canvas.toDataURL("image/png");
	editedImage.src = localURL;

	editedImage.onload = function() {
		setCanvas(editedImage);
	}
}
function removeSmallestEdit(colorAmount) {
	let content = canvas.getContext('2d');

	if (prevColorAmount > colorAmount) {

		for(let i=prevColorAmount; i>=colorAmount; i--) {

			content.fillStyle = sortedColorAmount[i].color.getRGBA();
			sortedColorAmount[i].positions.forEach(function(e) {
				content.fillRect(e.x, e.y, 1, 1);
			});

			sortedColors[sortedColorAmount[i].sortedColorPos].gainedColors.forEach(function(f) {
				sortedColorAmount[f].positions.forEach(function(e) {
					content.fillRect(e.x, e.y, 1, 1)
				});
			});
			if (i != colorAmount) {sortedColorAmount[i].gainedColors = [];}
		}

		return;
	}

	for (let i=prevColorAmount; i<colorAmount; i++) {

		let localPos = parseInt(sortedColorAmount[i].sortedColorPos + 1);
		if (localPos >= sortedColorAmount.length) {localPos -= sortedColorAmount.length;}

		content.fillStyle = sortedColors[localPos].color.getRGBA();

		sortedColorAmount[i].positions.forEach(function(e) {
			content.fillRect(e.x, e.y, 1, 1);
		});

		sortedColorAmount[i].gainedColors.forEach(function(f) {
			sortedColorAmount[f].positions.forEach(function(e) {
				content.fillRect(e.x, e.y, 1, 1)
			});
		});

		sortedColors[localPos].gainedColors = sortedColors[localPos].gainedColors.concat(sortedColors[i].gainedColors);
		sortedColors[localPos].gainedColors.push(sortedColors[i].sortedColorPos);
	}
}
function randomEdit(colorAmount) {

	let usedColors = sortedColors.slice();
	let content = canvas.getContext('2d');

	for (let i=0; i<colorAmount; i++) {

		let randNum = Math.floor(Math.seededRandom(0, usedColors.length, colorAmount));
		let randNum2 = Math.floor(Math.seededRandom(0, usedColors.length, randNum));

		while (randNum == randNum2) {
			randNum2++;
			if (randNum2 >= usedColors.length) {randNum2 -= usedColors.length;}
		}

		usedColors[randNum].positions.forEach(function(e) {
			content.fillStyle = usedColors[randNum2].color.getRGBA();
			content.fillRect(e.x, e.y, 1, 1);
		});

		usedColors[randNum2].positions = usedColors[randNum2].positions.concat(usedColors[randNum].positions);

		let index = usedColors.indexOf(usedColors[randNum]);
		usedColors.splice(index, 1);
	}

	usedColors = null;
}


//Set the original image and display the the file the user uploaded
function uploadedFile() {

	//Remove the classname, so that is doesn't take up the entire screen
	this.className = "";
	this.zIndex = 0;

	//Make sure there is a file to read
	if (this.files[0] === null || this.files[0] === undefined) { return; }

	//Create a new image and set it to the file the user uploaded
	let loadImage = new Image();
	loadImage.src = window.URL.createObjectURL(this.files[0]);

	//Wait for the original image to finish loading
	loadImage.onload = function() {
		originalImage = loadImage;

		//Set and display the starting image
		setCanvas(loadImage);

		//Get all the pixel data in the canvas
		getPixelData();
	}
}
//Set the image in the canvas, and display the image
function setCanvas(image) {

	//Set the canvas width and height
	canvas.width = image.width;
	canvas.height = image.height;

	//Draw the 2d image on the canvas
	let content = canvas.getContext('2d');
	content.drawImage(image, 0, 0);

	//Display the image in the browser
	document.querySelector("img").src = image.src;
}
//Read all the pixels in the images and store them in an array
function getPixelData() {

	resetLoadingBar();

	//Get the canvas' 2d content
	let content = canvas.getContext('2d');

	//The chunk size, and calculate the grid for the chunks
	let chunkSize = 10;
	let rowChunks = Math.floor(originalImage.width / chunkSize);
	let colChunks = Math.floor(originalImage.height / chunkSize);

	//Loop through the grid of chunks
	for (let x=0; x<=rowChunks; x++) {
		for (let y=0; y<=colChunks; y++) {

			//If the chunk is complete add the read the chunk contents
			if (x != rowChunks &&
				y != colChunks) {
				readChunk(x * chunkSize, y * chunkSize, chunkSize, chunkSize);
				loadingBar.threads++;
				continue;
			}

			//If the chunk has excess of the row read the modified chunk contents
			if (x == rowChunks &&
				y != colChunks &&
				originalImage.height % chunkSize != 0) {
				readChunk(x * chunkSize, y * chunkSize, originalImage.width % chunkSize, chunkSize);
				loadingBar.threads++;
				continue;
			}

			//If the chunk has excess of the col read the modified chunk contents
			if (y == colChunks &&
				x != rowChunks &&
				originalImage.width % chunkSize != 0) {
				readChunk(x * chunkSize, y * chunkSize, chunkSize, originalImage.height % chunkSize);
				loadingBar.threads++;
				continue;
			}
		}
	}

	//Read the last chunk of the image
	readChunk((rowChunks+1) * chunkSize, (colChunks+1) * chunkSize, originalImage.width%chunkSize, originalImage.height%chunkSize, true);
	loadingBar.threads++;
}
///Get all the pixels in a chunk and put them into a grouped color array
function readChunk(startX, startY, width, height, final = false) {

	//Get the canvas' 2d content 
	let content = canvas.getContext('2d');

	//Create a new thread (SetInterval acts as a thread)
	let setFunc = setInterval( function() {

		//Loop through the chunk width and height from the start position
		for (let x = startX; x<startX+width; x++) {
			for (let y = startY; y<startY+height; y++) {

				//Get the pixel, it's color and group it with the other colors
				let pixel = content.getImageData(x, y, 1, 1).data;
				let pixelColor = new color(pixel[0], pixel[1], pixel[2], pixel[3]);
				groupColors(pixelColor, x, y);
			}
		}

		//Test if this is the last thread
		if (final) {

			//Sort the pixels and set the input UI
			sortColors();
			setUI();
		}

		//Update the loading bar display
		loadingBar.progress++;
		loadBar();

		//Delete the thread (Clear the set interval)
		clearInterval(setFunc);
	}, 1);
}
//Sort the pixels in the image into different arays
function sortColors() {
	//Sort the pixels by colors
	for (let i=0; i<pixelColors.length; i++) {
		if (pixelColors[i]) {
			pixelColors[i].sortedColorPos = sortedColors.length;
			sortedColors.push(pixelColors[i]);
		}
	}

	//Sort the pixels by the amount of the same color
	sortedColorAmount = sortedColors.slice();
	sortedColorAmount.sort(function(a,b) { return a.positions.length - b.positions.length});

	for (let i=0; i<sortedColors.length; i++) {
		sortedColorAmount[i].sortedAmountPos = i;
	}

	console.log(sortedColors);
	console.log(sortedColorAmount);
}
///Group pixels that have the same color into the same array
function groupColors(pixelColor, xPos, yPos) {

	//Test if the pixel's color doesn't exists
	if (!pixelColors[pixelColor.value]) {

		//Set the color value index to the color and add the pixel position
		pixelColors[pixelColor.value] = new sameColor(pixelColor);
		pixelColors[pixelColor.value].addPos(new pos(xPos, yPos));
	}

	//If the color exists add it to the list and return the color
	pixelColors[pixelColor.value].addPos(new pos(xPos, yPos));
}

var canvas = document.getElementById("testing");
var context = canvas.getContext("2d");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

createPlayer();

function createPlayer() {
	player = {
		x:10,
		y:-10,
		xSpeed:10,
		ySpeed:10,
		jumpSpeed:10,
		standing:false,
		key:-1,
	};
}

function movePlayer() {
	if (player["key"] == 65) {
		player["xSpeed"] -= 1
	} else if (player["key"] == 68) {
		player["xSpeed"] += 1
	}

	if (player["key"] == 32 && player["standing"]) {
		player["ySpeed"] -= 20;
		player["standing"] = false
	}

	if (!player["standing"] && player["ySpeed"] <= 5) {
		player["ySpeed"] += 1
	}

	player["y"] += player["ySpeed"]

	if (player["y"] + 10 >= window.innerHeight) {
		player["y"] = window.innerHeight - 10;
		player["standing"] = true
	}

	player["x"] += player["xSpeed"];

	if (player["xSpeed"] > 0 && player["key"] == -1) {
		player["xSpeed"] -= 1;
	} else if (player["xSpeed"] < 0 && player["key"] == -1) {
		player["xSpeed"] += 1;
	}
}

setInterval(function(){ 

	context.fillStyle = "rgba(255, 255, 255, 1)";
	context.fillRect(0, 0, window.innerWidth, window.innerHeight);

	context.fillStyle = "rgba(0, 0, 0, 1)";
	context.fillRect(player["x"], player["y"], 10, 10);

	movePlayer();
}, 30);

document.addEventListener('keydown', function(key) {
	player["key"] = key.keyCode;
});

document.addEventListener('keyup', function(key) {

	if (player["key"] == key.keyCode){
		player["key"] = -1
	}
});
//Class to hold the RGBA and total value for each pixel
class color {
	constructor(r, g, b, a) {
		this.r = r;
		this.g = g;
		this.b = b;
		this.a = a;
		this.value = r;
		this.value += g*255;
		this.value += b*(255 * 2);
		this.value += a*(255 * 3);
	}
}

//Class to hold the XY position of the pixel
class pos {
	constructor(x, y) {
		this.x = x;
		this.y = y;
	}
}

//Class to hold all colors and an array of positions with the same color
class sameColor {
	constructor(color) {
		this.color = color;
		this.positions = []
	}

	addPos(pos) {
		this.positions.push(pos);
	}
}
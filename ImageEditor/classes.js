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

class pos {
	constructor(x, y) {
		this.x = x;
		this.y = y;
	}
}

class sameColor {
	constructor(color) {
		this.color = color;
		this.positions = []
	}

	addPos(pos) {
		this.positions.push(pos);
	}
}
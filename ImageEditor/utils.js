Math.seed = 6;

Math.seededRandom = function(min = 0, max = 1, setSeed = null) {
	
	Math.seed = (Math.seed * 9301 + 49297) % 233280;
	let rand = 0;

	if (setSeed == null) {
		rand = Math.seed / 233280;
	} else {
		rand = (setSeed * 9301 + 49297 * setSeed) % 233280 / 233280;
	}

	return min + rand * (max - min);
}
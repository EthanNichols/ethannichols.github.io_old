
PImage rock;

void createRock() {
  rock = loadImage("images/rock.png");
}

void drawRock() {
  image(rock, width / 2 - room.width / 2, height - room.height);
}

void stoneMined() {
  int wood = (int)random(1000);
  
  if (wood >= 0 && wood < 350) {
    increaseResource("Copper Ore");
  } else if (wood >= 350 && wood < 550) {
    increaseResource("Iron Ore");
  } else if (wood >= 550 && wood < 700) {
    increaseResource("Silver Ore");
  } else if (wood >= 700 && wood < 825) {
    increaseResource("Coal Ore");
  } else if (wood >= 825 && wood < 900) {
    increaseResource("Gold Ore");
  } else if (wood >= 900 && wood < 950) {
    increaseResource("Mithril Ore");
  } else if (wood >= 950 && wood < 985) {
    increaseResource("Lunar Ore");
  } else if (wood >= 985 && wood < 995) {
    increaseResource("Adamantite Ore");
  } else if (wood >= 995 && wood < 1000) {
    increaseResource("Runite Ore");
  } else if (wood >= 1000 && wood < 1000) {
    increaseResource("Currupted Ore");
  }
}
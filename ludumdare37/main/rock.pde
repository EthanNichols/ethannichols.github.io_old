
PImage rock;

void createRock() {
  rock = loadImage("images/rock.png");
}

void drawRock() {
  image(rock, width / 2 - room.width / 2, height - room.height);
}

void stoneMined() {
  int wood = (int)random(1000);
  
  int bonus = tools[1].bonus;
  
  if (bonus > 45) {
    wood = (int)random(10) + 1;

    switch(wood) {
    case 1:
      increaseResource("Copper Ore");
      break;
    case 2:
      increaseResource("Iron Ore");
      break;
    case 3:
      increaseResource("Silver Ore");
      break;
    case 4:
      increaseResource("Coal Ore");
      break;
    case 5:
      increaseResource("Gold Ore");
      break;
    case 6:
      increaseResource("Mithril Ore");
      break;
    case 7:
      increaseResource("Lunar Ore");
      break;
    case 8:
      increaseResource("Adamantite Ore");
      break;
    case 9:
      increaseResource("Runite Ore");
      break;
    case 10:
      increaseResource("Currupted Ore");
      break;
    }
  }
  
  wood = (int)random(1000);
  
  if (wood >= 0 && wood < 350 - bonus) {
    increaseResource("Copper Ore");
  } else if (wood >= 350 - bonus && wood < 550 - bonus) {
    increaseResource("Iron Ore");
  } else if (wood >= 550 - bonus && wood < 700 - bonus) {
    increaseResource("Silver Ore");
  } else if (wood >= 700 - bonus && wood < 825 - bonus) {
    increaseResource("Coal Ore");
  } else if (wood >= 825 - bonus && wood < 900 - bonus) {
    increaseResource("Gold Ore");
  } else if (wood >= 900 - bonus && wood < 950 - bonus) {
    increaseResource("Mithril Ore");
  } else if (wood >= 950 - bonus && wood < 985 - bonus) {
    increaseResource("Lunar Ore");
  } else if (wood >= 985 - bonus && wood < 995 - bonus) {
    increaseResource("Adamantite Ore");
  } else if (wood >= 995 - bonus && wood < 1000 - bonus) {
    increaseResource("Runite Ore");
  } else if (wood >= 1000 - bonus && wood < 1000) {
    increaseResource("Currupted Ore");
  }
}
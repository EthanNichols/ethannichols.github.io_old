
PImage farm;

void createFarm() {
  farm = loadImage("images/farm.png");
}

void drawFarm() {
  image(farm, width / 2 - room.width / 2, height - room.height);
}

void plantHarvested() {
  int wood = (int)random(1000);

  int bonus = tools[0].bonus;

  if (bonus > 45) {
    wood = (int)random(10) + 1;

    switch(wood) {
    case 1:
      increaseResource("Potatos");
      break;
    case 2:
      increaseResource("Cabbage");
      break;
    case 3:
      increaseResource("Corn");
      break;
    case 4:
      increaseResource("Strawberry");
      break;
    case 5:
      increaseResource("Watermelon");
      break;
    case 6:
      increaseResource("Barley");
      break;
    case 7:
      increaseResource("Apple");
      break;
    case 8:
      increaseResource("Pineapple");
      break;
    case 9:
      increaseResource("Cocoa Beans");
      break;
    case 10:
      increaseResource("Dragonfruit");
      break;
    }
  }
  
  wood = (int)random(1000);  

  if (wood >= 0 && wood < 350 - bonus) {
    increaseResource("Potatos");
  } else if (wood >= 350 - bonus && wood < 550 - bonus) {
    increaseResource("Cabbage");
  } else if (wood >= 550 - bonus && wood < 700 - bonus) {
    increaseResource("Corn");
  } else if (wood >= 700 - bonus && wood < 825 - bonus) {
    increaseResource("Strawberry");
  } else if (wood >= 825 - bonus && wood < 900 - bonus) {
    increaseResource("Watermelon");
  } else if (wood >= 900 - bonus && wood < 950 - bonus) {
    increaseResource("Barley");
  } else if (wood >= 950 - bonus && wood < 985 - bonus) {
    increaseResource("Apple");
  } else if (wood >= 985 - bonus && wood < 995 - bonus) {
    increaseResource("Pineapple");
  } else if (wood >= 995 - bonus && wood < 1000 - bonus) {
    increaseResource("Cocoa Beans");
  } else if (wood >= 1000 - bonus && wood < 1000) {
    increaseResource("Dragonfruit");
  }
}
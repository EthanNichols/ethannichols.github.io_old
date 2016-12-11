
PImage farm;

void createFarm() {
  farm = loadImage("images/farm.png");
}

void drawFarm() {
  image(farm, width / 2 - room.width / 2, height - room.height);
}

void plantHarvested() {
  int wood = (int)random(1000);
  
  if (wood >= 0 && wood < 350) {
    increaseResource("Potatos");
  } else if (wood >= 350 && wood < 550) {
    increaseResource("Cabbage");
  } else if (wood >= 550 && wood < 700) {
    increaseResource("Corn");
  } else if (wood >= 700 && wood < 825) {
    increaseResource("Strawberry");
  } else if (wood >= 825 && wood < 900) {
    increaseResource("Watermelon");
  } else if (wood >= 900 && wood < 950) {
    increaseResource("Barley");
  } else if (wood >= 950 && wood < 985) {
    increaseResource("Apple");
  } else if (wood >= 985 && wood < 995) {
    increaseResource("Pineapple");
  } else if (wood >= 995 && wood < 1000) {
    increaseResource("Cocoa Beans");
  } else if (wood >= 1000 && wood < 1000) {
    increaseResource("Dragonfruit");
  }
}

waterFall animation1, animation2, animation3;

int animationTimer = 0;

class waterFall {
  PImage[] images;
  int imageCount;
  int frame;
  
  waterFall(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

void createWaterFall() {
  animation1 = new waterFall("images/waterFall1", 1);
  animation2 = new waterFall("images/waterFall2", 1);
  animation3 = new waterFall("images/waterFall3", 1);
}

void drawWaterFall() {
  
  animationTimer++;
  
  int delay = 10;
  
  if (animationTimer < delay) {
    animation1.display(width / 2 - room.width / 2 + 2, height - room.height - 1);
  } else if (animationTimer >= delay && animationTimer < delay * 2) {
    animation2.display(width / 2 - room.width / 2 + 2, height - room.height - 1);
  } else if (animationTimer >= delay * 2) {
    animation3.display(width / 2 - room.width / 2 + 2, height - room.height - 1);
  }
  
  if (animationTimer >= delay * 3) {
    animationTimer = 0;
  }
}

void fishCaught() {
  int wood = (int)random(1000);
  
  int bonus = tools[2].bonus;
  
  if (bonus > 45) {
    wood = (int)random(10) + 1;

    switch(wood) {
    case 1:
      increaseResource("Crayfish");
      break;
    case 2:
      increaseResource("Trout");
      break;
    case 3:
      increaseResource("Bass");
      break;
    case 4:
      increaseResource("Tuna");
      break;
    case 5:
      increaseResource("Lobster");
      break;
    case 6:
      increaseResource("Swordfish");
      break;
    case 7:
      increaseResource("Shark");
      break;
    case 8:
      increaseResource("Monkfish");
      break;
    case 9:
      increaseResource("Urchin");
      break;
    case 10:
      increaseResource("Rocktail");
      break;
    }
  }
  
  wood = (int)random(1000);
  
  if (wood >= 0 && wood < 350 - bonus) {
    increaseResource("Crayfish");
  } else if (wood >= 350 - bonus && wood < 550 - bonus) {
    increaseResource("Trout");
  } else if (wood >= 550 - bonus && wood < 700 - bonus) {
    increaseResource("Bass");
  } else if (wood >= 700 - bonus && wood < 825 - bonus) {
    increaseResource("Tuna");
  } else if (wood >= 825 - bonus && wood < 900 - bonus) {
    increaseResource("Lobster");
  } else if (wood >= 900 - bonus && wood < 950 - bonus) {
    increaseResource("Swordfish");
  } else if (wood >= 950 - bonus && wood < 985 - bonus) {
    increaseResource("Shark");
  } else if (wood >= 985 - bonus && wood < 995 - bonus) {
    increaseResource("Monkfish");
  } else if (wood >= 995 - bonus && wood < 1000 - bonus) {
    increaseResource("Urchin");
  } else if (wood >= 1000 - bonus && wood < 1000) {
    increaseResource("Rocktail");
  }
}

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
  
  if (wood >= 0 && wood < 350) {
    increaseResource("Crayfish");
  } else if (wood >= 350 && wood < 550) {
    increaseResource("Trout");
  } else if (wood >= 550 && wood < 700) {
    increaseResource("Bass");
  } else if (wood >= 700 && wood < 825) {
    increaseResource("Tuna");
  } else if (wood >= 825 && wood < 900) {
    increaseResource("Lobster");
  } else if (wood >= 900 && wood < 950) {
    increaseResource("Swordfish");
  } else if (wood >= 950 && wood < 985) {
    increaseResource("Shark");
  } else if (wood >= 985 && wood < 995) {
    increaseResource("Monkfish");
  } else if (wood >= 995 && wood < 1000) {
    increaseResource("Urchin");
  } else if (wood >= 1000 && wood < 1000) {
    increaseResource("Rocktail");
  }
}
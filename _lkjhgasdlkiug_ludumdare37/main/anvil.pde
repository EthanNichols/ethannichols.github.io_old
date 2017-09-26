
PImage anvil;

void createAnvil() {
  anvil = loadImage("images/anvil.png");
}

void drawAnvil() {
  image(anvil, width / 2 - room.width / 2, height - room.height);
}

void craft() {
  int bestAxe = 0;
  int bestHoe = 0;
  int bestPic = 0;
  int bestRod = 0;
  
  for (int i=0; i<slot.length; i++) {
    if (slot[i].gridX == 0) {
      if (slot[i].gridY > bestAxe && slot[i].itemAmount > 0) {
        bestAxe = slot[i].gridY + 1;
      }
    } else if (slot[i].gridX == 1) {
      if (slot[i].gridY > bestRod && slot[i].itemAmount > 0) {
        bestRod = slot[i].gridY + 1;
      }
      
    } else if (slot[i].gridX == 2) {
      if (slot[i].gridY > bestPic && slot[i].itemAmount > 0) {
        bestPic = slot[i].gridY + 1;
      }
      
    } else if (slot[i].gridX == 3) {
      if (slot[i].gridY > bestHoe && slot[i].itemAmount > 0) {
        bestHoe = slot[i].gridY + 1;
      }
    }
  }
  
  tools[3].newTool(bestAxe, "axe");
  tools[2].newTool(bestRod, "rod");
  tools[1].newTool(bestPic, "pic");
  tools[0].newTool(bestHoe, "hoe");
  
  for (int i=0; i<slot.length; i++) {
    slot[i].itemAmount = 0;
  }
} 
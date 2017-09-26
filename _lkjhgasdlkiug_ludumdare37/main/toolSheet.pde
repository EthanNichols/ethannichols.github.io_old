
toolSheet[] tools = {};

PImage toolSlot;

class toolSheet {
  int gridX;
  int gridY;
  int bonus;
  PImage tool;

  toolSheet(int x, int y) {
    gridX = x;
    gridY = y;
  }

  void display() {
    image(toolSlot, gridX * toolSlot.width + 10, 50);
    if (tool != null) {
      image(tool, gridX * toolSlot.width + 10, 50);
    }
  }

  void newTool(int level, String toolType) {
    
    text(toolType, width / 2, height / 2);
    
    bonus = level * 5;

    switch(toolType) {
    case "axe":
      tool = loadImage("images/axe/axe" + level + ".png");
      break;
    case "rod":
      tool = loadImage("images/rod/rod" + level + ".png");
      break;
    case "pic":
      tool = loadImage("images/pic/pic" + level + ".png");
      break;
    case "hoe":
      tool = loadImage("images/hoe/hoe" + level + ".png");
      break;
    }
  }
}

void createToolSheet() {

  toolSlot = loadImage("images/inventory.png");

  for (int x=0; x<4; x++) {
    for (int y=0; y<1; y++) {
      tools[x + y * 4] = new toolSheet(x, y);
    }
  }
}

void drawToolSheet() {
  for (int i=0; i<tools.length; i++) {
    tools[i].display();
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("Tools", 205, 25);
}
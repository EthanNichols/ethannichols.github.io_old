
toolSheet[] tools = {};

PImage toolSlot;

class toolSheet {
  int gridX;
  int gridY;
  
  
  toolSheet(int x, int y) {
    gridX = x;
    gridY = y;
  }
  
  void display() {
    image(toolSlot, gridX * toolSlot.width + 10, 50);
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
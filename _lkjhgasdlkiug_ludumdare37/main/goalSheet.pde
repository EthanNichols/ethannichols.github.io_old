
goalSheet[] slot = {};

PImage slotImage;

class goalSheet {
  int gridX;
  int gridY;

  String itemName;
  PImage item;
  int itemAmount;

  goalSheet(int x, int y) {
    gridX = x;
    gridY = y;
    itemAmount = 0;
  }

  void display() {
    image(slotImage, width - (gridX + 1) * slotImage.width - 10, 50 + gridY * slotImage.height);
    if (item != null && itemAmount > 0) {
      image(item, width - (gridX + 1) * slotImage.width - 10, 50 + gridY * slotImage.height);
    }
  }

  void assignItem() {
    if (gridX == 0) {
      switch(gridY) {
      case 0:
        itemName = "Normal Wood";
        item = loadImage("images/wood/normalWood.png");
        break;
      case 1:
        itemName = "Oak Wood";
        item = loadImage("images/wood/oakWood.png");
        break;
      case 2:
        itemName = "Willow Wood";
        item = loadImage("images/wood/willowWood.png");
        break;
      case 3:
        itemName = "Maple Wood";
        item = loadImage("images/wood/mapleWood.png");
        break;
      case 4:
        itemName = "Mahagony Wood";
        item = loadImage("images/wood/mahagonyWood.png");
        break;
      case 5:
        itemName = "Magic Wood";
        item = loadImage("images/wood/magicWood.png");
        break;
      case 6:
        itemName = "Cursed Magic Wood";
        item = loadImage("images/wood/cursedMagicWood.png");
        break;
      case 7:
        itemName = "Blood Wood";
        item = loadImage("images/wood/bloodWood.png");
        break;
      case 8:
        itemName = "Elder Wood";
        item = loadImage("images/wood/elderWood.png");
        break;
      case 9:
        itemName = "Crystal Wood";
        item = loadImage("images/wood/crystalWood.png");
        break;
      }
    } else if (gridX == 1) {
      switch(gridY) {
      case 0:
        itemName = "Crayfish";
        item = loadImage("images/fish/crayfish.png");
        break;
      case 1:
        itemName = "Trout";
        item = loadImage("images/fish/trout.png");
        break;
      case 2:
        itemName = "Bass";
        item = loadImage("images/fish/bass.png");
        break;
      case 3:
        itemName = "Tuna";
        item = loadImage("images/fish/tuna.png");
        break;
      case 4:
        itemName = "Lobster";
        item = loadImage("images/fish/lobster.png");
        break;
      case 5:
        itemName = "Swordfish";
        item = loadImage("images/fish/swordfish.png");
        break;
      case 6:
        itemName = "Shark";
        item = loadImage("images/fish/shark.png");
        break;
      case 7:
        itemName = "Monkfish";
        item = loadImage("images/fish/monkfish.png");
        break;
      case 8:
        itemName = "Urchin";
        item = loadImage("images/fish/urchin.png");
        break;
      case 9:
        itemName = "Rocktail";
        item = loadImage("images/fish/rocktail.png");
        break;
      }
    } else if (gridX == 2) {
      switch(gridY) {
      case 0:
        itemName = "Copper Ore";
        item = loadImage("images/ore/copperOre.png");
        break;
      case 1:
        itemName = "Iron Ore";
        item = loadImage("images/ore/ironOre.png");
        break;
      case 2:
        itemName = "Silver Ore";
        item = loadImage("images/ore/silverOre.png");
        break;
      case 3:
        itemName = "Coal Ore";
        item = loadImage("images/ore/coalOre.png");
        break;
      case 4:
        itemName = "Gold Ore";
        item = loadImage("images/ore/goldOre.png");
        break;
      case 5:
        itemName = "Mithril Ore";
        item = loadImage("images/ore/mithrilOre.png");
        break;
      case 6:
        itemName = "Lunar Ore";
        item = loadImage("images/ore/lunarOre.png");
        break;
      case 7:
        itemName = "Adamantite Ore";
        item = loadImage("images/ore/adamantiteOre.png");
        break;
      case 8:
        itemName = "Runite Ore";
        item = loadImage("images/ore/runiteORe.png");
        break;
      case 9:
        itemName = "Currupted Ore";
        item = loadImage("images/ore/curruptedOre.png");
        break;
      }
    } else if (gridX == 3) {
      switch(gridY) {
      case 0:
        itemName = "Potatos";
        item = loadImage("images/plants/potatos.png");
        break;
      case 1:
        itemName = "Cabbage";
        item = loadImage("images/plants/cabbages.png");
        break;
      case 2:
        itemName = "Corn";
        item = loadImage("images/plants/corn.png");
        break;
      case 3:
        itemName = "Strawberry";
        item = loadImage("images/plants/strawberry.png");
        break;
      case 4:
        itemName = "Watermelon";
        item = loadImage("images/plants/watermelon.png");
        break;
      case 5:
        itemName = "Barley";
        item = loadImage("images/plants/barley.png");
        break;
      case 6:
        itemName = "Apple";
        item = loadImage("images/plants/apple.png");
        break;
      case 7:
        itemName = "Pineapple";
        item = loadImage("images/plants/pineapple.png");
        break;
      case 8:
        itemName = "Cocoa Beans";
        item = loadImage("images/plants/cocoaBeans.png");
        break;
      case 9:
        itemName = "Dragonfruit";
        item = loadImage("images/plants/dragonfruit.png");
        break;
      }
    }
  }
}

void createGoalSheet() {

  slotImage = loadImage("images/inventory.png");

  for (int x=0; x<4; x++) {
    for (int y=0; y<10; y++) {
      slot[x + y * 4] = new goalSheet(x, y);
    }
  }

  for (int i=0; i<slot.length; i++) {
    slot[i].assignItem();
  }
}

void drawGoalSheet() {
  for (int i=0; i<slot.length; i++) {
    slot[i].display();
  }

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("Resources", width - 205, 25);
}

void increaseResource(String resource) {
  for (int i=0; i<slot.length; i++) {
    if (slot[i].itemName == resource) {
      slot[i].itemAmount++;
    }
  }
}
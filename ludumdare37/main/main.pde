//Pre-load all of the images in javascript //<>//
/* @pjs preload="images/room.png, images/waterFall1.png, images/waterFall2.png, images/waterFall3.png, images/rock.png, images/tree.png, images/inventory.png, images/player.png, images/farm.png"; *///<>// //<>//
/* @pjs preload="images/ore/adamantiteOre.png, images/ore/coalOre.png, images/ore/copperOre.png, images/ore/curruptedOre.png, images/ore/goldOre.png, images/ore/ironOre.png, images/ore/lunarOre.png, images/ore/mithrilOre.png, images/ore/runiteOre.png, images/ore/silverOre.png"; *///<>//
/* @pjs preload="images/fish/bass.png, images/fish/crayfish.png, images/fish/lobster.png, images/fish/monkfish.png, images/fish/rocktail.png, images/fish/shark.png, images/fish/swordfish.png, images/fish/trout.png, images/fish/tuna.png, images/fish/urchin.png"; *///<>//
/* @pjs preload="images/plants/apple.png, images/plants/barley.png, images/plants/cabbages.png, images/plants/cocoaBeans.png, images/plants/corn.png, images/plants/dragonfruit.png, images/plants/pineapple.png, images/plants/potatoes.png, images/plants/strawberry.png, images/plants/watermelon.png"; *///<>//
/* @pjs preload="images/wood/bloodWood.png, images/wood/crystalWood.png, images/wood/cursedMagicWood.png, images/wood/magicWood.png, images/wood/mahagonyWood.png, images/wood/mapleWood.png, images/wood/normalWood.png, images/wood/oakWood.png, images/wood/willowWood.png, images/wood/elderWood.png"; *///<>//

PImage room;

void setup() {
  size(1920, 1080);

  room = loadImage("images/room.png");

  createWaterFall();
  createRock();
  createTree();
  createFarm();
  createAnvil();
  
  createGoalSheet();
  createToolSheet();
  
  createBar();
  createPlayer();
}

void draw() {
  background(25, 76, 128);

  image(room, width / 2 - room.width / 2, height - room.height);

  drawWaterFall();
  drawFarm();
  
  if (player1.yPos <= -225) {
    drawPlayer();
  }
  
  drawRock();
  drawTree();
  
  if (player1.yPos > -225) {
    drawPlayer();
  }
  
  drawAnvil();
  
  drawGoalSheet();
  drawToolSheet();
  drawBar();
  
  player1.move();
}

void keyPressed() {
  playerKey(key, true);
}

void keyReleased() {
  playerKey(key, false);
}
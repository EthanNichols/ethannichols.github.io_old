//Pre-load all of the images in javascript //<>// //<>// //<>//
/* @pjs preload="images/room.png, images/waterFall1.png, images/waterFall2.png, images/waterFall3.png, images/rock.png, images/tree.png, images/inventory.png, images/player.png, images/farm.png, images/door.png"; *///<>// //<>// //<>// //<>//
/* @pjs preload="images/ore/adamantiteOre.png, images/ore/coalOre.png, images/ore/copperOre.png, images/ore/curruptedOre.png, images/ore/goldOre.png, images/ore/ironOre.png, images/ore/lunarOre.png, images/ore/mithrilOre.png, images/ore/runiteOre.png, images/ore/silverOre.png"; *///<>//
/* @pjs preload="images/fish/bass.png, images/fish/crayfish.png, images/fish/lobster.png, images/fish/monkfish.png, images/fish/rocktail.png, images/fish/shark.png, images/fish/swordfish.png, images/fish/trout.png, images/fish/tuna.png, images/fish/urchin.png"; *///<>//
/* @pjs preload="images/plants/apple.png, images/plants/barley.png, images/plants/cabbages.png, images/plants/cocoaBeans.png, images/plants/corn.png, images/plants/dragonfruit.png, images/plants/pineapple.png, images/plants/potatoes.png, images/plants/strawberry.png, images/plants/watermelon.png"; *///<>//
/* @pjs preload="images/wood/bloodWood.png, images/wood/crystalWood.png, images/wood/cursedMagicWood.png, images/wood/magicWood.png, images/wood/mahagonyWood.png, images/wood/mapleWood.png, images/wood/normalWood.png, images/wood/oakWood.png, images/wood/willowWood.png, images/wood/elderWood.png"; *///<>//
/* @pjs preload="images/axe/axe1.png, images/axe/axe2.png, images/axe/axe3.png, images/axe/axe4.png, images/axe/axe5.png, images/axe/axe6.png, images/axe/axe7.png, images/axe/axe8.png, images/axe/axe9.png, images/axe/axe10.png,"; *///<>//
/* @pjs preload="images/hoe/hoe1.png, images/hoe/hoe2.png, images/hoe/hoe3.png, images/hoe/hoe4.png, images/hoe/hoe5.png, images/hoe/hoe6.png, images/hoe/hoe7.png, images/hoe/hoe8.png, images/hoe/hoe9.png, images/hoe/hoe10.png,"; *///<>//
/* @pjs preload="images/pic/pic1.png, images/pic/pic2.png, images/pic/pic3.png, images/pic/pic4.png, images/pic/pic5.png, images/pic/pic6.png, images/pic/pic7.png, images/pic/pic8.png, images/pic/pic9.png, images/pic/pic10.png,"; *///<>//
/* @pjs preload="images/rod/rod1.png, images/rod/rod2.png, images/rod/rod3.png, images/rod/rod4.png, images/rod/rod5.png, images/rod/rod6.png, images/rod/rod7.png, images/rod/rod8.png, images/rod/rod9.png, images/rod/rod10.png,"; *///<>//

PImage room;

float timer;
boolean endGame = false;

void setup() {
  size(1920, 1080);

  room = loadImage("images/room.png");

  createWaterFall();
  createRock();
  createTree();
  createFarm();
  createAnvil();
  createDoor();
  
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
  drawDoor();
  
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
  
  if (endGame) {
    endScreen();
  } else { //<>// //<>//
    timer = millis() / 1000;
    textAlign(LEFT, CENTER);
    fill(255);
    text((int)(timer) + " seconds ", 10, height - 50);
  }
  
  player1.move();
}

void keyPressed() {
  playerKey(key, true);
}

void keyReleased() {
  playerKey(key, false);
}
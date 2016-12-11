
String information;
int progress = 0;
int treeCutting = 0;
int mining = 0;
int fishing = 0;
int farming = 0;
int maxProgress = 1;

void createBar() {
}

void drawBar() {

  textAlign(CENTER, CENTER);
  textSize(40);
  text(information, width / 2, 25);

  if (information != "") {
    fill(255);
    rect(width / 4, 50, width / 2, 25);

    fill(0, 255, 0);
    rect(width / 4, 50, ((width / 2) / maxProgress) * progress, 25);
  }

  if (progress >= maxProgress) {
    progress = 0;

    if (player1.resource == "tree") {
      treeCut();
      treeCutting = 0;
    } else if (player1.resource == "stone") {
      stoneMined();
      mining = 0;
    } else if (player1.resource == "fish") {
      fishCaught();
      fishing = 0;
    } else if (player1.resource == "farm") {
      plantHarvested();
      farming = 0;
    }
  }

  setInformation();
}

void mineResource() {
  progress++;

  if (player1.resource == "tree") {
    treeCutting = progress;
  } else if (player1.resource == "stone") {
    mining = progress;
  } else if (player1.resource == "fish") {
    fishing = progress;
  } else if (player1.resource == "farm") {
    farming = progress;
  } else if (player1.resource == "anvil") {
    craft();
  }
}

void setInformation() {
  if (player1.resource == "tree") {
    information = "Cut down tree";
    progress = treeCutting;
  } else if (player1.resource == "stone") {
    information = "Mine Ores";
    progress = mining;
  } else if (player1.resource == "fish") {
    information = "Fishing";
    progress = fishing;
  } else if (player1.resource == "farm") {
    information = "Planting and Harvesting";
    progress = farming;
  } else if (player1.resource == "anvil") {
    information = "Craft a Tool";
  } else {
    information = "";
    progress = 0;
  }
}
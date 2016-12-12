
String information;
float progress = 0;
int treeCutting = 0;
int mining = 0;
int fishing = 0;
int farming = 0;
int maxProgress = 100;

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
    } else if (player1.resource == "anvil") {
      craft();
    } else if (player1.resource == "exit") {
      endGame = true;
    }
  }

  setInformation();
}

void mineResource() {

  if (player1.resource == "tree") {
    progress += tools[3].bonus / 5 + 1;
  } else if (player1.resource == "stone") {
    progress += tools[1].bonus / 5 + 1;
  } else if (player1.resource == "fish") {
    progress += tools[2].bonus / 5 + 1;
  } else if (player1.resource == "farm") {
    progress += tools[0].bonus / 5 + 1;
  } else if (player1.resource == "anvil") {
    progress+= maxProgress / 20;
  } else if (player1.resource == "exit") {
    
    boolean allResources = true;

    for (int i=0; i<slot.length; i++) {
      if (slot[i].itemAmount == 0) {
        allResources = false;
      }
    }

    if (allResources) {
      progress++;
    }
  }

  if (player1.resource == "tree") {
    treeCutting = (int)progress;
  } else if (player1.resource == "stone") {
    mining = (int)progress;
  } else if (player1.resource == "fish") {
    fishing = (int)progress;
  } else if (player1.resource == "farm") {
    farming = (int)progress;
  }
}

void setInformation() {
  if (player1.resource == "tree") {
    information = "Cut down Tree";
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
  } else if (player1.resource == "exit") {

    boolean allResources = true;

    for (int i=0; i<slot.length; i++) {
      if (slot[i].itemAmount == 0) {
        allResources = false;
      }
    }

    if (allResources) {
      information = "Exit the room";
    } else {
      information = "Collect all of the resources to exit the room";
    }
  } else {
    information = "";
    progress = 0;
  }
}
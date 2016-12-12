
PImage tree;

void createTree() {
  tree = loadImage("images/tree.png");
}

void drawTree() {
  image(tree, width / 2 - room.width / 2, height - room.height);
}

void treeCut() {
  int wood = (int)random(1000);
  
  int bonus = tools[3].bonus;
  
  if (bonus > 45) {
    wood = (int)random(10) + 1;

    switch(wood) {
    case 1:
      increaseResource("Normal Wood");
      break;
    case 2:
      increaseResource("Oak Wood");
      break;
    case 3:
      increaseResource("Willow Wood");
      break;
    case 4:
      increaseResource("Maple Wood");
      break;
    case 5:
      increaseResource("Mahagony Wood");
      break;
    case 6:
      increaseResource("Magic Wood");
      break;
    case 7:
      increaseResource("Cursed Magic Wood");
      break;
    case 8:
      increaseResource("Blood Wood");
      break;
    case 9:
      increaseResource("Elder Wood");
      break;
    case 10:
      increaseResource("Crystal Wood");
      break;
    }
  }
  
  wood = (int)random(1000);
  
  if (wood >= 0 && wood < 350 - bonus) {
    increaseResource("Normal Wood");
  } else if (wood >= 350 - bonus && wood < 550 - bonus) {
    increaseResource("Oak Wood");
  } else if (wood >= 550 - bonus && wood < 700 - bonus) {
    increaseResource("Willow Wood");
  } else if (wood >= 700 - bonus && wood < 825 - bonus) {
    increaseResource("Maple Wood");
  } else if (wood >= 825 - bonus && wood < 900 - bonus) {
    increaseResource("Mahagony Wood");
  } else if (wood >= 900 - bonus && wood < 950 - bonus) {
    increaseResource("Magic Wood");
  } else if (wood >= 950 - bonus && wood < 985 - bonus) {
    increaseResource("Cursed Magic Wood");
  } else if (wood >= 985 - bonus && wood < 995 - bonus) {
    increaseResource("Blood Wood");
  } else if (wood >= 995 - bonus && wood < 1000 - bonus) {
    increaseResource("Elder Wood");
  } else if (wood >= 1000 - bonus && wood < 1000) {
    increaseResource("Crystal Wood");
  }
}
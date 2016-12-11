
PImage tree;

void createTree() {
  tree = loadImage("images/tree.png");
}

void drawTree() {
  image(tree, width / 2 - room.width / 2, height - room.height);
}

void treeCut() {
  int wood = (int)random(1000);
  
  if (wood >= 0 && wood < 350) {
    increaseResource("Normal Wood");
  } else if (wood >= 350 && wood < 550) {
    increaseResource("Oak Wood");
  } else if (wood >= 550 && wood < 700) {
    increaseResource("Willow Wood");
  } else if (wood >= 700 && wood < 825) {
    increaseResource("Maple Wood");
  } else if (wood >= 825 && wood < 900) {
    increaseResource("Mahagony Wood");
  } else if (wood >= 900 && wood < 950) {
    increaseResource("Magic Wood");
  } else if (wood >= 950 && wood < 985) {
    increaseResource("Cursed Magic Wood");
  } else if (wood >= 985 && wood < 995) {
    increaseResource("Blood Wood");
  } else if (wood >= 995 && wood < 1000) {
    increaseResource("Elder Wood");
  } else if (wood >= 1000 && wood < 1000) {
    increaseResource("Crystal Wood");
  }
}
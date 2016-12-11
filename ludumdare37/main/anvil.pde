
PImage anvil;

void createAnvil() {
  anvil = loadImage("images/anvil.png");
}

void drawAnvil() {
  image(anvil, width / 2 - room.width / 2, height - room.height);
}

void craft() {
  text("crafting", width / 2, height / 2);
} 
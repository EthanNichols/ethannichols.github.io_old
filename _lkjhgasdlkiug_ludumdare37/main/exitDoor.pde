
PImage door;

void createDoor() {
  door = loadImage("images/door.png");
}

void drawDoor() {
  image(door, width / 2 - room.width / 2, height - room.height);
}

void endScreen() {
  
  background(0);
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  
  text("Thank you for playing!", width / 2, height / 9);
  
  text("It took you:", width / 2, (height / 9) * 2.5);
  text((int)(timer / 60) + " minutes and " + (int)timer % 60 + " seconds",  width / 2, (height / 9) * 3);
  text("To leave the room", width / 2, (height / 9) * 3.5);
  
  text("Created in under 48 hours", width / 2, (height / 9) * 6.5);
  text("For Ludum Dare 37: 'One Room'", width / 2, (height / 9) * 7);
  text("Programmer and Artist:", width / 2, (height / 9) * 8);
  text("Ethan Nichols", width / 2, (height / 9) * 8.5);
}
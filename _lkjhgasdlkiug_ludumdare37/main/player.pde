player player1;

PImage playerImage;

boolean moveup = false;
boolean moveleft = false;
boolean movedown = false;
boolean moveright = false;

class player {
  int xPos;
  int yPos;
  String resource;
  int animation;

  player() {
    xPos = 0;
    yPos = -100;
    resource = null;
    animation = 0;
  }

  void display() {
    image(playerImage, width / 2 - playerImage.width / 2 + xPos, height / 2 + yPos + 375);
  }

  void move() {    

    int speed = 2;
    if (moveup) {
      yPos-= speed;
    }
    if (moveleft) {
      xPos-= speed;
    }
    if (movedown) {
      yPos+= speed;
    }
    if (moveright) {
      xPos+= speed;
    }

    if (xPos <= yPos * 2) {
      xPos = yPos * 2;
    }
    if (xPos >= -yPos * 2) {
      xPos = -yPos * 2;
    }

    if (xPos <= (-400 - yPos) * 2) {
      xPos = (-400 - yPos) * 2;
    }
    if (xPos >= -(-400 - yPos) * 2) {
      xPos = -(-400 - yPos) * 2;
    }

    if (yPos > 0) {
      yPos = 0;
    } else if (yPos < -400) {
      yPos = -400;
    }
  }

  void setResource() {
    if (xPos > -125 &&
      xPos < 75 &&
      yPos < -175 &&
      yPos > -275) {
      resource = "tree";
    } else if (xPos > -400 &&
      xPos < -280 &&
      yPos < -165 &&
      yPos > -240) {
      resource = "stone";
    } else if (xPos >= -(-330 - yPos) * 2) {
      resource = "fish";
    } else if (xPos > 75 &&
      xPos < 250 &&
      yPos < 0 &&
      yPos > -140) {
      resource = "farm";
      
    } else if (xPos > -50 &&
      xPos < 50 &&
      yPos < 10 &&
      yPos > -60) {
      resource = "anvil";
      
    } else if (xPos > -250 &&
      xPos < -150 &&
      yPos < -300 &&
      yPos > -350) {
      resource = "exit";
      
    } else {
      resource = null;
    }
  }
}

void createPlayer() {
  playerImage = loadImage("images/player.png");

  player1 = new player();
}

void playerKey(char move, boolean state) {
  switch(move) {
  case 'w':
    moveup = state;
    break;

  case 'a':
    moveleft = state;
    break;

  case 's':
    movedown = state;
    break;

  case 'd':
    moveright = state;
    break;

  case ' ':
    mineResource();
    break;
  }
}

void drawPlayer() {
  player1.display();

  player1.setResource();
}
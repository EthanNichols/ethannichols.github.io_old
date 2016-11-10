int numberLeaves = 1000;
int[] xPos = new int[numberLeaves];
int[] yPos = new int[numberLeaves];
color[] leafColor = new color[numberLeaves];

void setup()
{
  // setup window size
  size(600, 600, P2D);
  
  noStroke();
  // make my leaves
  for(int i=0;i<numberLeaves;i=i+1)
  {
    xPos[i] = (int) random(1,600);
    yPos[i] = (int) random(-5000,600);
    leafColor[i] = color((int)random(100,255),(int)random(0,140),0); 
  }
}

void draw()
{
  // draw the sky
  background(192);
  // draw the ground
  DrawGround();
  // draw leaves
  DrawLeaves();
  // move leaves
  MoveLeaves();
}

void DrawGround()
{
  fill(100,255,100);
  rect(0,500,600,100);
}

void DrawLeaf(int leaf)
{
  fill(leafColor[leaf]);
  ellipse(xPos[leaf], yPos[leaf], 50,25);
}

void DrawLeaves()
{
  for(int i=0;i<numberLeaves;i=i+1)
  {
    DrawLeaf(i);
  }
}

void MoveLeaves()
{
  for(int i = 0;i<numberLeaves;i=i+1)
  {
    if(yPos[i] < 500)
      yPos[i] = yPos[i] + (int)random(1,10);
  }
}
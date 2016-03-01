int circleX = 0;
int circleY = 150;
int circleWidth = 25;
int circleHeight = 25;

void setup()
{
  size(500,300);
}

void draw()
{
  background(255);
  circleX += 5;
  ellipse(circleX, circleY, circleWidth, circleHeight);
}
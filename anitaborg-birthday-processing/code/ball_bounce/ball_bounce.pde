int circleX = 0;
int circleY = 150;
int circleWidth = 25;
int circleHeight = 25;

int speed = 5;

void setup()
{
  size(500,300);
}

void draw()
{
  background(255);
  circleX += speed;
  if (circleX > width)
  {
    speed = -5;
  }
  else if (circleX < 0)
  {
    speed = 5;
  }
  
  ellipse(circleX, circleY, circleWidth, circleHeight);
}
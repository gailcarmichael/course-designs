int colorToUse = 1;

void setup()
{
  size(200,200);
}

void draw()
{
  background(255);
  
  color buttonColor = color(240,0,0);
  if (colorToUse == 2)
  {
    buttonColor = color(0,240,0);
  }
  
  fill(buttonColor);
  ellipse(width/2, height/2, 50, 50);
}

void mouseClicked()
{
  if (colorToUse == 1)
  {
    colorToUse = 2;
  }
  else
  {
    colorToUse = 1;
  }
}
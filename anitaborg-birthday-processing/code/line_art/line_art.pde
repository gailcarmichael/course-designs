void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  color lineColor = color(mouseX, mouseY, mouseX+mouseY);
  stroke(lineColor);
  line(0, 0, mouseX, mouseY);
}
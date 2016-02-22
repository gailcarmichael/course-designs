/////
// Photo Painting
// (Gail Carmichael)
//
// Dragging the mouse results in picking up colour information about the 
// image associated with the sketch and drawing a circle on the screen.
/////


// Variables
PImage backgroundImage;
String imageName = "bunny.jpg";
color[][] circleColors;
int circleRadius = 10;

// Initialize the program
void setup()
{
  // Load the image
  backgroundImage = loadImage(imageName);
  
  // Load its pixels so we can access them later
  loadPixels();
  
  // Create a new array to store the colors that will be used
  // when drawing circles
  //circleColors = new color[backgroundImage.width][backgroundImage.height];
  circleColors = new color[333][500];
  
  // Set the default fill color to be a negative number so we
  // know to skip it
  for (int x = 0; x < circleColors.length; x++)
  {
    for (int y=0; y < circleColors[x].length; y++)
    {
      circleColors[x][y] = -1;
    }
  }
  
  // Set up the window to be the same size as the image
  //size(backgroundImage.width, backgroundImage.height);
  size(333,500);
  
  background(255);
}


// What to do when the mouse is dragged
void mouseDragged()
{
  if (mouseX >= 0 && mouseX < width &&
      mouseY >= 0 && mouseY < height)
  {
    // Figure out what the color is in the image where the mouse is
    int imageIndex = mouseY * backgroundImage.width + mouseX;
    color c = backgroundImage.pixels[imageIndex];
    
    // Save the color
    int x = (int)mouseX;
    int y = (int)mouseY;
    circleColors[x][y] = c;
  }
}


// What to draw each frame
void draw()
{
  background(255);
  
  // Draw a circle centered on the mouse location with the colour
  noStroke();
  for (int x = 0; x < circleColors.length; x++)
  {
    for (int y=0; y < circleColors[x].length; y++)
    {
      if (circleColors[x][y] != -1)
      {
        fill(circleColors[x][y]);
        ellipse(x, y, circleRadius, circleRadius);
      }
    }
  }
  
}

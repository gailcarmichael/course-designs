/*
------------------------------------
Simple Character AI
------------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It introduces state machines, while loops and
arrays.
 
The idea is partially inspired by a pet sheep
many of us had on our desktops in the 90's: 
http://www.youtube.com/watch?v=xPNAxHrYGrs
 
*/


PImage sheepImage;
PImage sheepTeaImage;

int sheepX;
int sheepY;
float sheepDirection; // in radians

final int sheepSpeed = 3;

final int sheepStateWander = 1;
final int sheepStateStop = 2;
final int sheepStateColors = 3;

final int sheepMouseThreshold = 50;

int sheepState;

final color[] listOfColors =
{
  color(227, 41, 41),   // red
  color(214, 122, 224), // purple
  color(115, 111, 234), // blue
  color(83, 216, 97),   // green
  color(252, 255, 95),  // yellow
  color(211, 133, 15),  // brown
  color(175, 202, 216), // blue 
};

final int numFramesToShiftColor = 10;
final int circleShift = 40;
int colorStartIndex;

 
// Stuff that gets done just once at the beginning
// of the program. Set up values that either need
// initial settings or that you know won't ever
// need to change.
void setup()
{
  size(500,500);
  
  sheepImage = loadImage("lemmling_Cartoon_sheep.png");
  sheepTeaImage = loadImage("Teeschaf.png");
  imageMode(CENTER);
  
  sheepX = width/2;
  sheepY = height/2;
  sheepDirection = 0;
  sheepState = sheepStateWander;
  
  colorStartIndex = 0;
}


// This functions gets called once a "frame" if you
// look at the program like an animation.  Processing
// draws things at a certain framerate, which dictates
// how many "frames per second" are drawn.
void draw()
{
  background(255);
  updateSheepState();
  drawSheep();
  moveSheep();
}


// This function checks whether the sheep should be changing
// state.
void updateSheepState()
{
  // Sheep is currently in wandering mode
  if (sheepState == sheepStateWander)
  {
    // If the mouse gets close enough, we should transition
    // to stopped mode
    if (dist(mouseX, mouseY, sheepX, sheepY) < sheepMouseThreshold)
    {
      sheepState = sheepStateStop;
    }
  }
 
  // Sheep is currently in stopped mode
  else if (sheepState == sheepStateStop)
  {
    // If the mouse gets too far away, we should transition
    // to wander mode
    if (dist(mouseX, mouseY, sheepX, sheepY) >= sheepMouseThreshold)
    {
      sheepState = sheepStateWander;
    }
   
    // If we are still close enough to the sheep, and the
    // mouse is pressed, switch to colors mode
    else if (mousePressed)
    {
      sheepState = sheepStateColors;
    }
  }
  
  // Sheep is currently in colors mode
  else if (sheepState == sheepStateColors)
  {
      // If the mouse is released at any point, we should
      // switch back to stopped mode
      if (!mousePressed)
      {
        sheepState = sheepStateStop;
      }
      
      // While in colors mode, shift which color we
      // start with every specified number of frames
      else if (frameCount % numFramesToShiftColor == 0)
      {
        colorStartIndex = colorStartIndex + 1;
        if (colorStartIndex >= listOfColors.length)
        {
          colorStartIndex = 0;
        }
      }
  }
}


// This function draws the sheep based on its current
// state.
void drawSheep()
{
  if (sheepState == sheepStateWander)
  {
    image(sheepImage, sheepX, sheepY);
  }
  else
  {
    // Draw the rings first if they are necessary
    // (so the sheep will go on top)
    if (sheepState == sheepStateColors)
    {
      drawRings(sheepX, sheepY, circleShift, 
                listOfColors, colorStartIndex);
    }
    
    // Draw the tea image when the sheep is
    // in 'stop' or 'colors' mode
    image(sheepTeaImage, sheepX, sheepY);
  }
}


// This function draws rings of color emanating from
// the center of the given location.  This is an example
// of a portable function since it only uses variables
// that are either parameters or that are defined inside.
void drawRings(int x, int y, int radiusChange, 
               color[] colors, int startIndex)
{
  float[] corners = {
    dist(x, y, 0, 0), dist(x, y, 0, height),
    dist(x, y, width, 0), dist(x, y, width, height)
  };

  noStroke();
  
  float radius = max(corners);
  int colorIndex = startIndex;
  while (radius > 0)
  {
    fill(colors[colorIndex]);
    colorIndex = (colorIndex + 1);
    if (colorIndex >= colors.length)
    {
      colorIndex = 0;
    }
    
    ellipse(x, y, 2*radius, 2*radius);
    radius -= radiusChange;
  }
}


// This function checks the sheep's current state and
// moves its location if appropriate.
void moveSheep()
{
  // In this mode, we want the sheep to change
  // direction slightly every once in a while
  if (sheepState == sheepStateWander)
  {
    int nextX = sheepX + int(sheepSpeed * cos(sheepDirection));
    int nextY = sheepY + int(sheepSpeed * sin(sheepDirection));
    
    // Now we will update the sheep's direction...

    // Check cross product to determine whether we need
    // to go left or right
    int crossProduct = (nextX - sheepX)*(mouseY - sheepY) -
                       (nextY - sheepY)*(mouseX - sheepX);
                   
    // Finished using both sets of coordinates so we can
    // go ahead and update the sheep's location
    sheepX = nextX;
    sheepY = nextY;
    
    // 5% of the time, we'll turn left or right toward the mouse
    if (random(1) < 0.05)
    {
      final int angleToTurn = 30;
      if (crossProduct < 0) // turn right
      {
        sheepDirection -= radians(angleToTurn 
                                  + random(angleToTurn/4) 
                                  - angleToTurn/8);
      }
      else // turn left
      {
        sheepDirection += radians(angleToTurn 
                                  + random(angleToTurn/4) 
                                  - angleToTurn/8);
      }
    }
  }
}

void keyPressed()
{
  save("example.png");
}
 
 

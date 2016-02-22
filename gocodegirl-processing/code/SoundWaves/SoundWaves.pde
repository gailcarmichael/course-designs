/////
// Sound Waves
// (Gail Carmichael)
//
// When the mouse is clicked, a circle will emanate from the click location
// like a circular wave and a sound will play.  The colour will depend on
// where the mouse was clicked.
/////

// Include sound library
import ddf.minim.*;


// Variables
int initCircleRadius = 5;
int maxCircleRadius = 250;
int deltaCircleRadius = 5;
ArrayList<Circle> circleList = new ArrayList();
AudioSnippet dropletSound1;
AudioSnippet dropletSound2;
Minim minim; // for sound


// Initialize the program
void setup()
{
  size(500,500);
  
  minim = new Minim(this);
  
  dropletSound1 = minim.loadSnippet("water-droplet-1.mp3");
  dropletSound2 = minim.loadSnippet("water-droplet-2.mp3");
}


// What to do after the mouse is clicked
void mouseClicked()
{
  // Add a new circle to the list
  
  Circle circle = new Circle();
  
  circle.c = color(mouseX / 2.0, mouseY / 2.0, 200);
  circle.x = mouseX;
  circle.y = mouseY;
  circle.radius = initCircleRadius;
  
  //println("(x,y): " + mouseX + ", " + mouseY);
  
  circleList.add(circle);
  
  // Play a sound
  dropletSound1.rewind();
  dropletSound1.play();
}


// What to draw each frame
void draw()
{
  // Clear the screen
  background(255,255,255); // white
  
  
  // Draw the circles using a colour that depends on their x and y locations
  
  noFill();
  strokeWeight(3);
  
  // First draw all the current circles and increase their radius for next time...
  for (int circleNum=0; circleNum < circleList.size(); circleNum++)
  {
    Circle currentCircle = circleList.get(circleNum);
    stroke(currentCircle.c);
    ellipse(currentCircle.x, currentCircle.y, currentCircle.radius, currentCircle.radius);
    
    currentCircle.radius = currentCircle.radius + deltaCircleRadius;
  }
  
  // ... then go backwards in the list and delete circles that are too large
  for (int circleNum=circleList.size() - 1; circleNum >= 0; circleNum--)
  {
    Circle currentCircle = circleList.get(circleNum);
    if (currentCircle.radius >= maxCircleRadius)
    {
      circleList.remove(circleNum);
    }
  }
}


// Need to close the audio stuff
void stop()
{
  // always close Minim audio classes when you are done with them
  dropletSound1.close();
  dropletSound2.close();
  minim.stop();
  
  super.stop();
}

/*
------------------------------------
Interactive Painting with Processing
------------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It introduces a new mode for Processing called
active mode (Drawing Pictures with Processing
uses static mode). It also shows how to make
a simple interactive program.
*/


////
// Variables we use everywhere...

// These will be our paint colors
// Note the use of final: this means that
// the value of the variable cannot change
// (as though we sealed its box)
final color redColor = color(240,0,0);
final color greenColor = color(0,240,0);
final color blueColor = color(0,0,240);
final color blankScreenColor = color(255);

// This will keep track of which color
// we are currently using to paint with
color currentColor; 

// This is how big our painting circles should
// be - we don't want it to ever change either
final int paintRadius = 5;



// This function gets called once when the
// program is first run - we should set up
// our window and set default values here
// for variables that will change during the
// program
void setup()
{
  size(500,500);
  background(blankScreenColor);
  
  // Turn off outlines, since we don't need them
  // the entire program
  noStroke();
  
  // Default painting color will be red
  currentColor = redColor;
}


// This function is required for Processing's active
// mode; it is called once every frame
void draw()
{
  // Don't need to do anything for this program,
  // but we still have to include the function
  // in order for Processing to work in active mode
}


// This function will automatically get
// called any time the user presses a key;
// the character of the last key pressed
// will be stored in the variable 'key'
void keyPressed()
{
  // A switch statement checks each case value
  // against the switch value ('key' in this case);
  // when it finds a match, it will run all code
  // until it finds a "break" statement
  switch(key)
  {
    case 'r':
      currentColor = redColor;
      break;
    case 'g':
      currentColor = greenColor;
      break;
    case 'b':
      currentColor = blueColor;
      break;
    case ' ':
      background(blankScreenColor);
      break;
    default:
      // Do nothing
      break;
  }
}


// This function will be called when the user presses
// the mouse button; in our case, this means we want to
// draw circles at the x/y location of the mouse click
void mouseDragged()
{
  fill(currentColor);
  ellipse(mouseX, mouseY, paintRadius, paintRadius);
}

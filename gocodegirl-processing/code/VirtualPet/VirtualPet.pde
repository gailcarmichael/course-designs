/////
// Virtual Pet
// (Gail Carmichael)
//
// A little monster on the bottom of the screen follows your mouse
// and watches you by moving its eyes
/////


// Variables
Monster monster;


// Initialize the program
void setup()
{
  size(500,500);
  background(255);
  
  // Create a monster
  monster = new Monster();
  monster.x = 250;
  monster.y = 400;
}


// What to draw each frame
void draw()
{
  // Clear the background
  background(255);
  
  // Update the monster's location and draw it
  monster.move();
  monster.draw();
}


// What to do when the mouse moves
void mouseMoved()
{
  // Tell the monster to head toward the mouse
  monster.headTowardPoint(mouseX, mouseY);
}

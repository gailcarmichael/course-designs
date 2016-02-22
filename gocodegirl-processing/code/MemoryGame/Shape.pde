class Shape
{
 private int x;
 private int y;

 private color fillColor;
 
 private boolean litUp;
 private boolean pausing;
 private int timerCount;
 
 private int diameter = 100;
 
 final int numFramesBetweenShapes = 30 * 1;
 final int numFramesToLightShape = 30 * 1;
 
 
 // Constructor
 Shape(int newX, int newY, color c)
 {
   x = newX;
   y = newY;
   fillColor = c;
   litUp = false;
   timerCount = 0;
 }
 
 
 // Is this shape currently lit up?
 boolean isLitUp()
 {
   return litUp;
 }
 
 
 // Turn the shape on or off
 void setLitUp(boolean newLitUpValue)
 {
   litUp = newLitUpValue;
 }
 
 
 // Start the display timer, which will show the shape lit up for a certain
 // number of frames, then pause for a certain number, before informing
 // the main program that the timer has expired.
 void startTimer()
 {
   timerCount = 0;
   litUp = true;
   pausing = false;
 }
 
 
 // This should be called each frame
 void timerTick()
 {
   if (!litUp && !pausing) return;
   
   timerCount++;
   
   if (litUp && timerCount >= numFramesToLightShape)
   {
     litUp = false;
     pausing = true;
     timerCount = 0;
   } 
   
   if (pausing)
   {
     if ((showingSequence && atEndOfSequence()) || timerCount >= numFramesBetweenShapes)
     {
       litUp = false;
       pausing = false;
       shapeTimerExpired();
     }
   }
 }
 
 
 // Can be called to cancel the timer, for example if another
 // shape was clicked
 void cancelTimer()
 {
   litUp = false;
   pausing = false;
   timerCount = 0;
 }
 
 
 // Is the timer finished?
 boolean isTimerInProgress()
 {
   return (litUp || pausing);
 }
 
 
 // Put the shape on the screen (call from the main draw())
 void draw()
 {
   // If we wanted to have different shapes, we could draw
   // the appropriate one here; for now, we'll just use circles
   
   stroke(fillColor);
   strokeWeight(5);
   
   fill(fillColor);
   
   if (!isLitUp())
   {
     noFill();
   }
   
   
   ellipse(x, y, diameter, diameter);
 }
 
 
 // Was this shape clicked on?
 boolean wasClicked(int clickX, int clickY)
 {
   return (dist(clickX, clickY, x, y) < diameter/2.0);
 }
}

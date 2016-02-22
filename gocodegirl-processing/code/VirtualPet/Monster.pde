class Monster
{
  int x;
  int y;
  
  int headTowardX = -1;
  int headTowardY = -1;
  
  int stopRadius = 25;
  
  int speed = 10;
  
  int bodyRadius = 35;
  
  int eyeRadius = 10;
  int pupilRadius = 3;
  
  int leftEyeXOffset = -5;
  int leftEyeYOffset = -10;
  
  int rightEyeXOffset = 5;
  int rightEyeYOffset = -10;
  
  int mouthHalfWidth = 10;
  int mouthYOffset = 5;
  
  
  // Put the monster's shapes on the screen (call from
  // the main draw() function)
  void draw()
  {
    stroke(0);
    strokeWeight(3);
    
    fill(240, 10, 0);
    
    ellipse(x, y, bodyRadius, bodyRadius);
    
    // Useful variables for next calculations...
    int leftX = x + leftEyeXOffset;
    int leftY = y + leftEyeYOffset;
    int rightX = x + rightEyeXOffset;
    int rightY = y + rightEyeYOffset;
    
    // Eyes
    fill(255); // white
    ellipse(leftX, leftY, eyeRadius, eyeRadius);
    ellipse(rightX, rightY, eyeRadius, eyeRadius);
    
    // Pupils
    fill(0); // black
    ellipse(leftX, leftY + eyeRadius/2 - 1, pupilRadius, pupilRadius);
    ellipse(rightX, rightY + eyeRadius/2 - 1, pupilRadius, pupilRadius);
    
    // Mouth
    line(x - mouthHalfWidth, y + mouthYOffset,
         x + mouthHalfWidth, y + mouthYOffset);
  }
  
  
  // The main program can tell the monster to go toward this point - 
  // save the info for later when the monster actually moves
  void headTowardPoint(int pointX, int pointY)
  {
    headTowardX = pointX;
    headTowardY = pointY;
  }
  
  
  // When this is called, move the monster once
  void move()
  {
    if (headTowardX >= 0 && headTowardY >= 0)
    {
      // If the monster is close to the pointer, it can stop
      if (dist(x, y, headTowardX, headTowardY) > stopRadius)
      {
        float direction = atan2(headTowardY - y, headTowardX - x);
        
        x = x + int(speed * cos(direction));
        y = y + int(speed * sin(direction));
      }
    }
  }
}

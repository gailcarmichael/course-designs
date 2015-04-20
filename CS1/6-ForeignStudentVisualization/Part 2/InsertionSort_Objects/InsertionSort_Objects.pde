size(500,500);
background(255);


////
// Define the ball's class

class Ball
{
  int x;
  int y;
  int size;
};

////
// Create 5 balls

final Ball[] balls = new Ball[5];
int ballNum = 0;
while (ballNum < balls.length)
{
  balls[ballNum] = new Ball();
  balls[ballNum].x = (int)random(20, width-20);
  balls[ballNum].y = (int)random(20, height-20);
  balls[ballNum].size = (int)random(20, 100);
  
  ballNum++;
}


////
// Sort the balls by size

int currentStartIndex = 1;
while (currentStartIndex < balls.length)
{
  int innerIndex = currentStartIndex;
  while (innerIndex > 0 &&
         balls[innerIndex].size < balls[innerIndex - 1].size)
  {
    // Swap the current "inner indexed" value with the one before it
    Ball temp = balls[innerIndex-1];
    balls[innerIndex-1] = balls[innerIndex];
    balls[innerIndex] = temp;
    
    innerIndex--;
  }
  
  currentStartIndex++;
}


////
// Draw the array of balls (reuse ballNum variable)

textAlign(CENTER, CENTER);

ballNum = 0;
while (ballNum < balls.length)
{
  fill(200);
  ellipse(balls[ballNum].x, balls[ballNum].y, 
          balls[ballNum].size, balls[ballNum].size);

  fill(0);
  text(ballNum, balls[ballNum].x, balls[ballNum].y);
  
  ballNum++;
}

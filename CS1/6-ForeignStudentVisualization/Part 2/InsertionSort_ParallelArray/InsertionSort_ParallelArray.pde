size(500,500);
background(255);


////
// Define the ball's properties

int[] ballX = new int[5];
int[] ballY = new int[5];
int[] ballSize = new int[5];

////
// Create 5 balls

int ballNum = 0;
while (ballNum < ballX.length)
{
  ballX[ballNum] = (int)random(20, width-20);
  ballY[ballNum] = (int)random(20, height-20);
  ballSize[ballNum] = (int)random(20, 100);
  
  ballNum++;
}


////
// Sort the balls by size

int currentStartIndex = 1;
while (currentStartIndex < ballX.length)
{
  int innerIndex = currentStartIndex;
  while (innerIndex > 0 &&
         ballSize[innerIndex] < ballSize[innerIndex - 1])
  {
    // Swap the current "inner indexed" value with the one before it
    
    int temp = ballX[innerIndex-1];
    ballX[innerIndex-1] = ballX[innerIndex];
    ballX[innerIndex] = temp;
    
    temp = ballY[innerIndex-1];
    ballY[innerIndex-1] = ballY[innerIndex];
    ballY[innerIndex] = temp;
    
    temp = ballSize[innerIndex-1];
    ballSize[innerIndex-1] = ballSize[innerIndex];
    ballSize[innerIndex] = temp;
    
    innerIndex--;
  }
  
  currentStartIndex++;
}


////
// Draw the array of balls (reuse ballNum variable)

textAlign(CENTER, CENTER);

ballNum = 0;
while (ballNum < ballX.length)
{
  fill(200);
  ellipse(ballX[ballNum], ballY[ballNum], 
          ballSize[ballNum], ballSize[ballNum]);

  fill(0);
  text(ballNum, ballX[ballNum], ballY[ballNum]);
  
  ballNum++;
}

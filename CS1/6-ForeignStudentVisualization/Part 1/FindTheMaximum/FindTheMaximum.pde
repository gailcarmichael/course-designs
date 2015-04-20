
final int[] numbers = new int[10];

int currentIndex = 0;
while (currentIndex < numbers.length)
{
  numbers[currentIndex] = (int)random(1,20);
  currentIndex++;
}


////
// Find the minimum value and save its index

int maxIndex = 0;
currentIndex = 0;

while (currentIndex < numbers.length)
{
  if (numbers[currentIndex] > numbers[maxIndex])
  {
    maxIndex = currentIndex;
  }
  currentIndex++;
}


////
// Visualize the result rather than return it (since we aren't
// in a function)

size(500, 500);
background(255);
textAlign(CENTER, CENTER);

final int buttonWidth = 40;
final int buttonHeight = 50;

float spaceBetween = (width - (buttonWidth*numbers.length)) /
                     (numbers.length + 1);
                     
int buttonNum = 0;
while (buttonNum < numbers.length)
{
  float x = (buttonNum+1)*spaceBetween + buttonNum*buttonWidth;
  float y = height/2 - buttonHeight/2;
 
  if (buttonNum == maxIndex)
  { 
    fill(240,190,190);
  }
  else
  {
    fill(230);
  }
 
  rect(x, y, buttonWidth, buttonHeight);
       
  fill(0);
  text(numbers[buttonNum], x + buttonWidth/2, y + buttonHeight/2);  
  buttonNum++;
}





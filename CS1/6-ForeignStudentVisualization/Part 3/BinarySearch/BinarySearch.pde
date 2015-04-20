final int[] unsortedNumbers = new int[10];

int currentIndex = 0;
while (currentIndex < unsortedNumbers.length)
{
  unsortedNumbers[currentIndex] = (int)random(1,20);
  currentIndex++;
}

// Sort the array (we'll use the built-in sort this time)
int[] numbers = sort(unsortedNumbers);


// If we choose a value in the range, we are not
// guaranteed to actually find it...
// (you could also experiment with picking a random
//  value in the array to find)
final int valueToFind = 15;


////
// Perform a binary search and find the index of the value to find

int foundIndex = -1;

int left = 0;
int right = numbers.length-1;
int numIterations = 0;

while (left <= right)
{
  numIterations++;
  int mid = (left + ((right - left) / 2));
  if (numbers[mid] < valueToFind)
  {
    left = mid+1;
  }
  else if (numbers[mid] > valueToFind)
  {
    right = mid - 1;
  }
  else
  {
    foundIndex = mid;
    break;
  }
}

println("Number of iterations: " + numIterations);


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
 
  if (buttonNum == foundIndex)
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





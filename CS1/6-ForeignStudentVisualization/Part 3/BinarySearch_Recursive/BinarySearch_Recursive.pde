int numRecursiveCalls = 0;

void setup()
{
  final int[] unsortedNumbers = new int[10];
  int foundIndex;

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


  ///
  // Search!
  foundIndex = binarySearch(numbers, valueToFind, 0, numbers.length-1);
  
  
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
  
  println("Num recursive calls: " + numRecursiveCalls);
}



int binarySearch(int[] list, int valueToFind, int minIndex, int maxIndex)
{
  numRecursiveCalls++;
  
  if (maxIndex < minIndex)
  {
    return -1;
  }
  else
  {
    int mid = (minIndex + ((maxIndex-minIndex)/2));
    
    if (list[mid] < valueToFind)
    {
      return binarySearch(list, valueToFind, mid+1, maxIndex);
    }
    else if (list[mid] > valueToFind)
    {
      return binarySearch(list, valueToFind, minIndex, mid-1);
    }
    else
    {
      return mid;
    }
  }
}





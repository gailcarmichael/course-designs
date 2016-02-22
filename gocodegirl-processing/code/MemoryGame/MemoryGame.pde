/////
// Memory Game
// (by Gail Carmichael)
//
// Players have to remember a sequence of shapes to click on
/////


// Variables

ArrayList<Shape> shapeList;
ArrayList<Shape> memorySequenceList;

boolean gameOver = false;

int maxSequenceLength = 50;

int currentSequenceLength;
boolean showingSequence;
int currentSequenceItemIndex;

Shape currentClickedItem = null; // for during user-click mode
Shape currentSequenceItem = null; // for showing-thesequence mode

PFont font;
String currentTextStatus;
final String memorizeText = "Memorize this...";
final String clickText = "Now you try.";

// Initialize the program
void setup()
{
  size(500,600);
  background(255);
  frameRate(30);
  
  font = loadFont("CharcoalCY-48.vlw");
  textFont(font);
  textSize(48);
  
  
  // Create the game's shapes
  
  shapeList = new ArrayList<Shape>();
  
  // Row 1
  shapeList.add(new Shape(100, 100, color(255,139,0)));
  shapeList.add(new Shape(250, 100, color(11,73,216)));
  shapeList.add(new Shape(400, 100, color(0,214,160)));
  
  // Row 2
  shapeList.add(new Shape(100, 250, color(0,132,99)));
  shapeList.add(new Shape(250, 250, color(158,86,0)));
  shapeList.add(new Shape(400, 250, color(195,212,249)));
  
  // Row 3
  shapeList.add(new Shape(100, 400, color(114,155,249)));
  shapeList.add(new Shape(250, 400, color(107,249,213)));
  shapeList.add(new Shape(400, 400, color(186,124,50)));
  
  
  // Set up the memory sequence list
  memorySequenceList = new ArrayList<Shape>();
  for (int sequenceNum=0; sequenceNum < maxSequenceLength; sequenceNum++)
  {
    Shape next = shapeList.get((int)random(shapeList.size()));
    memorySequenceList.add(next);
  }
  
  
  // Set up the game to show the sequence to memorize first...
  
  showingSequence = true;
  currentSequenceLength = 2;
  
  currentSequenceItemIndex = 0;
  currentSequenceItem = memorySequenceList.get(currentSequenceItemIndex); 
  currentTextStatus = memorizeText;
  currentSequenceItem.startTimer();
}


// What to draw each frame
void draw()
{
  // Clear the background
  background(255);
  
  // Shape timer has ticked
  if (!gameOver)
  {
    if (showingSequence)
    {
      currentSequenceItem.timerTick();
    }
    else
    {
      if (currentClickedItem != null)
      {
        currentClickedItem.timerTick();
      }
    }
  }
  
  // Draw the shapes
  for (int shapeNum=0; shapeNum < shapeList.size(); shapeNum++)
  {
    shapeList.get(shapeNum).draw();
  }
  
  // Add any statuses to the screen
  textAlign(CENTER);
  fill(0);
  text(currentTextStatus, width/2, height - 60);
}


// Handle user clicks
void mouseClicked()
{
  if (gameOver) return;
  
  // We only want to handle clicks if we're done seeing the sequence
  if (!showingSequence)
  {
    // Find the shape the user clicked on
    Shape clickedShape = null;
    for (int shapeNum=0; shapeNum < shapeList.size(); shapeNum++)
    {
      Shape shape = shapeList.get(shapeNum);
      if (shape.wasClicked(mouseX, mouseY))
      {
        if (currentClickedItem != null)
        {
          if (currentClickedItem.isTimerInProgress())
          {
            currentClickedItem.cancelTimer();
            moveSequenceForwardForUser();
          }
        }
        currentClickedItem = shape;
        
        //println("Clicked shape num " + shapeNum + ", sequence index " + currentSequenceItemIndex);
        
        // Check whether answer was correct
        if (isLatestClickCorrect())
        {
          currentClickedItem.startTimer();
        }
        else
        {
          gameOver();
        }
        
        break;
      }
    }
  }
}


// Check whether the user has made a mistake yet
boolean isLatestClickCorrect()
{
  return (currentClickedItem == currentSequenceItem);
}


// Game over!
void gameOver()
{
  currentTextStatus = "Oops! Game over!";
  gameOver = true;
  
  // Visually show that the game is over by lighting up everything
  for (int shapeNum=0; shapeNum < shapeList.size(); shapeNum++)
  {
    shapeList.get(shapeNum).cancelTimer();
    shapeList.get(shapeNum).setLitUp(true);
  }
}


// Check whether the user has reached the end of the sequence
boolean atEndOfSequence()
{
  return currentSequenceItemIndex == currentSequenceLength - 1;
}


// Do this when the user has done something to move the sequence forward
void moveSequenceForwardForUser()
{
  if (atEndOfSequence())
  {
    // Switch back to showing-sequence mode
    showingSequence = true;
    currentSequenceItemIndex = 0;
    currentSequenceItem = memorySequenceList.get(currentSequenceItemIndex);
    currentTextStatus = memorizeText;
    currentSequenceLength++;
    currentSequenceItem.startTimer();
  }
  else
  {
    // Move to the next item
    currentSequenceItemIndex++;
    currentSequenceItem = memorySequenceList.get(currentSequenceItemIndex);
  }
}


// A shape has finished showing itself
void shapeTimerExpired()
{
  if (gameOver) return;
  
  if (showingSequence)
  {
    if (atEndOfSequence())
    {
      // Switch to user click mode
      showingSequence = false;
      currentSequenceItemIndex = 0;
      currentSequenceItem = memorySequenceList.get(currentSequenceItemIndex);
      currentTextStatus = clickText;
    }
    else
    {
      // Show the next item
      currentSequenceItemIndex++;
      currentSequenceItem = memorySequenceList.get(currentSequenceItemIndex);
      currentSequenceItem.startTimer();
    }
  }
  else // user-click mode
  {
    moveSequenceForwardForUser();
  }
}

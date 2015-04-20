/*
------------------------------------
Foreign Student Data Visualization
------------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It introduces Strings, objects, algorithms and
recursion.
 
The program reads in real data about how many
students come from various countries to study
in Canada.  A visual comparison of the top 16
countries is made with circles of varying sizes
and colours.  When you click on a circle, you
will see a line graph with the number of students
from each quarter (2013).  When the 's' key is
pressed, the data will change its sorting order
between number of students and name of country,
both ascending.

This version uses objects to store all the data and now
supports drawing the line graph and resorting data.
 
*/

//////////////////////////////////////////////////
// These variables are for storing the information
// obtained from the open data csv file from
// http://data.gc.ca/data/en/dataset/cdc14bcf-d9b1-4130-b743-6830f25c9b64

class ForeignStudentData
{
  String countryName;
  int[] quarters_2013;
  int total_2013;
}

ForeignStudentData[] countryData;

final String filename = "foreign-student-data.csv";


//////////////////////////////////////////////////
// Data that will help draw the circles

int totalTopNCountries2013;
final int numRows = 4;
final int numCols = 4;

final int maxCircleWidth = 120;
final int maxCircleHeight = 120;

//////////////////////////////////////////////////
// Data that will help draw the line graph

int graphShowingIndex;

//////////////////////////////////////////////////
// Data that will help with sorting

boolean lastSortedOrderWasAlphabetical;






//////////////////////////////////////////////////
// setup
void setup()
{
  size(750,750);
  
  // Get the data from the CSV file
  readData();
  
  // Save how many students there are total for
  // the top 16 countries in 2013 so we don't have
  // to recalculate it all the time
  totalTopNCountries2013 = sumTotalStudentsForTopNCountries(numRows * numCols);
  
  // Set to -1 to indicate that we are not showing data right now
  graphShowingIndex = -1;
  
  // Initial sorted order should be by total number of students
  lastSortedOrderWasAlphabetical = false;
  sortCountryDataByTotalStudents(numRows * numCols);
}


//////////////////////////////////////////////////
// draw
void draw()
{
  background(255);
  
  drawTopNCountries();
  
  if (graphShowingIndex >= 0)
  {
    drawLineGraph(graphShowingIndex);
  }
}


//////////////////////////////////////////////////
// A function that reads in foreign student data from
// the given csv file.  This comes from the 
// ReadingOpenData example (look there for more comments).
void readData()
{
  String[] lines = loadStrings(filename);
  
  // We will discard the first and last 3 lines of the file
  int numCountries = lines.length - 6;
  
  countryData = new ForeignStudentData[numCountries];
  
  // Next we need to loop over the lines and fill in the arrays
  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    // Skip the first and last three lines
    if (lineIndex < 3 || lineIndex >= lines.length - 3)
    {
      lineIndex++;
      continue;
    }
    
    // The country number is not equal to the line index
    int countryNum = lineIndex - 3;
    
    // Break each line apart by separating at the comma
    String[] splitLine = lines[lineIndex].split(",");
    
    countryData[countryNum] = new ForeignStudentData();
    
    countryData[countryNum].countryName = splitLine[0];
    
    countryData[countryNum].quarters_2013 = new int[4];
    countryData[countryNum].quarters_2013[0] = Integer.parseInt(splitLine[1]);
    countryData[countryNum].quarters_2013[1] = Integer.parseInt(splitLine[2]);
    countryData[countryNum].quarters_2013[2] = Integer.parseInt(splitLine[3]);
    countryData[countryNum].quarters_2013[3] = Integer.parseInt(splitLine[4]);
    
    countryData[countryNum].total_2013 = Integer.parseInt(splitLine[5]);
    
    lineIndex++;
  }
}


//////////////////////////////////////////////////
// Calculates the total number of students at the end of
// 2013 for the top n countries.
int sumTotalStudentsForTopNCountries(int n)
{
  int countryNum = 0;
  int sum = 0;
  while (countryNum < n)
  {
    sum += countryData[countryNum].total_2013;
    countryNum++;
  } 
  
  return sum;
}


//////////////////////////////////////////////////
// Calculates the maximum number of students from the
// top n countries.
int maxTotalStudentsForTopNCountries(int n)
{
  int countryNum = 0;
  int max = -1;
  while (countryNum < n)
  {
    if (max < countryData[countryNum].total_2013)
    {
      max = countryData[countryNum].total_2013;
    }
    
    countryNum++;
  } 
  
  return max;
}


//////////////////////////////////////////////////
// Given a row and col, what is the x/y coordinate?

float getXCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (colNum+1)*getHorizontalSpacing()
         + colNum*maxCircleWidth  
         + maxCircleWidth/2;
}

float getYCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (rowNum+1)*getVerticalSpacing()
         + rowNum*maxCircleHeight 
         + maxCircleHeight/2;
}


//////////////////////////////////////////////////
// Calculate the spacing between the max size of
// the circles

float getHorizontalSpacing()
{
  return (width - numCols*maxCircleWidth)/(float)(numCols+1);
}

float getVerticalSpacing()
{
  return (height - numRows*maxCircleHeight)/(float)(numRows+1);
}


//////////////////////////////////////////////////
// A function to draw the circles for the top 16 countries,
// including their labels
void drawTopNCountries()
{
  final int numCircles = numRows * numCols;
  
  // Calculate how much space to put in between each circle
  // in terms of the max width (there are "cols" circles
  // per row).
  final float spaceHor = getHorizontalSpacing();
  final float spaceVer = getVerticalSpacing();
  
  // What is the highest number of total students? Circles
  // will be sized relative to that. 
  final int maxTotalStudents = maxTotalStudentsForTopNCountries(numCircles);
  
  
  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      // Convert row, col to a 1D index
      int index = rowNum*numCols + colNum;
      
      // Get the relative circle size according to a percentage of
      // the maximum
      
      float circleWidth = countryData[index].total_2013 / 
                         (float)maxTotalStudents
                         * maxCircleWidth;
                         
      float circleHeight = countryData[index].total_2013 / 
                         (float)maxTotalStudents 
                         * maxCircleHeight;
      
      // Calculate the x/y coordinates of the circles
      
      final float x = getXCoordinateForRowAndCol(rowNum, colNum);
      final float y = getYCoordinateForRowAndCol(rowNum, colNum);
      
      
      // Draw a box around the data
      
      rectMode(CENTER); // needed when using a text box
      
      noFill();
      stroke(210);
      rect(x, y, maxCircleWidth + spaceHor/5, maxCircleHeight + spaceVer/5);
      
      
      // Draw the proportionally sized circle
      
      noStroke();
      
      float alphaTransparency = 
         (circleWidth / (float)maxCircleWidth * 150) + 100;
      
      fill(83,200,0,alphaTransparency);
      ellipse(x, y, circleWidth, circleHeight);
      
      
      // Draw the country label
      
      fill(0);
      textAlign(CENTER,BOTTOM);
      textSize(12);
      text(countryData[index].countryName, 
           x, y + maxCircleHeight/2 - spaceVer/2, 
           maxCircleWidth - 20, spaceVer);
      
      
      colNum++;
    }
    rowNum++;
  }
}


//////////////////////////////////////////////////
// A function to draw a line graph in the middle of the
// screen for the country at the given index
void drawLineGraph(int index)
{
  final int padding = 40;
  
  final int rectWidth = (int)(width * 0.8f);
  final int rectHeight = (int)(height * 0.6f);
  
  final int axisX = width/2 - rectWidth/2 + padding;
  final int axisY = height/2 + rectHeight/2 - padding;
  final int axisHeight = rectHeight - 2 * padding;
  
  int numPoints = 4; // one for each quarter 2013
  int maxValue = max(countryData[index].quarters_2013);
  
  // Draw a rectangle to contain the graph
  stroke(2);
  fill(255);
  rect(width/2, height/2, rectWidth, rectHeight);
    
  // Label the country
  fill(0);
  textSize(18);
  textAlign(CENTER, CENTER);
  text(countryData[index].countryName, width/2, height/2 + rectHeight/2 - padding/2); 
  
  // Draw axes
  line(axisX, axisY, axisX, height-axisY);
  line(axisX, axisY, width-axisX, axisY);
  
  // Figure out how much space to put between the points
  // on the graph
  int spacing = (rectWidth - 2*axisX)/numPoints;
  
  // Draw the line graph
  stroke(150,0,0);
  
  
  // Now that we have a single array we can loop over to get
  // the data points, it's a lot easier to make the line graph
  
  float lastPointX = axisX;
  float lastPointY = axisY;
  
  int pointNum = 0;
  while (pointNum < numPoints)
  {
    float yValue = countryData[index].quarters_2013[pointNum];
    yValue = yValue / maxValue * axisHeight;
    yValue = axisY - yValue;
    
    line(lastPointX, lastPointY, lastPointX+spacing, yValue);
    lastPointX = lastPointX+spacing;
    lastPointY = yValue;
    pointNum++;
  }
}


//////////////////////////////////////////////////
// Find the index of the country this coordinate falls on
// (if any)
int getIndexOfCountryAt(int x, int y)
{
  int index = -1; // default: not found
  
  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      // Convert row, col to a 1D index
      int currIndex = rowNum*numCols + colNum;
      
      float currX = getXCoordinateForRowAndCol(rowNum, colNum);
      float currY = getYCoordinateForRowAndCol(rowNum, colNum);
      
      if (x >= currX - maxCircleWidth/2 && x <= currX + maxCircleWidth/2 &&
          y >= currY - maxCircleHeight/2 && y <= currY + maxCircleHeight/2)
      {
        index = currIndex;
        break;
      }
      
      colNum++;
    }
    rowNum++;
  }
  
  return index;
}


//////////////////////////////////////////////////
// mouseClicked
void mouseClicked()
{
  // Turn off the graph if it was on
  if (graphShowingIndex >= 0)
  {
    graphShowingIndex = -1;
  }
  // Otherwise, figure out what index we clicked
  else
  {
    graphShowingIndex = getIndexOfCountryAt(mouseX, mouseY);
  }
}


//////////////////////////////////////////////////
// Use this function to sort the first n data objects 
// alphabetically according to their country names
// using insertion sort
void sortCountryDataAlphabetically(int n)
{
  int currentStartIndex = 1;
  while (currentStartIndex < n)
  {
    int innerIndex = currentStartIndex;
    while (innerIndex > 0 &&
           countryData[innerIndex].countryName.compareTo(
             countryData[innerIndex-1].countryName) < 0)
    {
      // Swap the current "inner indexed" value with the one before it
      ForeignStudentData temp = countryData[innerIndex-1];
      countryData[innerIndex-1] = countryData[innerIndex];
      countryData[innerIndex] = temp;
      
      innerIndex--;
    }
    
    currentStartIndex++;
  }
}


//////////////////////////////////////////////////
// Use this function to sort the first n data objects 
// in descending order according to the total number
// of students in 2013
void sortCountryDataByTotalStudents(int n)
{
  int currentStartIndex = 1;
  while (currentStartIndex < n)
  {
    int innerIndex = currentStartIndex;
    while (innerIndex > 0 &&
           countryData[innerIndex].total_2013 >
             countryData[innerIndex-1].total_2013)
    {
      // Swap the current "inner indexed" value with the one before it
      ForeignStudentData temp = countryData[innerIndex-1];
      countryData[innerIndex-1] = countryData[innerIndex];
      countryData[innerIndex] = temp;
      
      innerIndex--;
    }
    
    currentStartIndex++;
  }
}


//////////////////////////////////////////////////
// keyPressed
void keyPressed()
{
  if (key == 's')
  {
    if (lastSortedOrderWasAlphabetical)
    {
      sortCountryDataByTotalStudents(numRows * numCols);
      lastSortedOrderWasAlphabetical = false;
    }
    else
    {
      sortCountryDataAlphabetically(numRows * numCols);
      lastSortedOrderWasAlphabetical = true;
    }
  }
}

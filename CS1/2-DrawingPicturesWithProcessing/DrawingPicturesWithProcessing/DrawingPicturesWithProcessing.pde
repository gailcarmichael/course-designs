/*
--------------------------------
Drawing Pictures with Processing
--------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It illustrates how to draw basic shapes in
Processing as well as how to use variables to
eliminate repetition (and errors that might
result from repetition).
*/

// Set the window size
size(500,500);

// Useful variables (used in multiple places, so
// keep them up top for easy access)

int horizon = height*2/3; // caution: integer division

int catHeadX = 200;
int catHeadY = 300;
int catHeadWidth = 90;
int catHeadHeight = 110;

int catBodyX = catHeadX + 50;
int catBodyY = catHeadY + 100;
int catBodyWidth = 150;
int catBodyHeight = 120;


// Turn off stroke outlines and draw the sky
// and ground
noStroke();
fill(174, 211, 252);
rect(0,0,width,horizon);
fill(150,214,144);
rect(0,horizon,width,height-horizon);

// Set the stroke weight to be black and a bit
// heavier than the default value for the rest
// of the objects we draw
stroke(0);
strokeWeight(2);

// Draw a sun
fill(240, 240, 90);
ellipse(80, 80, 100, 100);

// Draw cat's body
fill(220, 175, 35);
ellipse(catBodyX, catBodyY, catBodyWidth, catBodyHeight);

// Draw cat's feet
fill(220, 175, 35);
ellipse(catBodyX - catBodyWidth/3,
        catBodyY + catBodyHeight/2 - 5,
        20, 20);
ellipse(catBodyX - catBodyWidth/5,
        catBodyY + catBodyHeight/2,
        20, 20);
ellipse(catBodyX + catBodyWidth/3,
        catBodyY + catBodyHeight/2 - 5,
        20, 20);
ellipse(catBodyX + catBodyWidth/5,
        catBodyY + catBodyHeight/2,
        20, 20);
        
//////
// Draw cat's tail
fill(220, 175, 35);
ellipse(catBodyX + catBodyWidth/2.5,
        catBodyY - catBodyHeight/2.5,
        10, 40);

//////
// Draw cat's head
fill(220, 175, 35);
ellipse(catHeadX, catHeadY, catHeadWidth, catHeadHeight);

//////
// Draw cat's eyes
fill(0);
ellipse(catHeadX - catHeadWidth/5,
        catHeadY - catHeadHeight/5,
        5, 10);
ellipse(catHeadX + catHeadWidth/5,
        catHeadY - catHeadHeight/5,
        5, 10);
        
//////
// Draw cat's mouth
fill(0);
ellipse(catHeadX,
        catHeadY + catHeadHeight/5,
        10,15);

//////
// Draw cat's ears

// These variables are only used here, so keep them
// close by
int catEarWidth = 15;
int catEarOffset = 10;

fill(220, 175, 35);

triangle(catHeadX - catHeadWidth/4 + catEarWidth/2, //x1 
         catHeadY - catHeadHeight/2 + catEarOffset, // y1
         catHeadX - catHeadWidth/4, //x2
         catHeadY - catHeadHeight/2 - catEarWidth + catEarOffset, // y2
         catHeadX - catHeadWidth/4 - catEarWidth/2, //x3
         catHeadY - catHeadHeight/2 + catEarOffset); //y3
         
triangle(catHeadX + catHeadWidth/4 + catEarWidth/2, //x1 
         catHeadY - catHeadHeight/2 + catEarOffset, // y1
         catHeadX + catHeadWidth/4, //x2
         catHeadY - catHeadHeight/2 - catEarWidth + catEarOffset, // y2
         catHeadX + catHeadWidth/4 - catEarWidth/2, //x3
         catHeadY - catHeadHeight/2 + catEarOffset); //y3


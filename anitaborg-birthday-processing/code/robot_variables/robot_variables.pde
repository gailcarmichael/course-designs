size(500,500);
background(255);

// Variables!

int robotBodyX = width/2;
int robotBodyY = height/2;
int robotBodyWidth = 100;
int robotBodyHeight = 175;

int robotHeadWidth = 50;
int robotHeadHeight = 50;

// Drawing...

rectMode(CENTER);

rect(robotBodyX,
     robotBodyY,
     robotBodyWidth, robotBodyHeight);

rect(robotBodyX,
     robotBodyY - robotBodyHeight/2 - robotHeadWidth/2,
     robotHeadWidth, robotHeadHeight);

ellipseMode(CENTER);

ellipse(robotBodyX - 10,
        robotBodyY - robotBodyHeight/2 - robotHeadHeight/2,
        8, 8); 

ellipse(robotBodyX + 10,
        robotBodyY - robotBodyHeight/2 - robotHeadHeight/2,
        8, 8); 
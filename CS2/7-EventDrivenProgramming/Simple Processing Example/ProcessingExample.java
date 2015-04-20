// This file demonstrates the basics of using a library file
// (in this case, Processing) with your Java project.


// Step 1: First you need to get the core Processing jar file.
//         Download Processing (https://processing.org/download/),
//         then find core.jar in the core/library subfolder of
//         the zip file you downloaded.

// Step 2: Now you have to tell DrJava to look for core.jar when
//         compiling.  Open the Preferences dialog, and under
//         Resource Locations, click Add to add new data to
//         Extra Classpath. Find core.jar as per above.

// Step 3: You are ready to import packages and classes from the
//         jar file.  You will likely want to start with
//            import processing.core.PApplet;

// Step 4: Your main Processing class (which will be the "controller")
//         must now extend PApplet, a special Processing base class.
//         to make Processing run as a regular program instead of an
//         applet, you also have to add a special line to your main
//         method (see below).

// Step 5: Write a setup and draw method. Setup will run exactly once
//         when the program starts, and draw will run once every frame
//         (that is, it will run, say, 24 frames per second).


// Learn about all the inherited commands you get from PApplet here:
// https://processing.org/reference/


import processing.core.PApplet;


public class ProcessingExample extends PApplet
{
    // Attributes
    int boxX, boxY, boxSpeed;
    final int BOX_WIDTH = 30;
    final int BOX_HEIGHT = 40;
    
    
    // Override PApplet's setup method - this will get called exactly
    // once when the program starts, and gives you a chance to set up
    // any attribute values (instead of using a constructor) and any
    // first-time settings for the drawing you will make
    public void setup()
    {
        // Set the size of the drawing's window
        size(500,500);
        
        // Set rectMode so x,y coordinates of a box are
        // referring to the center of the box
        rectMode(CENTER);
        
        
        // Initialize attributes
        
        boxX = width/2; //  <-width is an inherited attribute
        boxY = height/2; // <- so is height
        boxSpeed = 5;
    }
    
    
    // Override PApplet's draw method - this will get called once every
    // frame.  Processing works like frame-by-frame animation.  The general
    // idea is to do the following every frame:
    //    - clear the screen, for example by setting the background to white
    //    - update the state of anything on screen that should change in some way
    //    - use the current state of the program to draw things to the screen
    // This will get repeated often enough that you can create smooth animations
    // just by changing the state a little bit each frame.
    public void draw()
    {
        // Clear the screen
        background(255);
        
        // Update entities on the screen
        boxX += boxSpeed;
        if (boxX > width || boxX < 0)
        {
            boxSpeed *= -1;
        }
        
        // Draw entities on the screen according to current state
        rect(boxX, boxY, BOX_WIDTH, BOX_HEIGHT);
    }
    
    
    
    // Kick start Processing and its main draw loop
    public static void main(String[] args)
    {
        // In your own example, replace ProcessingExample with
        // your class's name
        PApplet.main(ProcessingExample.class.getCanonicalName());
    }
}
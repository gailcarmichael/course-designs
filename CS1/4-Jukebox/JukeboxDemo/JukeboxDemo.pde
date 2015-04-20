/*
------------------------------------
 Jukebox
 ------------------------------------
 
 This program was created by Gail Carmichael for 
 COMP 1405: Introduction to Computer Science 1.
 It introduces if statements, drawing images and
 text, and playing audio.
 
 For more on using Minim:
 http://code.compartmental.net/tools/minim/quickstart/
 
 */


// This allows us to use the minim library, the tool
// that plays sounds
// Get this code by choosing Sketch > Import Library > minim
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


////
// Variables we use everywhere...

PImage backgroundImage;
final int numSongs = 3;

Minim minim;
AudioPlayer song1Player;
AudioPlayer song2Player;
AudioPlayer song3Player;
// ^ Songs from http://www.jamendo.com/en (free for 
// non-professional use)

final int buttonWidth = 30;
final int buttonHeight = 40;

final int buttonY = 100; // same for all buttons

// Can't assign values to these until we know the jukebox
// image's width
int middleButtonX;
int leftButtonX;
int rightButtonX;

PFont buttonFont;

// Use these for animating a button while its song
// is playing
int songPlaying; // song number
int buttonCounter; // number of frames since button 
                   // started flashing
final int framesBetweenFlash = 60; // how many frames before buttons turns
                                    // off/on again


////
// Set things up
void setup()
{
  // Load the image and size the window to match
  // the image's dimensions
  backgroundImage = loadImage("Jukebox.jpg"); 
  size(backgroundImage.width, backgroundImage.height);
  
  // Need to know the image width before setting up
  // these button values (we set the window width
  // to be the same as the image width)
  middleButtonX = width/2;
  leftButtonX = middleButtonX - buttonWidth/2 - 30;
  rightButtonX = middleButtonX + buttonWidth/2 + 30;
  
  songPlaying = -1; // this means no song is playing
  buttonCounter = 0; // start at frame zero

  // Set up the music player and load the songs
  minim = new Minim(this);
  song1Player = minim.loadFile("Boreal_forest.mp3");
  song2Player = minim.loadFile("mexico_8bit.mp3");
  song3Player = minim.loadFile("summerCamp.mp3");
  
  // We want to draw the buttons from their centers
  rectMode(CENTER);
  
  // Set up the font (Tools > Create Font, and choose
  // any font you want - just match the size to what
  // you want to use in textFont())
  buttonFont = loadFont("Serif-48.vlw");
  textFont(buttonFont, 48);
  textAlign(CENTER, CENTER);// horizontal and vertical align
}


////
// Draw stuff each frame
void draw()
{
  // Put the jukebox in the background
  image(backgroundImage, 0, 0);
  
  // We need to update the frame counter when draw()
  // is called.  We will reset the counter when it is
  // double the number of frames between a flash - that
  // means the counter will continue increasing for one
  // full cycle of the button being on and off.
  buttonCounter++;
  if (buttonCounter > framesBetweenFlash * 2)
  {
    buttonCounter = 0;
  }

  // Draw three buttons across the top...  
  drawButton(leftButtonX, buttonY, 1);
  drawButton(middleButtonX, buttonY, 2);
  drawButton(rightButtonX, buttonY, 3);
}


////
// A function to handle the drawing of a song's button.
void drawButton(int x, int y, int buttonNumber)
{ 
  // This is a more complex "or" statement.  The first part
  // is tested, and if it is false, the second part will be
  // tested.  The first part failing would mean that the button
  // we are currently drawing is the one whose song
  // is playing, so we have to also check whether it
  // should be shown according to the button counter.
  // If the first part passes, then the button should
  // always be shown, and we don't even care about the
  // second test.
  
  // Passing this if statement means the button will
  // be drawn 
  if (buttonNumber != songPlaying ||
      buttonCounter < framesBetweenFlash)
  {
    fill(240);
    rect(x, y, buttonWidth, buttonHeight);
   
    fill(0); 
    text(buttonNumber, x, y);
  }
}


////
// When the mouse is clicked, we have to figure out
// what button was clicked on and play/stop the song
void mouseClicked()
{  
  // First check if we're in range in terms of the vertical
  // click location, since it's the same for all three
  if (mouseY >= buttonY - (buttonHeight/2) &&
      mouseY <= buttonY + (buttonHeight/2))
  {
    // Now see which button we might have clicked on
    if (mouseX >= leftButtonX - (buttonWidth/2) &&
        mouseX <= leftButtonX + (buttonWidth/2))
    {
      // Left button clicked
      toggleSong(song1Player, 1);
    }
    else if (mouseX >= middleButtonX - (buttonWidth/2) &&
             mouseX <= middleButtonX + (buttonWidth/2))
    {
      // Middle button clicked
      toggleSong(song2Player, 2);
    }
    else if (mouseX >= rightButtonX - (buttonWidth/2) &&
             mouseX <= rightButtonX + (buttonWidth/2))
    {
      // Right button clicked
      toggleSong(song3Player, 3);
    }
  }
}


////
// Function to handle toggling the song
void toggleSong(AudioPlayer songPlayer, int buttonNumber)
{
      // Save whether the song was playing so we can
      // start playing it if it wasn't
      boolean wasPlaying = songPlayer.isPlaying();
      
      // Stop all the songs
      songPlaying = -1;
      song1Player.pause();  
      song2Player.pause();
      song3Player.pause();
      
      // Start playing this song (whatever it happens
      // to be) if it was previously not playing
      if (!wasPlaying)
      {
          songPlayer.play();
          songPlaying = buttonNumber;
          buttonCounter = 0;
      }
}










/*
------------------------------------
Set Cover Problem
------------------------------------

This program was created by Gail Carmichael for 
COMP 1405: Introduction to Computer Science 1.
It reinforces objects and helps introduce shared
data.
 
The demo was inspired by this blog post:
http://randomcomputation.blogspot.ca/2013/08/visualizing-set-cover-problem.html

The set cover problem, as described in that post:
"Stated informally: imagine we have a set of light
switches S and a set of lights L. Each switch in S
turns on an arbitrary subset of the lights in L. The
problem is to turn on all of the lights L using the
smallest number of switches in S."

One context: A switch is a social media site, like Facebook,
and the lights a switch can turn on represents the audiences
that the social media site reaches.  We want to reach the
most audiences with the smallest number of social media sites
so we don't have as much work to maintain the sites.
 
*/


final int numLights = 6;
final int lightSize = 50;

final int numSwitches = 5;
final int spaceBetweenSwitches = 20;


class Light
{
  int x;
  int y;
  int num;
  
  int size;
  
  boolean on;
  
  Light(int newX, int newY, int newNum)
  {
    x = newX;
    y = newY;
    num = newNum;
    
    size = lightSize;
    on = false;
  }
}


class Switch
{
  int x;
  int y;
  int width;
  int height;
  
  boolean on;
  
  // A switch should keep track of what lights it can turn on
  Light[] lightsTurnedOn;
  
  Switch(int newX, int newY, int newWidth, int newHeight)
  {
    x = newX;
    y = newY;
    width = newWidth;
    height = newHeight;
    
    lightsTurnedOn = new Light[numLights];
    
    on = false;
  }
}


Light[] lights;
Switch[] switches;


void setup()
{
  size(600, 300);
  background(255);
  
  textAlign(CENTER, CENTER);
  
  
  float spaceBetweenLights = (width - numLights*lightSize) / (float)(numLights+1);
  
  ////
  // Create a lights array and add a number of lights to it
  lights = new Light[numLights];
  for (int lightNum=0; lightNum < lights.length; lightNum++)
  {
    float x = (spaceBetweenLights * (lightNum+1)) 
              + (lightSize*lightNum)
              + lightSize/2;
              
    lights[lightNum] = new Light((int)x, height*3/4, lightNum);
  }
  
  
  float switchSize = (width - (numSwitches+1)*spaceBetweenSwitches) 
                     / (float)(numSwitches);
  
  
  ////
  // Create some switches
  switches = new Switch[numSwitches];
  for (int switchNum=0; switchNum < switches.length; switchNum++)
  {
    float x = spaceBetweenSwitches * (switchNum+1) + switchSize*switchNum;
    switches[switchNum] = new Switch((int)x, 20, (int)switchSize, height/2 - 40);
  }
  
  
  //
  // Add some lights to the switches.  The default value of
  // a new array of objects is null, so just add in as many
  // as desired and we'll check for null later
  
  switches[0].lightsTurnedOn[lights[0].num] = lights[0];
  switches[0].lightsTurnedOn[lights[1].num] = lights[1];
  switches[0].lightsTurnedOn[lights[2].num] = lights[2];
  
  switches[1].lightsTurnedOn[lights[3].num] = lights[3];
  switches[1].lightsTurnedOn[lights[4].num] = lights[4];
  switches[1].lightsTurnedOn[lights[5].num] = lights[5];
  
  switches[2].lightsTurnedOn[lights[1].num] = lights[1];
  switches[2].lightsTurnedOn[lights[2].num] = lights[2];
  switches[2].lightsTurnedOn[lights[3].num] = lights[3];
  switches[2].lightsTurnedOn[lights[4].num] = lights[4];
  
  switches[3].lightsTurnedOn[lights[0].num] = lights[0];
  
  switches[4].lightsTurnedOn[lights[5].num] = lights[5];
}


void draw()
{
  // Draw the switches
  for (int switchNum=0; switchNum < switches.length; switchNum++)
  {
    drawSwitch(switches[switchNum]);
  }
  
  // Draw the lights
  for (int lightNum=0; lightNum < lights.length; lightNum++)
  {
    drawLight(lights[lightNum]);
  }
}


void drawSwitch(Switch aSwitch)
{
  if (aSwitch.on)
  {
    fill(191,216,240);
  }
  else
  {
    fill(255);
  }
  rect(aSwitch.x, aSwitch.y, aSwitch.width, aSwitch.height);
  
  // List all the light numbers that this switch turns on
  String numList = ""; // <- empty String
  for (int lightNum=0; lightNum < aSwitch.lightsTurnedOn.length; lightNum++)
  {
    if (aSwitch.lightsTurnedOn[lightNum] != null)
    {
      numList += aSwitch.lightsTurnedOn[lightNum].num;
    }
  }
  
  fill(0);
  text(numList, aSwitch.x + aSwitch.width/2, aSwitch.y + aSwitch.height/2);
}


void drawLight(Light light)
{
  if (light.on)
  {
    fill(250,190,190);
  }
  else
  {
    fill(255);
  }
  ellipse(light.x, light.y, light.size, light.size);
  
  fill(0);
  text(light.num, light.x, light.y);
}


void flipSwitch(Switch aSwitch)
{
  aSwitch.on = !aSwitch.on;
  updateLights();
}


void updateLights()
{
  // Look at each light, and see if any switch turns it on
  // remembering that the light reference was stored in the
  // same slot of the switch's array as the light's num
  
  for (int lightNum=0; lightNum < lights.length; lightNum++)
  {
    boolean on = false;
    Light currentLight = lights[lightNum];
    for (int switchNum=0; switchNum < switches.length; switchNum++)
    {
      Switch currentSwitch = switches[switchNum];
      if (currentSwitch.on
          && currentSwitch.lightsTurnedOn[currentLight.num] == currentLight)
      {
        on = true;
        break; // <- don't need to check any more switches
      }
    }
    currentLight.on = on;
  }
}


void mouseClicked()
{
  // See if any switches were pressed
  for (int switchNum=0; switchNum < switches.length; switchNum++)
  {
    if (mouseX >= switches[switchNum].x 
       && mouseX <= switches[switchNum].x + switches[switchNum].width
       && mouseY >= switches[switchNum].y
       && mouseY <= switches[switchNum].y + switches[switchNum].height)
    {
      flipSwitch(switches[switchNum]);
    }
  }
}





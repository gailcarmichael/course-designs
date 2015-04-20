import processing.core.*;

import java.util.ArrayList;


// This is the view class of the model-view-controller setup.
// It uses PApplet to draw the garden onto the screen.
public class GardenUI
{
    protected GardenApplet parent;
    protected Garden garden; // <- a reference to the model
    protected ArrayList<PImage> images; // <- images for each item
    protected PImage cloudImage; // <- for drawing clouds
    
    public GardenUI(GardenApplet newParent, Garden newGarden)
    {
        parent = newParent;
        garden = newGarden;
        
        images = new ArrayList<PImage>();
        for (GardenItem item : garden.getItems())
        {
            images.add(parent.getPImage(item.getImageName()));
        }
        
        cloudImage = parent.getPImage(Cloud.IMAGE_NAME);
        
        // Set the image mode to CENTER because the x/y coordinates
        // in the model represent the middle of the item
        parent.imageMode(PApplet.CENTER);
    }
    
    public void drawGarden()
    {    
        // Draw clouds first so they are layered behind other stuff
        for (Cloud cloud : garden.getClouds())
        {
            parent.image(cloudImage, 
                         cloud.getX(), cloud.getY(),
                         cloud.getWidth(), cloud.getHeight());
        }
        
        // Draw garden items second
        for (int i=0; i < garden.getItems().size(); i++)
        {
            GardenItem item = garden.getItems().get(i);
           
            parent.image(images.get(i), 
                         item.getX(), item.getY(),
                         item.getWidth(), item.getHeight());
        }
    }
}
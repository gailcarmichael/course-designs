import java.util.ArrayList;

// This is the model class, which is composed of multiple
// GardenItems and Clouds. The model does not know or care
// how it will be drawn in the UI - it just stores information
// that can be used for that purpose. Whether Processing or
// Java's AWT (or whatever!) draws the garden, it doesn't care.
public class Garden
{
    ArrayList<GardenItem> gardenItems;
    ArrayList<Cloud> clouds;
    
    public Garden()
    {
        // These are the items that will appear in
        // every garden
        gardenItems = new ArrayList<GardenItem>();
        gardenItems.add(new Daisy(50, 100, 100, 450));
        gardenItems.add(new YellowFlower(75, 175, 250, 412));
        gardenItems.add(new Bunny(100, 75, 450, 462));
        
        // This will remain empty until the user starts
        // adding new clouds with the user interface
        clouds = new ArrayList<Cloud>();
    }
    
    
    public ArrayList<GardenItem> getItems()
    {
        return gardenItems;
    }
    
    
    public ArrayList<Cloud> getClouds()
    {
        return clouds;
    }
    
    
    public void growItems()
    {
        for (GardenItem gItem : gardenItems)
        {
            // Thanks to polymorphism, the right grow method
            // will get called
            gItem.grow();
        }
    }
    
    
    public void addCloud(int x, int y)
    {
        clouds.add(new Cloud(80, 60, x, y));
    }
}
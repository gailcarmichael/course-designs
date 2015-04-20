import processing.core.PApplet;

public abstract class GardenItem
{
    protected float width;
    protected float height;
    
    // The x/y coordinates represent the center of the item,
    // and could be used for any UI
    protected float x;
    protected float y;
    
    protected String imageName;
    
    public GardenItem(int newWidth, int newHeight,
                      int newX, int newY,
                      String newImageName)
    {
        width = newWidth;
        height = newHeight;
        x = newX;
        y = newY;
        imageName = newImageName;
    }
    
    public int getWidth() { return (int)width; }
    public int getHeight() { return (int)height; }
    
    public float getX() { return x; }
    public float getY() { return y; }
    
    public String getImageName() { return imageName; }
    
    // Force garden items to write their own grow methods
    public abstract void grow();
}
// One of the garden items in the model. This flower
// grows up only.
public class Daisy extends GardenItem
{
    public Daisy(int width, int height, int x, int y)
    {
        super(width, height, x, y, "daisy.png");
    }
    
    public void grow()
    {
        float oldHeight = height;
        
        height += 0.4;
        if (height > 200)
            height = 200;
        
        y -= (height - oldHeight)/2;
    }
}
// One of the garden items in the model. This flower grows
// up and out at the same rate.
public class YellowFlower extends GardenItem
{
    public YellowFlower(int width, int height, int x, int y)
    {
        super(width, height, x, y, "yellow.png");
    }
    
    public void grow()
    {
        float oldHeight = height;
        
        height += 0.2;
        if (height > 275)
            height = 275;
        
        width += 0.2;
        if (width > 175)
            width = 175;
        
        y -= (height - oldHeight)/2;
    }
}
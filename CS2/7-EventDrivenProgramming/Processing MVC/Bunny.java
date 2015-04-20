// One of the garden items in the model. Bunnies grow
// sideways because they eat all the flowers and get fat!
public class Bunny extends GardenItem
{
    public Bunny(int width, int height, int x, int y)
    {
        super(width, height, x, y, "bunny.png");
    }
    
    public void grow()
    {
        float oldHeight = height;
        
        height += 0.15;
        if (height > 175)
            height = 175;
        
        // Adjust the y-value so the items stay
        // along the bottom
        y -= (height - oldHeight)/2;
        
        width += 0.3;
        if (width > 300)
            width = 300;
    }
}
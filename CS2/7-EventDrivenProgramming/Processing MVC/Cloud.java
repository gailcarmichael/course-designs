// Clouds are added to the garden after it has been
// constructed. In our example, clouds are added when
// the user clicks the mouse, but the model doesn't
// care about that.
public class Cloud
{
    protected float width;
    protected float height;
    protected int x;
    protected int y;
    
    public static String IMAGE_NAME = "cloud.png";
    
    public Cloud(int newWidth, int newHeight,
                 int newX, int newY)
    {
        width = newWidth;
        height = newHeight;
        x = newX;
        y = newY;
    }
    
    public int getWidth() { return (int)width; }
    public int getHeight() { return (int)height; }
    
    public float getX() { return x; }
    public float getY() { return y; }
}
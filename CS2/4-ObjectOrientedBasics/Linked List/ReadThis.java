public class ReadThis
{
    public String url;
    public int currentPoints;
    
    public ReadThis(String newUrl)
    {
        url = newUrl;
        currentPoints = 0;
    }
    
    public String toString()
    {
        return url + " (" + currentPoints + ")";
    }
}
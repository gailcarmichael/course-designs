// The purpose of this class is to create an item check
// that actually allows us to check items in and out
public class ItemCheckPlus extends ItemCheck
{
    public ItemCheckPlus(String newName)
    {
        super(newName);
    }
    
    public void checkPouch(Pouch p)
    {
        checkItem(p);
    }
    
    public Pouch uncheckPouch(int pouchID)
    {
        Pouch p = null;
        for (int i=0; i < numItems; i++)
        {
            if (items[i].getID() == pouchID)
            {
                p = items[i];
                for (int j=i+1; j < numItems; j++)
                {
                    items[j-1] = items[j];
                }
                
                items[numItems-1] = null;
                numItems--;
                break;
            }
        }
        return p;
    }
}
public class Pouch
{
    // Use this to make a new unique ID value for each
    // new pouch we create
    private static int LAST_POUCH_ID = 100000;
    
    private HyruleResident owner;
    private int pouchID;
    
    private int rupeeBalance;
    
    
    public Pouch()
    {
        this(null);
    }
    
    // One-parameter constructor
    public Pouch(HyruleResident newOwner)
    {
        owner = newOwner;
        pouchID = ++LAST_POUCH_ID;
        rupeeBalance = 0;
    }
    
    
    ////
    // Getters (no setters this time - instead, all
    // functionality will be implemented through more specific
    // behaviours)
    public HyruleResident getOwner() { return owner; }
    public int getID() { return pouchID; }
    public int getRupeeBalance() { return rupeeBalance; }
    
    
    ////
    // toString
    
    public String toString()
    {
        return "Pouch #" + pouchID + " with balance " + rupeeBalance + " rupees";
    }
    
    
    ////
    // Other methods
    
    
    public void deposit(int numRupees)
    {
        rupeeBalance += numRupees;
    }
    
    
    public boolean withdraw(int numRupees)
    {
        if (numRupees <= rupeeBalance)
        {
            rupeeBalance -= numRupees;
            return true;
        }
        return false;
    }
}
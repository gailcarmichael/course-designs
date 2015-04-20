public class ItemCheck
{
    // We only need one copy of this constant value,
    // so we make it static
    private static final int ITEM_CAPACITY = 100;
    
    private String name;
    
    private int numItems;
    private Pouch[] items;
        

    public ItemCheck(String newName)
    {
        name = newName;
        numItems = 0;
        items = new Pouch[ITEM_CAPACITY];
    }
    
    
    ////
    // Getters (no setters this time - instead, all
    // functionality will be implemented through more specific
    // behaviours)
    
    public String getName() { return name; }
    public int getNumItems() { return numItems; }
    
    
    ////
    // toString
    
    public String toString()
    {
        return name + " with " + numItems + " items";
    }
    
    
    ////
    // Other methods
    
    
    // This is a helper method that nobody outside the
    // class should be able to access. It puts the given
    // pouch into the item check if there is space.
    private void checkItem(Pouch p)
    {
        if (numItems < ITEM_CAPACITY)
        {
            items[numItems++] = p;
        }
    }
    
    
    // Helper function that gets a pouch via its ID
    private Pouch getPouchWithID(int pouchID)
    {
        Pouch p = null;
        for (int i=0; i < numItems; i++)
        {
            if (items[i].getID() == pouchID)
            {
                p = items[i];
                break;
            }
        }
        return p;
    }
    
    
    // A resident can visit the item check and ask for
    // a new pouch (like opening a new bank account).
    public int getNewPouch(HyruleResident r)
    {
        Pouch p = new Pouch(r);
        checkItem(p);
        return p.getID();
    }
    
    
    // Get the balance of a particular Pouch via its ID
    public int getRupeeBalance(int pouchID)
    {
        int balance = -1; // <- indicates an error
        
        Pouch p = getPouchWithID(pouchID);
        if (p != null)
        {
            balance = p.getRupeeBalance();
        }
        
        return balance;
    }
    
    
    // Using just the pouch ID (which acts like an account
    // number), money can be desposited into a pouch. The
    // return value indicates whether we were successful
    // in completing the deposit.
    public boolean depositRupees(int pouchID, int amount)
    {
        boolean result = false;
        
        Pouch p = getPouchWithID(pouchID);
        if (p != null)
        {
            p.deposit(amount);
            result = true;
        }
        
        return result;
    }
    
    
    // Again using the pouch ID, attempt to withdraw money
    // and return whether we were successful.
    public boolean withdrawRupees(int pouchID, int amount)
    {
        boolean result = false;
        
        Pouch p = getPouchWithID(pouchID);
        if (p != null)
        {
            result = p.withdraw(amount);
        }
        
        return result;
    }
    
    
    // Find out the value of all the pouches currently
    // stored in the item check.
    public int totalOfAllPouches()
    {
        int answer = 0;
        
        for (int i=0; i < numItems; i++)
        {
            answer += items[i].getRupeeBalance();
        }
        
        return answer;
    }
    
    
    // Print a list of everything currently in the item check.
    public void listItems()
    {
        for (int i=0; i < numItems; i++)
        {
            System.out.println(items[i]);
        }
    }
}
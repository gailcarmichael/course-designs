public class ItemCheckTest
{
    public static void testDeposit(ItemCheck c, int pouchID, int amount) 
    {
        System.out.println("----");
        System.out.println("Account before depositing " + amount + " rupees:  " 
                               + c.getRupeeBalance(pouchID));
        
        if (c.depositRupees(pouchID, amount))
        {
            System.out.println("Account after depositing "+ amount + " rupees:   " 
                                   + c.getRupeeBalance(pouchID));
        }
        else
        {
            System.out.println("Failed to make deposit.");
        }
    }
    
    
    public static void testWithdraw(ItemCheck c, int pouchID, int amount) 
    {
        System.out.println("----");
        System.out.println("Account before withdrawing " + amount + " rupees:  " 
                               + c.getRupeeBalance(pouchID));
        
        if (c.withdrawRupees(pouchID, amount))
        {
            System.out.println("Account after withdrawing "+ amount + " rupees:   " 
                                   + c.getRupeeBalance(pouchID));
        }
        else
        {
            System.out.println("Failed to make withdraw.");
        }
    }

    
    public static void main(String args[]) 
    {
        ItemCheck itemCheck = new ItemCheck("Bazaar Item Storage");        
        
        System.out.println("\nTesting Link's account...");
        
        int pouchID = itemCheck.getNewPouch(new HyruleResident("Link"));
        itemCheck.depositRupees(pouchID, 0);
        
        testDeposit(itemCheck, pouchID, 100);
        testDeposit(itemCheck, pouchID, 1);
        testWithdraw(itemCheck, pouchID, 100);
        testWithdraw(itemCheck, pouchID, 1);
        
        
        System.out.println("\nTesting Tom's account...");
        
        pouchID = itemCheck.getNewPouch(new HyruleResident("Tom"));
        itemCheck.depositRupees(pouchID, 10);
        
        testDeposit(itemCheck, pouchID, 100);
        testDeposit(itemCheck, pouchID, 1);
        testWithdraw(itemCheck, pouchID, 100);
        testWithdraw(itemCheck, pouchID, 1);
        
        
        System.out.println("\nTesting Zed's account...");
        
        pouchID = itemCheck.getNewPouch(new HyruleResident("Zed"));
        itemCheck.depositRupees(pouchID, 200);
        
        testDeposit(itemCheck, pouchID, 100);
        testDeposit(itemCheck, pouchID, 1);
        testWithdraw(itemCheck, pouchID, 100);
        testWithdraw(itemCheck, pouchID, 1);
        
        testWithdraw(itemCheck, pouchID, 201);
        
        
        System.out.println("\n\nTotal of all pouches: " + itemCheck.totalOfAllPouches());
        itemCheck.listItems();
    }
}

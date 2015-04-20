public class ItemCheckPlusTest
{
    public static void main(String[] args)
    {
        ItemCheckPlus itemCheck = new ItemCheckPlus("Plus Check");

        HyruleResident link = new HyruleResident("Link");
        
        Pouch p1 = new Pouch(link);
        p1.deposit(10);
        
        Pouch p2 = new Pouch(link);
        p2.deposit(40);
        
        Pouch p3 = new Pouch(link);
        p3.deposit(80);
        
        itemCheck.checkPouch(p1);
        itemCheck.checkPouch(p2);
        itemCheck.checkPouch(p3);
        
        System.out.println("Before unchecking:");
        itemCheck.listItems();
        
        System.out.println("\nAfter unchecking:");
        itemCheck.uncheckPouch(p2.getID());

        itemCheck.listItems();
    }
}
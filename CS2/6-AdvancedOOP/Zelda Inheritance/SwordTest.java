public class SwordTest
{
    public static void main(String[] args)
    {     
        Pouch p = new Pouch();
        p.deposit(100);
        
        ////
        // Test that PracticeSword
        
        Enemy e = new Enemy("Keese", 2);
        
        PracticeSword practiceSword = new PracticeSword();
        System.out.println(practiceSword);
        
        System.out.println("Before attack: " + e);
        practiceSword.attackEnemy(e);
        System.out.println("After attack: " + e);
        
        System.out.println("Upgrade sword: " + practiceSword.upgradeWeapon(p));
        
        System.out.println("Before attack: " + e);
        practiceSword.attackEnemy(e);
        System.out.println("After attack: " + e);
        
        System.out.println("\n---\n");
        
        ////
        // Test the Goddess Sword
        
        e = new Enemy("Moblin", 10);
        
        GoddessSword goddessSword = new GoddessSword();
        
        System.out.println(goddessSword);
        
        System.out.println("Before attack: " + e);
        goddessSword.attackEnemy(e);
        System.out.println("After attack: " + e);
        
        System.out.println("Upgrade sword: " + goddessSword.upgradeWeapon(p));
        
        System.out.println("Before attack: " + e);
        goddessSword.attackEnemy(e);
        System.out.println("After attack: " + e);
    }
}
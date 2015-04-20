public class PracticeSword extends Weapon
{
    public PracticeSword()
    {
        // The super keyword allows us to call the superclass's constructor
        super("Practice Sword", 1);
        
        // Without super, the constructor might look like this,
        // except that the default superconstructor would get called,
        // and there is none!
        // name = "Practice Sword";
        // attackPower = 1;
    }
    
    
    // Make this constructor protected so only subclasses can use it
    protected PracticeSword(String name, int attackPower)
    {
        super(name, attackPower);
    }
    
    
    public boolean upgradeWeapon(Pouch p)
    {
        // Override the Weapon's method and simply
        // return false without doing anything - 
        // practice swords can't be upgraded this way
        return false;
    }
    
    
    // A helper method that allows us to skip the version in
    // this class and go to the super class's method.  This
    // should generally be avoided, and needing it strongly
    // suggests we reorganize the hierarchy.
    protected boolean upgradeWeaponSuper(Pouch p)
    {
        return super.upgradeWeapon(p);
    }
    
    
    public boolean attackEnemy(Enemy e)
    {
        // Override the Weapon's attack method in order to
        // add additional behaviour for this Sword
        
        System.out.println("Clashing wood!"); // in a game, play the sound!
        
        // Call the superclass version so it can do its work
        return super.attackEnemy(e);
    }
}
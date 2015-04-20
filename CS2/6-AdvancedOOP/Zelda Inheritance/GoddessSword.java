public class GoddessSword extends PracticeSword
{
    public GoddessSword()
    {
        super("Goddess Sword", 4);
    }
    
    public boolean upgradeWeapon(Pouch p)
    {
        // Override the Practice sword's method again
        // so we can actually do the upgrading
        
        // Can't call super.super.upgradeWeapon(p) so we
        // are forced to either copy code from the Weapon class or use
        // a helper method in PracticeSword that allows us to skip upward
        // (either way, this suggests we need to reorganize our hierarchy
        // - perhaps a Sword class above the Goddess and Practice sword,
        // which would be on the same level?)
        
       return upgradeWeaponSuper(p);
    }
    
    public boolean attackEnemy(Enemy e)
    {
        // Override the Weapon's attack method in order to
        // add additional behaviour for this Sword
        
        System.out.println("Clashing metal!"); // in a game, play the sound!
        
        // Have to completely override the superclass's method because
        // we don't want the clashing wood thing to be printed
        // (again suggests a reorganization)
        
        boolean dead = e.strike(this);
        if (dead)
        {
            System.out.println("KILL!");
        }
        return dead;
    }
}
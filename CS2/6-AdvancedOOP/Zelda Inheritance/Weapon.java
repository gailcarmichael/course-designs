public class Weapon
{
    protected static final int COST_TO_UPGRADE = 25;
    protected static final int ATTACK_POWER_UPGRADE = 2;
    
    protected String name;
    protected int attackPower;
    
    protected Weapon(String newName, int newAttackPower)
    {
        name = newName;
        attackPower = newAttackPower;
    }
    
    ////
    // Getters and setters
    
    public String getName() { return name; }
    public int getAttackPower() { return attackPower; }
    
    public void setName(String newName) { name = newName; }
    public void setAttackPower(int newAttackPower) { attackPower = newAttackPower; }
    
    
    ////
    // toString
    
    public String toString()
    {
        return name + " with attack power " + attackPower;
    }
    
    
    ////
    // Other methods
    
    public boolean attackEnemy(Enemy e)
    {
        boolean dead = e.strike(this);
        if (dead)
        {
            System.out.println("KILL!");
        }
        return dead;
    }
    
    public boolean upgradeWeapon(Pouch p)
    {
        // Withdraw rupees from the pouch to upgrade
        // the weapon; return whether it was possible
        
        boolean result = p.withdraw(COST_TO_UPGRADE);
        if (result)
        {
            attackPower += ATTACK_POWER_UPGRADE;
        }
        return result;
    }
}
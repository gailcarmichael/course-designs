public class Enemy
{
    protected String name;
    protected int hitPoints;
    
    public Enemy(String newName, int newHitPoints)
    {
        name = newName;
        hitPoints = newHitPoints;
    }
    
    
    ////
    // Getters and setters
    
    public String getName() { return name; }
    
    public boolean getIsDead()
    {
        return hitPoints <= 0;
    }
    
    
    ////
    // toString
    
    public String toString()
    {
        return "Enemy " + name + " with " + hitPoints + " hp";
    }
    
    
    ////
    // Other methods
    
    public boolean strike(Weapon w)
    {
        hitPoints = Math.max(0, hitPoints - w.getAttackPower());
        
        System.out.println("The enemy plays an animation of being hit!");
        
        return getIsDead();
    }
    
}
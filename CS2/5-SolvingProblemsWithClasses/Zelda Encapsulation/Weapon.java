public class Weapon
{
    private String name;
    private int attackPower;
    
    public Weapon(String newName, int newAttackPower)
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
}
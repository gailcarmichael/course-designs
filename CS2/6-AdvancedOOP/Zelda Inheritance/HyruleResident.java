public class HyruleResident
{
    private String name;
    private Weapon weapon;
    

    public HyruleResident(String newName)
    {
        this(newName, null);
    }

    public HyruleResident(String newName, Weapon newWeapon)
    {
        name = newName;
        weapon = newWeapon;
    }
    
    
    ////
    // Getters and setters
    
    public String getName() { return name; }
    public Weapon getWeapon() { return weapon; }
    
    public void setName(String newName) { name = newName; }
    public void setWeapon(Weapon newWeapon) { weapon = newWeapon; }
    
    
    ////
    // toString
    
    public String toString()
    {
        String retString = "Hyrule Resident: " + name;
        if (weapon != null)
        {
            retString += " equipped with " + weapon;
        }
        return retString;
    }
}
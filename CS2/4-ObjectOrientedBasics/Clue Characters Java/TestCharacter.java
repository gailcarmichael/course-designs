// We'll create a "test" class that will hold all the functions
// we wrote in our cpp file before, including main()
public class TestCharacter
{
    // Remember that we need to make our functions static
    // if we want them to work the same way as in C++
    // Notice that we no longer need to pass in the length
    // of the array
    public static void printArray(Character[] characters)
    {
        for (int i=0; i < characters.length; i++)
        {
            System.out.print(characters[i].name + ":\t");
            
            // A small improvement to make the numbers line up
            // more nicely (what if we have a really really long
            // name?)
            if (characters[i].name.length() < 14)
                System.out.print("\t");
            
            System.out.println(characters[i].hitPoints + "\t(" +
                               characters[i].maxHitPoints + ")");
        }
        
        System.out.println();
    }
    
    
    // Objects in Java are always passed by reference, so it's
    // good that this is what we want for this function
    public static void healCharacter(Character characterToHeal, int health)
    {
        characterToHeal.hitPoints += health;
        if (characterToHeal.hitPoints > characterToHeal.maxHitPoints)
        {
            characterToHeal.hitPoints = characterToHeal.maxHitPoints;
        }
    }
    
    
    // We can just ask the array how long it is instead of passing
    // the length in as a parameter.
    public static String nameOfMostHealthyCharacter(Character[] characters)
    {
        // Assume that the first person is the healthiest for now
        int healthiestIndex = 0;
        int highestHealth = characters[0].hitPoints;
        
        // Start the loop at the second person (if there's only one,
        // then the loop will just finish right away)
        for (int i=1; i < characters.length; i++)
        {
            if (characters[i].hitPoints > highestHealth)
            {
                healthiestIndex = i;
                highestHealth = characters[i].hitPoints;
            }
        }
        
        // We have the position of the healthiest person, so now we
        // just need to get the name and return it
        return characters[healthiestIndex].name;
    }
    
    
    // Entry point into the program, same as main() in C++
    public static void main(String[] args)
    {
        // We no longer need to keep track of the size of the
        // array - Java takes care of that for us.
        
        // Before we can assign values to the array, we have
        // to create a new object. (That's why we can't use
        // a shortcut like in C++; in C++, declaring an array
        // makes room in memory for all the variables the
        // structs or objects in the array need, but in Java,
        // we are only making room for object references).
        Character characterArray[] = new Character[7];
        
        // For each character we want to add, we also have
        // to use 'new' to create a new object before we can fill
        // in the details.
        
        characterArray[0] = new Character();
        characterArray[0].name = "Colonel Mustard";
        characterArray[0].hitPoints = 10;
        characterArray[0].maxHitPoints = 15;
        
        characterArray[1] = new Character();
        characterArray[1].name = "Miss Scarlet";
        characterArray[1].hitPoints = 12;
        characterArray[1].maxHitPoints = 13;
        
        characterArray[2] = new Character();
        characterArray[2].name = "Mrs Peacock";
        characterArray[2].hitPoints = 12;
        characterArray[2].maxHitPoints = 14;
        
        characterArray[3] = new Character();
        characterArray[3].name = "Mrs White";
        characterArray[3].hitPoints = 8;
        characterArray[3].maxHitPoints = 10;
        
        characterArray[4] = new Character();
        characterArray[4].name = "Mr. Boddy";
        characterArray[4].hitPoints = 11;
        characterArray[4].maxHitPoints = 14;
        
        characterArray[5] = new Character();
        characterArray[5].name = "Professor Plum";
        characterArray[5].hitPoints = 14;
        characterArray[5].maxHitPoints = 16;
        
        characterArray[6] = new Character();
        characterArray[6].name = "Reverand Green";
        characterArray[6].hitPoints = 7;
        characterArray[6].maxHitPoints = 9;
        
        printArray(characterArray);
        
        healCharacter(characterArray[4], 5);
        
        printArray(characterArray);
        
        System.out.println("The healthiest person is " +
                           nameOfMostHealthyCharacter(characterArray));
        
        String magicWord = new String("abacadabra");
        String otherMagicWord = new String("abacadabra");
        
// this expression is NOT true
        if (magicWord == otherMagicWord)
        {
            System.out.println("TRUE!!!!");
        }
        
    }
}
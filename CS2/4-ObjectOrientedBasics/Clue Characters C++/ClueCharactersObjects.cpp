#include <iostream>
#include <string>

using namespace std;

// Define a character as they might appear in a simple
// game involving health.  The only difference in this objects
// first is that we define a class, and label the attributes as
// public.
class character
{
public:
    string name;
    int hitPoints;
    int maxHitPoints;
};


// Take an array as a parameter, and print out its contents.
// Assumes that the size value is valid (within bounds of
// the array).
void printArray(character characterArray[], int size)
{
    for (int i=0; i < size; i++)
    {
        cout << characterArray[i].name << ":\t\t" << characterArray[i].hitPoints;
        cout << "\t(" << characterArray[i].maxHitPoints << ")\n";
    }

    cout << "\n";
}


// Takes a reference to a character as a parameter, and adjusts
// the character's hit points as they heal
void healCharacter(character & characterToHeal, int health)
{
    characterToHeal.hitPoints += health;
    if (characterToHeal.hitPoints > characterToHeal.maxHitPoints)
    {
        characterToHeal.hitPoints = characterToHeal.maxHitPoints;
    }
}


string nameOfMostHealthyCharacter(character characters[], int size)
{
    // Assume that the first person is the healthiest for now
    int healthiestIndex = 0;
    int highestHealth = characters[0].hitPoints;

    // Start the loop at the second person (if there's only one,
    // then the loop will just finish right away)
    for (int i=1; i < size; i++)
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


int main()
{
    const int ARRAY_SIZE = 7;
    character characterArray[ARRAY_SIZE] =
    {
        {"Col. Mustard", 10, 15},
        {"Miss Scarlet", 12, 13},
        {"Mrs Peacock", 12, 14},
        {"Mrs White", 8, 10},
        {"Mr. Boddy", 11, 14},
        {"Professor Plum", 14, 16},
        {"Reverend Green", 7, 9},
    };

    printArray(characterArray, ARRAY_SIZE);

    healCharacter(characterArray[4], 5);

    printArray(characterArray, ARRAY_SIZE);

    cout << "The healthiest person is " <<
            nameOfMostHealthyCharacter(characterArray, ARRAY_SIZE) << endl;
    
    return 0;
}


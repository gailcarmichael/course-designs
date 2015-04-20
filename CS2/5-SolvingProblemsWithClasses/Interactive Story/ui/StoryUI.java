// For the purposes of demonstration, I put the UI in its own
// package, and left off public so nothing outside the package
// could access this class.  You do NOT have to do this for your
// assignment, but you can if you want to.  Your folder structure
// has to match the package name (e.g. classes in package ui have\
// to be inside a ui folder).
package ui;

import data.BranchingStory;
import java.util.Scanner;

// Our UI is simple and only involves one class, but it could
// have more classes without causing any problems.
class StoryUI
{
    private BranchingStory story;
    
    StoryUI(BranchingStory newStory)
    {
        story = newStory;
    }
    
    // The main method will use this to kick start the UI
    void runStory()
    {
        story.startStory();
        
        while (!story.isFinished())
        {
            // Print out the scene text
            System.out.println(story.getCurrentScene().getText() + "\n");
            
            if (story.getCurrentScene().isTerminal())
            {
                System.out.println("~~THE END~~");
                story.stopStory();
            }
            else
            {
                // Choices: display the options
                for (int i=0; i < story.getCurrentScene().getNumChoices(); i++)
                {
                    System.out.println((i+1) + ". " + story.getCurrentScene().getNthChoiceText(i));
                }
                
                // Get the user's choice
                Scanner input = new Scanner(System.in);
                int choiceIndex = input.nextInt() - 1; // subtract for zero indexing
                
                if (!story.makeChoice(choiceIndex))
                {
                    System.out.println("Sorry, that is not a valid choice.");
                }
            }
        }
    }
    
    
    
    public static void main(String[] args)
    {
        // Make a new story and kickstart it
        StoryUI ui = new StoryUI(BranchingStory.getSampleStory());
        ui.runStory();
    }
}
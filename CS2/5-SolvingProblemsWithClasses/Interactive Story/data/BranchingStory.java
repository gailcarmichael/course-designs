package data;


public class BranchingStory
{
    // The branching story only needs to know the first scene
    // since those scenes will reference whatever scenes come
    // next
    private Scene firstScene;
    
    // The branching story also keeps track of where we are
    // in the story
    private Scene currentScene;
    
    // Tracks whether a story is in progress or not
    private boolean inProgress;
    
    
    public BranchingStory(Scene newFirstScene)
    {
        firstScene = newFirstScene;
    }
    
    
    // This is the only information outsiders need to access directly.
    // Everything else users need to do can be done through more
    // specific methods.
    public Scene getCurrentScene() { return currentScene; }
    
    
    // Start a new story, resetting the current scene
    public void startStory()
    { 
        currentScene = firstScene;
        inProgress = true;
    }
    
    // Stop a story
    public void stopStory()
    {
        inProgress = false;
    }
        
    
    // Is the story finished?
    public boolean isFinished()
    {
        return !inProgress;
    }
    
    
    // Allows users of the story to make a choice within the 
    // current scene, returning whether the scene was successfully
    // moved forward.
    public boolean makeChoice(int choiceIndex)
    {
        Scene s = currentScene.getNthNextScene(choiceIndex);
        if (s != null)
        {
            currentScene = s;
            return true;
        }
        else
        {
            return false;
        }
    }
    
    
    // A static helper method that returns an example story that we can use
    // for testing
    public static BranchingStory getSampleStory()
    {
        Scene scene1 = new Scene("Welcome",
                                 "Welcome to the tale of a very mysterious creature. Nobody knows " +
                                 "just how strong it is, because everyone is too afraid to confront " +
                                 "it. Are you brave enough to help?");
        
        Scene scene2 = new Scene("AmBrave",
                                 "Ah, so you think you are brave enough to face almost certain death. " +
                                 "Well, if you insist then! Let us decide on your weapon of choice.");
        
        Scene scene3 = new Scene("PrepareForBattle",
                                 "Aye, practice is always needed, no matter how fine the weapon. " +
                                 "You shall practice through the night.");
        
        Scene scene4 = new Scene("AmNotBrave",
                                 "I don't blame you. I'm scared just thinking about it.  Here, " +
                                 " take this staff, and let it protect you. Are you ready?");
        
        Scene scene5 = new Scene("OnToFight",
                                 "Onward to the creature's lair! How will you approach your " +
                                 "attack?");
        
        Scene scene6 = new Scene("SneakFinish",
                                 "You sneak into the creature's lair, only to find that it " +
                                 "was just a cat all along. Funny how those things can " +
                                 "make such spooky shadows.");
        
        Scene scene7 = new Scene("AttackFinish",
                                 "You rage into the creature's lair, weapon flailing. When you " +
                                 "make contact, you suddenly realize that the creature was... just " +
                                 "a cat.  You scoop it up into your arms and return home triumphant.");
        
        ///////////////////////////////////////////////////////////////
        
        scene1.addChoice("I am brave enough.", scene2);
        scene1.addChoice("I am too scared!", scene4);
        
        scene2.addChoice("I choose the Goddess sword.", scene3);
        scene2.addChoice("I choose the crossbow.", scene3);
        
        scene3.addChoice("I will give it my all.", scene5);
        scene3.addChoice("I am too scared.", scene4);
        
        scene4.addChoice("I wish to practice.", scene3);
        scene4.addChoice("I am ready to fight.", scene5);
        
        scene5.addChoice("I will sneak up to the creature.", scene6);
        scene5.addChoice("I will attack straight on.", scene7);
        
        
        ///////////////////////////////////////////////////////////////
                         
        BranchingStory story = new BranchingStory(scene1);
        
        return story;
    }
}
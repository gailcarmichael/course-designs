package data;

public class Choice
{
    private String text;
    private Scene nextScene;
    
    public Choice(String newText, Scene newNextScene)
    {
        text = newText;
        nextScene = newNextScene;
    }
    
    // Once a Choice object is created, it should not change;
    // therefore, we have only getters and no setters
    public String getText() { return text; }
    public Scene getNextScene() { return nextScene; }
}
// Code originally written by Mark Lanthier

public class BinaryTreeTest 
{
    public static void main(String[] args) 
    {
        BinaryTree  root;
        
        root = new BinaryTree("A",
                              new BinaryTree("B",
                                             new BinaryTree("C",
                                                            new BinaryTree("D"),
                                                            new BinaryTree("E",
                                                                           new BinaryTree("F",
                                                                                          new BinaryTree("G"),
                                                                                          new BinaryTree("I")),
                                                                           new BinaryTree("H"))),
                                             new BinaryTree("J",
                                                            new BinaryTree("K",
                                                                           null,
                                                                           new BinaryTree("L",
                                                                                          null,
                                                                                          new BinaryTree("M"))),
                                                            new BinaryTree("N",
                                                                           null,
                                                                           new BinaryTree("O")))),
                              new BinaryTree("P",
                                             new BinaryTree("Q"),
                                             new BinaryTree("R",
                                                            new BinaryTree("S",
                                                                           new BinaryTree("T"),
                                                                           null),
                                                            new BinaryTree("U"))));
        
        System.out.println("The tree's height is: " + root.height());
        System.out.println("The tree's leaves are: " + root.leafData());
    }
}

public class TestClass
{
    public static void main(String[] args)
    {
        // Here are some objects we can store in our lists...
        
        ReadThis r1 = new ReadThis("http://www.bustle.com/articles/" +
                                   "63466-im-brianna-wu-and-im-risking-" +
                                   "my-life-standing-up-to-gamergate");
        
        ReadThis r2 = new ReadThis("http://i.imgur.com/4NjBQzn.jpg");
        
        ReadThis r3 = new ReadThis("http://imgur.com/zhppgSx");
        
        ReadThis r4 = new ReadThis("http://gnuu.org/2009/09/18/writing-" +
                                   "your-own-toy-compiler/all/1/");
        
        ReadThis r5 = new ReadThis("https://gigaom.com/2015/02/10/samsung-" +
                                   "tvs-start-inserting-ads-into-your-movies/");

        
        
        ////
        // Create a linked list object and add nodes to it:
        
        LinkedList list = new LinkedList();

        list.addNodeToEnd(new ListNode(r1));
        list.addNodeToEnd(new ListNode(r2));
        
        ListNode.printNumNodes(); // <- best way to call a static method
        
        list.printList();
        
        
        ////
        // Add nodes to the beginning, end, and middle:
        
        list.addNodeToBeginning(new ListNode(r3));
        
        list.addNodeToEnd(new ListNode(r4));
        
        list.addNodeAfterNode(new ListNode(r5), list.getNthNode(0));
        
        ListNode.printNumNodes();
        list.printList();
        
        
        ////
        // Let's test removing nodes from the beginning, middle, and end:
        
        list.removeFirstNode();
        list.printList();
        
        list.removeLastNode();
        list.printList();
        
        list.removeNode(list.getNthNode(1));
        list.printList();
        
        list.removeNode(list.getNthNode(0));
        list.printList();
        
        list.removeNode(list.getNthNode(0));
        list.printList(); // <- should be empty
    }
    
    
    
}

// This class demonstrates one way to encapsulate the linked
// list code that we previously had in ListNode and the testing
// class.  It makes use of the methods we already have in ListNode.

public class LinkedList
{
    private ListNode head;
    
    public LinkedList()
    {
        head = null;
    }
    
    
    public ListNode getNthNode(int n)
    {
        ListNode curr = head;
        for (int i=0; i < n && curr != null; i++)
        {
            curr = curr.getNext();
        }
        return curr;
        
    }
        
    
    public void printList()
    {
        if (head == null)
        {
            System.out.println("List is empty.");
        }
        else
        {
            head.printListFromHere();
        }
    }
    
    
    public void addNodeToBeginning(ListNode newNode)
    {
        if (head == null)
        {
            head = newNode;
        }
        else
        {
            head = head.addNodeToBeginning(newNode);
        }
    }
    
    
    public void addNodeToEnd(ListNode newNode)
    {
        if (head == null)
        {
            head = newNode;
        }
        else
        {
            head.addNodeToEnd(newNode);
        }
    }
    
    
    public void addNodeAfterNode(ListNode newNode, ListNode addAfter)
    {
        // Don't add if we can't find the node to add after (so,
        // if the list is empty, do nothing)
        
        if (head != null)
        {
            head.addNodeAfterNode(newNode, addAfter);
        }
    }
    
    
    public void removeFirstNode()
    {
        // Nothing to remove if the list is empty
        
        if (head != null)
        {
            head = head.removeFirstNode();
        }
    }
    
    
    public void removeLastNode()
    {
        // Nothing to remove if the list is empty
        
        if (head != null)
        {
            head = head.removeLastNode();
        }
    }
    
    
    public void removeNode(ListNode toRemove)
    {
        // Nothing to remove if the list is empty
        
        if (head != null)
        {
            head = head.removeNode(toRemove);
        }
    }
    
    
    public int getLength()
    {
        if (head == null)
        {
            return 0;
        }
        else
        {
            return head.getLength();
        }
        
    }
}
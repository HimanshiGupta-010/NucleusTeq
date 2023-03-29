import java.util.*;

public class TestSet 
{
    public static void main(String args[]) //Main Method
    {
        HashSet hs = new HashSet(); //HashSet Object

        //Adding elements to the HashSet Object
        hs.add(1);
        hs.add(2);
        hs.add(3);
        hs.add(1);
        hs.add(2);
        hs.add(3);
        hs.add(3);
        hs.add(3);
        hs.add(3);

        //Printing Elements of HashSet
        System.out.println(hs);
    }   
}

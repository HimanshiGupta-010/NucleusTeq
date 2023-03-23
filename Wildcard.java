//Learn abount wildcards in generics.

import java.util.*;

public class Wildcard 
{
    public void print(ArrayList<?> arr)
    {
        for(Object i : arr)
            System.out.println(i);
    }

    public static void main(String args[])
    {
        Wildcard wc = new Wildcard();

        ArrayList<String> ar = new ArrayList<>();
        ar.add("Himanshi");
        ar.add("Gupta");

        wc.print(ar);
    }
}
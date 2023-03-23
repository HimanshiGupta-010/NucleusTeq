/*
 Try simple programs to deep dive into generics.
 */

import java.util.*;

public class Generic 
{
    public void demo(ArrayList<? super Integer> arr)
    {
        for(Object i : arr)
            System.out.println(i);
    }
    public static void main(String args[])
    {
        Generic g = new Generic();

        ArrayList<Number> n = new ArrayList<>();

        n.add(1.0);
        n.add(2.0);

        g.demo(n);

        ArrayList<Integer> ar = new ArrayList<>();

        ar.add(76);
        ar.add(46);

        g.demo(ar);
    }
}

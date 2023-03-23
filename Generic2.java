/*
  Try simple programs to deep dive into generics.
 */

import java.util.*;

public class Generic2 
{
    public void demo(ArrayList<? extends Number> arr)
    {
        
        for(Number num : arr)
        {
            System.out.println(num);
        }

        System.out.println();
    }
    public static void main(String args[])
    {
        Generic2 g2 = new Generic2();

        ArrayList<Integer> ar = new ArrayList<>();

        ar.add(86);
        ar.add(27);
        ar.add(67);
        g2.demo(ar);
        ArrayList<Double> d = new ArrayList<>();
        d.add(2.8);
        d.add(7.5);
        g2.demo(d);
    }
}

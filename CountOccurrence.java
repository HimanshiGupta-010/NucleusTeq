//Map
/* WAP to count frequency of given list of digit and alphabets in string 
  i/p {1,1,2,2} --> 1=2, 2=2
*/

import java.util.*;

public class CountOccurrence
{
    //Driver Code
    public static void main(String args[])
    {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a String");
        String str = sc.nextLine();

        HashMap<Character, Integer> HM = new HashMap<Character, Integer>();
        char[] strArray = str.toCharArray();

        for(char ch : strArray)
        {
            if(HM.containsKey(ch))
            {
                HM.put(ch, HM.get(ch)+1);
            }
            else
            {
                HM.put(ch, 1);
            }
        }
        for(Map.Entry<Character, Integer> e : HM.entrySet())
        {
            System.out.println(e.getKey() + " = " + e.getValue());
        }
    }
}
import java.util.*;

public class List1 
{
    public static void main(String args[]){
        //ArrayList with Duplicates 
        ArrayList arr = new ArrayList();

        arr.add(1);
        arr.add(2);
        arr.add(1);
        arr.add(2);
        arr.add(1);
        arr.add(2);
        arr.add(1);
        arr.add(2);
        arr.add(1);
        
        //Set to store only Unique Values
        Set s = new HashSet(arr);
        
        arr.clear();

        //Store all the unique values on ArrayList
        arr.addAll(s);
    
        System.out.println(arr);

    }
    
}
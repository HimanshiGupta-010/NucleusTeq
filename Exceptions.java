//Try different exceptions.

import java.io.*;

public class Exceptions 
{
    public static void main(String[] args) 
    {
        //Example of Arithmetic Exception
        int a = 10;
        int b = 0;

        try 
        {
            int result = a / b; // This will throw an ArithmeticException
        } 
        catch (ArithmeticException e) 
        {
            System.out.println("Caught ArithmeticException: " + e.getMessage());
        }

        //Example of NullPointerException
        String str = null;
        
        try 
        {
            int length = str.length(); // This will throw a NullPointerException
        } 
        catch (NullPointerException e) 
        {
            System.out.println("Caught NullPointerException: " + e.getMessage());
        }
          
        //Example of FileNotFoundException
        try
        {
            FileReader file = new FileReader("C:\\Users\\hp\\Desktop\\abc.txt");//This will throw FileNotFoundException
        }
        catch(IOException e)
        {
            System.out.println(e);
        }
    }
}

        


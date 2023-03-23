//File Handling

import java.io.*;

public class Writer 
{
    public static void main(String args[])
    {
        try
        {
            FileWriter file = new FileWriter("C:\\Users\\hp\\Desktop\\file.txt");
            try
            {
                file.write("Learning Java");
            }
            finally
            {
                file.close();
            }
            System.out.println("Writing Successfull...!!");
        }
        catch(IOException e)
        {
            System.out.println(e);
        }
    }    
}

//File Handling

import java.io.*;

public class BWriter 
{
    public static void main(String args[]) throws IOException
    {
        try
        {
            BufferedWriter bw =  new BufferedWriter(new FileWriter("C:\\Users\\hp\\Desktop\\file.txt", true));
            try
            {
                bw.write("  Computer");
            }
            finally
            {
                bw.close();
            }
            System.out.println("Writing Successful...!!!");
        }
        catch(IOException e)
        {
            System.out.println(e);
        }
    }
}

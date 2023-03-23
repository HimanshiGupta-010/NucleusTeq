//File Handling

import java.io.*;

public class BReader 
{
    public static void main(String args[])
    {
        try
        {
            BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\hp\\Desktop\\file.txt"));
            try
            {
                int i;
                while((i=br.read())!=-1)
                {
                    System.out.print((char)i);
                }
                System.out.println("");
            }
            finally
            {
                br.close();
            }
            System.out.println("Reading Successfull!!!");
        }
        catch(IOException e)
        {
            System.out.println(e);
        }
    }   
}

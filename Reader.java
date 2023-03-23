//File Handling

import java.io.*;

class Reader 
{
    public static void main(String args[])
    {
        try
        {
            FileReader file = new FileReader("C:\\Users\\hp\\Desktop\\file.txt");
            try
            {
                int i;
                while((i=file.read())!=-1)
                {
                    System.out.print((char)i);
                }
            }
            finally
            {
               file.close();
            }           
            System.out.println("");
            System.out.println("Reading Successfull...!!");
        }     
        catch(IOException e)
        {
            System.out.println("Exception Handled");
        }
    }
}
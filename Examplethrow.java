/*
 ??Write a program to implement use of throw and throws.  
*/

import java.io.IOException;

class Examplethrow
{  
  void demo() throws IOException
  {  
    //checked exception
    throw new IOException("device error");  
  }  
  
  void dummy() throws IOException{  
    demo();  
  }  

  void print()
  {  

   try
   {  
    dummy();  
   }
   catch(Exception e)
   {
    System.out.println("Exception handled");
   }

  }  
  public static void main(String args[])
  {  
   
   Examplethrow obj = new Examplethrow();  
   obj.print();  
   System.out.println("normal flow...");  
  }  
}  
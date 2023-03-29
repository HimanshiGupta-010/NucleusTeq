//List
/*
create a menu program with following options
1.add
2.remove
3.display element
4.exit
program should run until user choose 4th option. 
*/

import java.util.*;

public class List2 
{
    public static void main(String args[]) //Main method
    {
        //Variable Declaration
        ArrayList arr = new ArrayList();
        int choice;
        int data;

        //Menu Driven program
        while(true) //Infinite loop
        {
            Scanner sc = new Scanner(System.in);
            
            System.out.println("1. Add\n2. Remove\n3. Display Elements\n4. Exit\n");
            System.out.println("Enter your choice");
            choice = sc.nextInt();
            
            System.out.println("");

            switch(choice)
            {
                case 1: 

                    //To add new object in ArrayList
                    System.out.println("Enter an object to enter");
                    data = sc.nextInt();
                    arr.add(data);

                    System.out.println("");

                    break;
                
                case 2:

                    //To remove an object from ArrayList
                    if(arr.isEmpty())
                    {
                        System.out.println("ArrayList is empty");
                    }
                    else 
                    {
                        System.out.println("Enter an object's index number to remove");
                        data = sc.nextInt();

                        if(data > (arr.size() - 1))
                        {
                            System.out.println("Enter valid index");
                        }
                        else
                        {
                            arr.remove(data);
                        }
                    }

                    System.out.println("");

                    break;

                case 3:

                    //To display all object of ArrayList
                    System.out.println(arr);
                    System.out.println("");
                    break;

                case 4:

                    //To Terminate or exit from the loop
                    System.exit(0);
                
               default:

                    //For Incorrect choice
                    System.out.println("Wrong Choice...Please Try Again");
                    System.out.println("");
            }
        }
    }   
}
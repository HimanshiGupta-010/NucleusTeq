//Write a program to convert currency in respective country value. (switch case)Eg - i/p X o/p Y$

import java.util.*;

public class ConvertCurrency 
{
   public static void main(String args[])
   {
    Scanner sc = new Scanner(System.in);
    //Taking input from the user
    System.out.println("Type 1 for Rupee to Dollar conversion : ");
    System.out.println("Type 2 for Dollar to Rupee conversion : ");
    System.out.println("Type 3 for Rupee to euro conversion : ");

    int choice = sc.nextInt();

    switch(choice)
    {
        //Rupee to dollar
        case 1 :
        System.out.println("Enter rupee amount : ");
        double r1 = sc.nextDouble();
        double d1 = r1/82.32;
        System.out.println(r1 + " rupees => " + d1 + " dollars ");
        break;

        //Dollar to rupee
        case 2:
        System.out.println("Enter dollar amount : ");
        double d2 = sc.nextDouble();
        double r2 = d2 * 82.32;
        System.out.println(d2 + " dollars => " + r2 + " rupees ");
        break;

        //Rupee to euro
        case 3:
        System.out.println("Enter Rupee Amount : ");
        double re = sc.nextDouble();
        double euro = re/86.92;
        System.out.println(re+ " euro => "+ euro +" euro ");
        break;

        default:
        System.out.println("Incorrect Choice");
    }
   }
}

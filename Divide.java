//Write a java program to divide two numbers and print on the screen.

import java.util.*;

public class Divide 
{
    public static void main(String args[])
    {
        //variable declaration
        int num1, num2;
        Scanner sc = new Scanner(System.in);

        //Taking input from the user
        System.out.println("Enter first number : ");
        num1 = sc.nextInt();

        System.out.println("Enter second number : ");
        num2 = sc.nextInt();

        if(num2!=0)
        {
            System.out.println(num1+" / "+num2+" : "+ num1/num2);
        }
        else
        {
            System.out.println("Divider must be non zero");
        }
    }
}

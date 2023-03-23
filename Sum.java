//Write a java program to print the sum of two numbers.

import java.util.*;

public class Sum 
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

        System.out.println("Sum of "+num1+" and "+num2+ " is : "+(num1+num2));
    }
}

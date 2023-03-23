//Write a java program that takes two numbers as input and display the product of two numbers.

import java.util.*;

public class Product 
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

        System.out.println("Product of "+num1+" and "+num2+ " is : "+(num1*num2));
    }    
}

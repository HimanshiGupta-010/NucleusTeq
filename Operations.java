//Write a program to print the sum(addition), multiply, subtract, divide and remainder of two numbers. 

import java.util.*;

public class Operations 
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
        System.out.println("Multiplication of "+num1+" and "+num2+ " is : "+(num1*num2));
        System.out.println("Subtraction of "+num1+" and "+num2+ " is : "+(num1-num2));

        if(num2!=0)
        {
            System.out.println("Division of "+num1+" and "+num2+" is : "+(num1 / num2));
        }
        else
        {
            System.out.println("Divider must be non zero");
        }

        System.out.println("Remainder of "+num1+" and "+num2+ " is : "+(num1%num2));
    }
}

//Write a java program that takes three numbers as input to calculate and print the average of the numbers.

import java.util.*;

public class Average 
{
    public static void main(String args[])
    {
        double num1, num2, num3; //variable declaration
        double avg;

        //Creating Scanner class object for taking input from the user
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter first number : ");
        num1 = sc.nextDouble();

        System.out.println("Enter second number : ");
        num2 = sc.nextDouble();

        System.out.println("Enter third number : ");
        num3 = sc.nextDouble();

        //Calculating average
        avg = (num1 + num2 + num3)/3;

        //Printing average of three numbers
        System.out.println("Average of "+num1+" and "+num2+ " and "+num3+" is : "+avg);
    }
}

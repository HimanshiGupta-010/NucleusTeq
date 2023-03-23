//Write a program to calculate simple interest and compound interest.

import java.util.*;

class Interest 
{
    public static void main(String args[])
    {
        //variable declaration
        double p, r, t, s_interest, c_interest;
        Scanner sc = new Scanner(System.in);

        //Taking input from the user
        System.out.println("Enter the value of principal : ");
        p = sc.nextDouble();

        System.out.println("Enter the annual rate of interest : ");
        r = sc.nextDouble();

        System.out.println("Enter the time (year) : ");
        t = sc.nextDouble();

        //Calculating simple and compound interest
        s_interest = (p * r * t)/100;
        c_interest = p * Math.pow(1.0 + r/100.0, t) - p;

        //printing simple and compound interest
        System.out.println("Simple Interest : " + s_interest);
        System.out.println("Simple Interest : " + c_interest);
    }
}
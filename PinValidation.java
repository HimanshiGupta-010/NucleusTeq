//Write a program to check valid i/p pin num. format-ex.443 122

import java.util.regex.*;
import java.util.*;

class PinValidation 
{
    public static boolean isValidPinCode(String pincode)
    {
        //To check pattern
        String regex = "^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$";
        Pattern p = Pattern.compile(regex);

        if(pincode == null)
        {
            return false;
        }

        Matcher m = p.matcher(pincode);
        return m.matches();
    }
    public static void main(String args[])
    {
        //variable declaration
        String num1;
        Scanner sc = new Scanner(System.in);

        //Taking user input
        System.out.println("Enter pin code");
        num1 = sc.nextLine();

        System.out.println(num1  + " : " + isValidPinCode(num1));
    }    
}

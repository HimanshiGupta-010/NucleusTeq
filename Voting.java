//Built custom exception

class UnderAgeException extends Exception
{
    //building custom exception
    UnderAgeException()
    {
        System.out.println("You are under age");
    }
    UnderAgeException(String message)
    {
        super(message);
    }
}

class Voting
{
    public static void main(String args[])
    {
        //variable declaration
        int age = 15;
        
        //Handling exception
        try
        {
            if(age<18)
            {
                throw new UnderAgeException();
            }
            else
            {
                System.out.println("You can vote now...");
            }
        }
        catch(UnderAgeException e)
        {
            e.printStackTrace();
        }
    }
}
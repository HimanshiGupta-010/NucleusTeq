/*
 Create a class phone which is having to method call() and sms(), create an interface which having abstract method click() and record(), 
 create another interface MusicPlayer having abstract class play() and stop() method.

 Create concrete class SmartPhone which extends class phone and implements interface camera and MusicPlayer and display all the mentioned
 method by creating object and references.
 */

class Phone 
{
    //public methods
    public void call()
    {
        System.out.println("Inside call() method of class Phone");
    }

    public void sms()
    {
        System.out.println("Inside sms() method of class Phone");
    }
}

//creating an interface camera
interface camera 
{
    //creating abstract methods
    public void click();
    public void record();
}

//creating an interface MusicPlayer
interface MusicPlayer 
{
    //creating abstract methods
    public void play();
    public void stop();
}

class SmartPhone extends Phone implements camera, MusicPlayer 
{
    //overriding click(), record(), play() and stop() method
    public void click()
    {
        System.out.println("Inside click() method of interface camera");   
    }

    public void record()
    {
        System.out.println("Inside record() method of interface camera");
    }
    
    public void play()
    {
        System.out.println("Inside play() method of interface MusicPlayer");
    }

    public void stop()
    {
        System.out.println("Inside stop() method of interface MusicPlayer");
    }
}

public class InterfaceClass
{
        public static void main(String args[])
        {
            //Creating an object of SmartPhone class
            SmartPhone sp = new SmartPhone();
            
            //calling phone class methods
            sp.call();
            sp.sms();
            
            sp.click();
            sp.record();
            sp.play();
            sp.stop();
        }
}
 

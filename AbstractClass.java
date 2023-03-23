/* 
Create an abstract class Shape having no properties and two abstract method perimeter() and area().
Create two concrete class Circle and Rectangle which extends abstract class Shape and override the abstract method perimeter() and area().   
Display perimeter and area of circle and rectangle.
*/


//Creating abstract class Shape
abstract class Shape 
{
    //abstract methods
    abstract void perimeter();
    abstract void area();
}

class Circle extends Shape 
{    
    //overriding abstract methods of Shape class

    void perimeter()
    {
        System.out.println("Inside class circle");
        System.out.println("Perimeter of Circle : 2*PI*r");
    }

    void area()
    {
        System.out.println("Inside class circle");
        System.out.println("Area of circle : PI*r*r");
    }
}

class Rectangle extends Shape 
{
    //overriding abstract methods of Shape class

    void perimeter()
    {
        System.out.println("Inside class rectangle");
        System.out.println("Perimeter of rectangle : 2(length + breadth)");
    }

    void area()
    {
        System.out.println("Inside class rectangle");
        System.out.println("Area of rectangle : length * breadth");
    }
}

public class AbstractClass
{

    public static void main(String args[])
    {
        //Creating objects of Rectangle and Circle class

        Rectangle r = new Rectangle();
        Circle c = new Circle();

        // calling methods of Rectangle class
        r.perimeter();
        r.area();

        // calling methods of Circle class
        c.perimeter();
        c.area();
    } 
}


/* PROGRAM NO: 10 AIM : Create an interface having prototypes of functions area() 
and perimeter(). Create two classes Circle and Rectangle which implements the above interface. 
Create a menu driven program to find area and perimeter of objects. */

import java.util.Scanner; 

interface Shapes 
{     
	Scanner in=new Scanner(System.in);     
	static double PI=3.14;     
	double area(); 
    double perimeter(); 
} 

class Circle implements Shapes 
{     
	public double area()     
	{         
		System.out.print("Enter the radius: ");         
		int radius=in.nextInt();         
		return PI*radius*radius;     
	} 
    public double perimeter()     
	{         
		System.out.print("Enter the radius: ");         
		int radius=in.nextInt();         
		return 2*PI*radius;     
	} 
} 

class Rectangle implements Shapes 
{    
	public double area()     
	{         
		System.out.print("Enter the length: ");         
		int length=in.nextInt(); 
		System.out.print("Enter the breadth: ");         
		int breadth=in.nextInt();         
		return length*breadth;     
	} 
	public double perimeter()     
	{         
		System.out.print("Enter the length: ");         
		int length=in.nextInt();         
		System.out.print("Enter the breadth: ");         
		int breadth=in.nextInt();         
		return 2*(length+breadth);     
	} 
} 

public class Area_Prei_Menudriven 
{     
	public static void main(String args[])     
	{         
		Scanner in=new Scanner(System.in);         
		int choice;         
		Circle c=new Circle();         
		Rectangle r=new Rectangle();         
		while(true)         
		{             
			System.out.println("");
            System.out.println("********************************");
            System.out.println("1.Find Area of a Circle"); 
            System.out.println("2.Find Perimeter of a Circle");             
			System.out.println("3.Find Area of a Rectangle");             
			System.out.println("4.Find Perimeter of a Rectangle");             
			System.out.println("5.Exit");     
            System.out.println("*********************************");        
			System.out.print("Enter your choice: ");             
			choice=in.nextInt();      
            System.out.println("");        
			switch(choice)             
			{                 
				case 1:System.out.println(c.area());                         
				break;                 
				case 2:System.out.println(c.perimeter());                         
				break;                 
				case 3:System.out.println(r.area());                         
				break;                 
				case 4:System.out.println(r.perimeter());                         
				break;                 
				case 5:System.exit(0);                         
				break;                 
				default:System.out.println("Invalid Choice!!!");             
			} 
 
        }           
	} 
} 
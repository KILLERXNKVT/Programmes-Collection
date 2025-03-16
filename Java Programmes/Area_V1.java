/* PROGRAM NO: 8 AIM : Area of different shapes using overloaded functions. */

class Shapes 
{     
	int area(int a)     
	{         
		return a*a;     
	}     
	int area(int a,int b)     
	{         
		return a*b; 
    }      
	double area(double r)     
	{         
		return 3.14*r*r;     
	} 
} 

public class Area_V1
{     
	public static void main(String args[])     
	{         
		Shapes sh= new Shapes(); 
        System.out.println("");        
		System.out.println("Area Of Sqaure of length 5: " + sh.area(5));         
		System.out.println("Area Of Rectangle of length 5 and breadth 4: " + sh.area(5,4));         
		System.out.println("Area Of Circle of radius 2: " + sh.area(2.00));     
	} 
} 
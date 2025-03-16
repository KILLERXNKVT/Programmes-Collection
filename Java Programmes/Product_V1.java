/*PROGRAM NO: 1 
Define a class ‘product’ with data members pcode, pname and price. 
Create 3 objects of the class and find the product having the lowest price. */

import java.util.Scanner; 
class Product 
{     
	int pcode, price;
	String pname; 

	Product()     // Constructor : Public No Arg Constructor 
	{         
		Scanner in = new Scanner(System.in); 
		System.out.println("Enter the pcode");         
		pcode=in.nextInt();         
		System.out.println("Enter the pname");         
		pname=in.next();         
		System.out.println("Enter the price");         
		price=in.nextInt();       
	} 
    
	void min_price(Product p1,Product p2,Product p3)    // method
	{         
		if(p1.price < p2.price)         
		{             
			if(p1.price < p3.price)
			{
				System.out.println(p1.price);
				System.out.println(p1.pname);
				System.out.println(p1.pcode);
			}                 	             
			else 
			{
				System.out.println(p3.price);
				System.out.println(p3.pname);
				System.out.println(p3.pcode); 
			}                
		}         
		else         
		{             
			if(p2.price<p3.price)
			{
				System.out.println(p2.price);
				System.out.println(p2.pname);
				System.out.println(p2.pcode);
			}                 	             
			else
			{
				System.out.println(p3.price);
				System.out.println(p3.pname);
				System.out.println(p3.pcode);
			}                 
			         
		}     
	} 
} 

public class Product_V1 
{     
	public static void main(String args[])     
	{         
		Product p1=new Product();          // constructor is invoked while
		Product p2=new Product();         // creating an object of the Product class
		Product p3=new Product();
		System.out.println("\n");         
		System.out.println("Minimum price: ");         
		p1.min_price(p1,p2,p3);      
	} 
}          
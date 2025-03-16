/* PROGRAM NO: 14 AIM : Define 2 classes; one for generating Fibonacci numbers and other 
for displaying even numbers in a given range. Implement using threads. (Runnable Interface) */

import java.util.Scanner; 
class Fibonacci implements Runnable 
{     
	int n;     
	Scanner in=new Scanner(System.in);     
	Fibonacci()     
	{         
		System.out.println("Enter the range");         
		n=in.nextInt();     
	}     
	public void run()     
	{         
		int a=0,b=1,c=0;         
		System.out.println("The 1 fibonacci number is: "+a);         
		System.out.println("The 2 fibonacci number is: "+b);         
		for(int i=2;i<n;i++)         
		{             
			c=a+b;             
			System.out.println("The "+(i+1)+" fibonacci number is: "+c);             
			a=b;             
			b=c;         
		}     
	} 
} 

class Even implements Runnable 
{     
	int n1,n2;     
	Scanner in=new Scanner(System.in);    
	Even()    
	{         
		System.out.println("Enter the starting range");        
		n1=in.nextInt();         
		System.out.println("Enter the ending range");         
		n2=in.nextInt();     
	}     
	public void run()     
	{         
		for(int i=n1;i<=n2;i++)         
		{             
			if(i%2==0)                 
			System.out.println(i+" is even");         
		}     
	} 
} 
 
class RInterface 
{     
	public static void main(String args[])     
	{         
		Fibonacci runnable1=new Fibonacci(); 
		Thread threadf=new Thread(runnable1);                 
		Even runnable2=new Even();         
		Thread threade=new Thread(runnable2);                  
		threadf.start();         
		threade.start();     
	} 
} 
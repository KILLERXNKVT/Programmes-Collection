/* PROGRAM NO: 13 AIM : Find the average of N positive integers, raising a user defined exception for each negative input. */

import java.lang.Exception; 
import java.util.Scanner; 
class Check extends Exception 
{     
	Check(String message)     
	{ 
		super(message);     
	} 
} 
public class Array_avg 
{     
	public static void main(String args[])     
	{         
		int a[]=new int[10];         
		int sum=0,k=0;         
		Scanner in=new Scanner(System.in);          
		try         
		{             
			int i=-1;             
			System.out.println("Enter values: ");             
			while(true)             
			{                 
				a[++i]=in.nextInt();                 
				k++;                 
				if(a[i]<0)                 
				{                     
					k--;                     
					throw new Check("Enter only positive values");                 
				}             
			} 
        }         
		catch(Check c)        
		{            
			System.out.println(c.getMessage());         
		} 
        finally         
		{             
			for(int j=0;j<k;j++)             
			{                 
				sum+=a[j];             
			}             
			float avg= sum/k;                 
			System.out.println("Average of given values in array is : "+avg);         
		}     
	} 
} 
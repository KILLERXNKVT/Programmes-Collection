/* PROGRAM NO: 2 
AIM : Read 2 matrices from the console and perform matrix addition. */

import java.util.Scanner; 
class Matrix 
{     
	Scanner in=new Scanner(System.in);

	int[][] insert(int m,int n)     // method
	{         
		int arr[][]=new int[10][10]; 
        for(int i=0;i<m;i++)         
		{             
			for(int j=0;j<n;j++)             
			{                     
				arr[i][j]=in.nextInt();             
			}         
		}         
		return arr;     
	}

	int[][] add(int a[][],int b[][],int m,int n)     // method
	{         
		int[][] sum=new int[10][10];         
		for(int i=0;i<m;i++)         
		{             
			for(int j=0;j<n;j++)             
			{                 
				sum[i][j]=a[i][j]+b[i][j];             
			}        
		}         
		return sum;                  
	} 
} 
public class Matrix_addition_V1 
{ 
	public static void main(String args[])         
	{             
		int a[][]=new int[10][10];             
		int b[][]=new int[10][10];             
		int c[][]=new int[10][10];             
		int i,j;                          
		Matrix m=new Matrix();             
		Scanner in=new Scanner(System.in);                          
		System.out.print("Enter no of rows for matrix 1: ");             
		int m1=in.nextInt();             
		System.out.print("Enter no of columns for matrix 1: ");             
		int n1=in.nextInt(); 
		System.out.println("");                         
		System.out.print("Enter no of rows for matrix 2: ");             
		int m2=in.nextInt();             
		System.out.print("Enter no of columns for matrix 2: ");            
		int n2=in.nextInt();     

		if(m1==m2 && n1==n2)             
		{                 
			System.out.println("");
			System.out.println("Enter the elements of first matrix");                 
			a=m.insert(m1,n1);
			System.out.println("");                 
			System.out.println("Enter the elements of second matrix");                 
			b=m.insert(m1,n2); 
			c=m.add(a,b,m1,n1);
			System.out.println("");                   
			System.out.println("Sum of two matrices are:");                 
			for(i=0;i<m1;i++)                 
			{                                         
				for(j=0;j<n1;j++)                     
				{                         
					System.out.print(c[i][j]+"\t");                     
				}                 
			}             
		}             
		else
		{
			System.out.println("");
			System.out.println("Matrix addition is not possible"); 
		}                 		           
	} 
}         
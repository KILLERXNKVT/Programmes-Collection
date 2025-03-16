/* PROGRAM NO: 5 AIM : Program to Sort strings. */

import java.util.Scanner;

class sort_logic
{
    String[] objsort(String a[],int n)
    {
        String[] arr=a;
        for(int i=0;i<n;i++)
        {
            for(int j=i+1;j<n;j++)
            {
                if(arr[i].compareTo(arr[j])>0)
                {
                   String temp = arr[i];  
                   arr[i] = arr[j];  
                   arr[j] = temp;  
                }	
            }
        }
        return arr; 
    }
}
    
public class String_sort
{
    public static void main(String args[])
    {
        Scanner sc=new Scanner(System.in);
        String arr[]=new String[10];
        int i,n;
        sort_logic s = new sort_logic();		
            
        System.out.println("");
        System.out.print("Enter number of string inputs: ");
        n=sc.nextInt();
        System.out.println("Enter " + n + " strings");
        for(i=0;i<n;i++)
        arr[i]=sc.next();
        
        System.out.println("");
        System.out.println("Given String: ");
        for(i=0;i<n;i++)
        System.out.print(arr[i]+"\t");
        System.out.println();
        arr=s.objsort(arr,n);
            
        System.out.println("After String Sort: ");
        for(i=0;i<n;i++)
        System.out.print(arr[i]+"\t");    
    }
}
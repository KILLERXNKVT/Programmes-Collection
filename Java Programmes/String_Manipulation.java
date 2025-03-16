/* PROGRAM NO: 6 AIM : Perform string manipulations. */

import java.util.Scanner; 
public class String_Manipulation 
{     
	public static void main(String args[])     
	{         
		Scanner in=new Scanner(System.in);          
		System.out.println("");
        System.out.print("Enter the string: ");        
		String txt1=in.nextLine();         
		System.out.print("The string to lower case: ");         
		System.out.println(txt1.toLowerCase());         
		System.out.print("The string to upper case: ");         
		System.out.println(txt1.toUpperCase());         
		System.out.print("The length of given string: ");         
		System.out.println(txt1.length());         
		System.out.print("The trimmed string: ");         
		System.out.println(txt1.trim());         
		System.out.print("The char to be replaced: ");         
		// in.skip("[\r\n]+");         
		String a=in.nextLine();         
		System.out.print("The char replaced with: ");         
		// in.skip("[\r\n]+");         
		String b=in.nextLine();         
		System.out.print("The replaced string: ");         
		String txt2=txt1.replace(a,b);        
		System.out.println(txt2);                
		System.out.print("Enter an integer value to convert it into String: ");         
		Integer num=in.nextInt();         
		System.out.print("Value converted to String: ");         
		System.out.println(num.toString());     
	} 
} 
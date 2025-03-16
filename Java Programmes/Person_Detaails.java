/* PROGRAM NO: 9 AIM : Create a class ‘Person’ with data members Name, Gender, 
Address, Age and a constructor to initialize the data members and another class 
‘Employee’ that inherits the properties of class Person and also contains its own data members 
like Empid, Company_name, Qualification, Salary and its own constructor. Create another class ‘Teacher’ 
that inherits the properties of class Employee and contains its own data members like Subject, Department, 
Teacherid and also contain constructors and methods to display the data members. Use array of objects to 
display details of N teachers. */

import java.util.Scanner; 

class Person_Details 
{     
	Scanner in=new Scanner(System.in);     
	String name,gender,address;     
	int age;     

	Person_Details()     
	{         
		System.out.println("");
		System.out.print("Enter name: ");         
		name=in.nextLine();         
		System.out.print("Enter gender if male M if female F others O: ");         
		gender=in.nextLine();         
		System.out.print("Enter address: ");         
		address=in.nextLine();         
		System.out.print("Enter age: ");         
		age=in.nextInt();   
		System.out.println("");    
	}     

	void display()     
	{         
		System.out.println("Name: "+name);         
		System.out.println("Gender: "+gender);         
		System.out.println("Address: "+address);         
		System.out.println("Age: "+age);    
	} 

} 

class Employee extends Person_Details 
{     
	int empid;     
	float salary;     
	String cname,quali;    

	Employee()     
	{         
		System.out.println("");
		System.out.print("Enter Employee id: ");         
		empid=in.nextInt();         
		System.out.print("Enter Company Name: ");         
		cname=in.next();         
		System.out.print("Enter Education Qualification: ");         
		in.skip("[\r\n]+");         
		quali=in.next();         
		System.out.print("Enter Salary: ");         
		salary=in.nextFloat();     
		System.out.println("");
	}     

	void display()     
	{
		super.display();         
		System.out.println("Employee id: "+empid);         
		System.out.println("Company Name: "+cname);         
		System.out.println("Education Qualification: "+quali);         
		System.out.println("Salary: "+salary);     
	} 

} 

class Teacher extends Employee 
{     
	int tid;     
	String sub,dept;    

	Teacher()     
	{         
		System.out.println("");
		System.out.print("Enter Teacher id: ");         
		tid=in.nextInt();         
		System.out.print("Enter Subject: ");         
		sub=in.next();         
		System.out.print("Enter Department: ");         
		in.skip("[\r\n]+");         
		dept=in.next();    
		System.out.println("");       
	}     
	
	void display()     
	{         
		super.display();         
		System.out.println("Teacher id: "+tid);         
		System.out.println("Subject: "+sub);         
		System.out.println("Department: "+dept);     
	} 
} 

public class Person_Detaails 
{     
	public static void main(String args[]) 
	{         
		int i=-1;         
		Teacher[] t=new Teacher[10];         
		Scanner in=new Scanner(System.in);      

		while(true)         
		{             
			System.out.println("");
			System.out.println("********************");
			System.out.println("1.Insert Teacher");             
			System.out.println("2.Display Teachers");             
			System.out.println("3.Exit");   
			System.out.println("*********************");          
			System.out.println("Enter your choice!!!");             
			int choice = in.nextInt();         
			System.out.println("");    
			switch(choice)             
			{                 
				case 1:t[++i]=new Teacher();                         
				break;              
				   
				case 2:for(int j=0;j<=i;j++)                         
				t[j].display();                         
				break;     

				case 3:System.exit(1);                         
				break;        
				         
				default:System.out.println("Invalid Choice");             
			}         
		}     
	} 
} 
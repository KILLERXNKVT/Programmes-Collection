import java.util.*;

class Employee
{
    int epid;
    double esalary;
    String ename, eaddress;
    Employee()
    {
        Scanner em = new Scanner(System.in);
        System.out.println(" ");
        System.out.print("ENTER THE EMPLOYEE ID: ");
        epid = em.nextInt();
        System.out.print("ENTER THE EMPLOYEE NAME: ");
        ename = em.next();
        System.out.print("ENTER THE EMPLOYEE SALARY: ");
        esalary = em.nextDouble();
        System.out.print("ENTER THE EMPLOYEE ADDRESS: ");
        eaddress = em.next();
    }
}

class Teacher extends Employee
{
    String tdepartment, tsubject;
    Teacher()
    {
       Scanner te = new Scanner(System.in);
       System.out.print("ENTER THE DEPARTMENT: ");
       tdepartment = te.next();

       System.out.print("ENTER THE SUBJECT: ");
       tsubject = te.next();
   }
   void display()
   {
       System.out.println("................................");
       System.out.println("ID:" + epid);
       System.out.println("NAME :" + ename);
       System.out.println("SALARY :" + esalary);
       System.out.println("ADDRESS :" + eaddress);
       System.out.println("DEPARTMENT:" + tdepartment);
       System.out.println("SUBJECT :" + tsubject);
       System.out.println("...............................");
   }
    
}

public class Multilevelinheritence_employee 
{
    public static void main(String arg[]) 
    {
        Scanner msc = new Scanner(System.in);
        System.out.print("ENTER THE NUMBER OF EMPLOYEES: ");
        int ecount = msc.nextInt();
        Teacher t[] = new Teacher[ecount];
        for(int i=0; i<ecount; i++)
        {
            t[i] = new Teacher();
        }
        System.out.println("...............................");
        System.out.println("...............................");
        System.out.println("THE DETAILS ARE...: ");
        System.out.println("...............................");
        for (int i=0; i<ecount; i++) 
        {
            t[i].display();
        }
    }    
}
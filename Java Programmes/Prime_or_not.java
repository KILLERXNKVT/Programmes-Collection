import java.util.Scanner;

public class Prime_or_not 
{
    static void checkprime(int num)
    {
       int i, flag=0;
       int cal = num/2;
      
       if(num==0||num==1)
       {
           System.out.print(num + " Is Not A Prime Number.");
       }
       else
       {
           for(i=2; i<=cal; i++)
           {
               if(num%i==0)
               {
                   System.out.println(num + " Is Not A Prime Number.");
                   flag=1;
                   break;
               }
           }
           if(flag==0)
           {
            System.out.println(num + " Is A Prime Number.");
           }
       }
    }

    public static void main(String arg[])
    {
        int num;
        System.out.print("Enter The Number To Check Whether Prime Or Not: ");
        Scanner sc = new Scanner(System.in);
        checkprime(num = sc.nextInt());
    }
}

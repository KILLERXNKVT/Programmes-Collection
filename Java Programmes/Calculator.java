import java.util.Scanner;

public class Calculator {
     public static void main(String[] args) 
     {  
        Scanner sc = new Scanner(System.in);
        int ex;

        do
        {
            System.out.print("\n");
            System.out.print("ENTER THE FIRST NUMBER: ");
            int num1 = sc.nextInt();
            System.out.print("ENTER THE SECOND NUMBER: ");
            int num2 = sc.nextInt();
    
            System.out.println("\n + Addition \n - Subtraction \n * Multiplication \n / Division \n");
            System.out.print("ENTER THE CHOICE: ");
            char choice=sc.next().charAt(0);
            switch(choice)
            {
                case '+':
                int sum = num1 + num2;
                System.out.println("THE SUM OF " + num1 + " + " + num2 + " IS " + sum);
                break;
    
                case '-':
                int sub = num1 - num2;
                System.out.println("THE SUB OF " + num1 + " + " + num2 + " IS " + sub);
                break;
                
                case '*':
                int multi = num1 * num2;
                System.out.println("THE MULTI OF " + num1 + " + " + num2 + " IS " + multi);
                break;
    
                case '/':
                int div = num1 / num2;
                System.out.println("THE DIV OF " + num1 + " + " + num2 + " IS " + div);
                break;
    
                default:
                System.out.println("Enter A Valid Choice ");
                break;
            }   

            System.out.println("");
            System.out.print("Do you want to continue? 1.Yes 2.No : ");
            ex=sc.nextInt();

            if(ex == 2 || ex >= 2)
            {
                System.out.println("Thankyou");
            }
        }
        
        while(ex==1);
    }
}

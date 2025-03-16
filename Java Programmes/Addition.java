import java.util.Scanner;

public class Addition {
     public static void main(String[] args) 
     {
        System.out.print("\n");
        Scanner sc = new Scanner(System.in);
        
        System.out.print("ENTER THE FIRST NUMBER: ");
        int num1 = sc.nextInt();
        System.out.print("ENTER THE SECOND NUMBER: ");
        int num2 = sc.nextInt();

        int sum = num1 + num2;
        System.out.println("");
        System.out.println("THE SUM OF " + num1 + " + " + num2 + " IS " + sum);
    }
}
import java.util.*;
//import java.io.*;
//import java.util.Scanner;

class Fibonacci_Series{
    public static void main(String arg[])
    {
        int limit, i, firstterm = 0, secondterm = 1, nextterm;
        short totalno;

        System.out.print("\n");
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter The Number Limit: ");
        limit = sc.nextInt();

        totalno = (short)(limit + 2);
        System.out.print("\n");
        System.out.println("The Fibonacci Series Till " + totalno  + " Terms: ");
        System.out.print(firstterm + ", " + secondterm );

        for(i=1; i<=limit; i++){
           
            nextterm = firstterm + secondterm;
            firstterm = secondterm;
            secondterm = nextterm;
            System.out.print(", " + nextterm);
        }

        System.out.print("\n");
    }
}
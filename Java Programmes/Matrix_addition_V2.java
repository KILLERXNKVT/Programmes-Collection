import java.util.Scanner;

public class Matrix_addition_V2 {
    public static void main(String arg[]) 
    {
        int i,j;
        int Matrix_A[][] = new int[10][10];
        int Matrix_B[][] = new int[10][10];
        int Sum_Matrix[][] = new int[10][10];

        Scanner sc = new Scanner(System.in);
        int m,n; 
        System.out.println("Enter the size of the matrix: ");
        m = sc.nextInt();
        n = sc.nextInt();
        System.out.println("");

        /* Matrix A*/
        System.out.println("Enter the Value for Matrix A ");
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                Matrix_A[i][j] = sc.nextInt();
            }
        }
        System.out.println("--------Matrix A-------------- ");
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                System.out.print(" " + Matrix_A[i][j] + " ");
            }
            System.out.println(" ");
        }
        
        /* Matrix B*/
        System.out.println("");
        System.out.println("Enter the Value for Matrix B ");
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                Matrix_B[i][j] = sc.nextInt();
            }
        }
        System.out.println("--------Matrix B--------------\n ");
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                System.out.print(" " + Matrix_B[i][j] + " ");
            }
            System.out.println(" ");
        }	
        
        System.out.println("");
        System.out.println("-------Matrix A + Matrix B------\n ");
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                Sum_Matrix[i][j] = Matrix_B[i][j] + Matrix_A[i][j];
            }
        }
        for(i=0;i<m;i++)
        {
            for(j=0;j<n;j++)
            {
                System.out.print(" " + Sum_Matrix[i][j] + " ");
            }
                System.out.println(" ");
        }	
    }
}
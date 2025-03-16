import java.util.Scanner;

public class Swap_two_array {
    public static void main(String[] args) 
    {
        int size, pos;
        Scanner sc = new Scanner(System.in);
        System.out.println(" ");
        System.out.print("Enter The Size Of The Array: ");
        size = sc.nextInt();

        int array1[] = new int[size];
        int array2[] = new int[size];

        System.out.println("\nEnter The Elements In The First Array: ");
        for(pos=0; pos<array1.length; pos++)
        {
            array1[pos] = sc.nextInt();
        }
        System.out.println(" ");

        System.out.println("\nEnter THe Elements In The Second Array: ");
        for(pos=0; pos<array2.length; pos++)
        {
            array2[pos] = sc.nextInt();
        }
        System.out.println(" ");

        System.out.println("THE ELEMENTS OF FIRST ARRAY: ");
        for(pos=0; pos<array1.length; pos++)
        {
            System.out.println(array1[pos] + "  ");
        }

        System.out.println("\nTHE ELEMENTS OF SECOND ARRAY: ");
        for(pos=0; pos<array2.length; pos++)
        {
            System.out.println(array1[pos] + "  ");
        }

        for(pos=0; pos<size; pos++)
        {
            array1[pos] = array1[pos] + array2[pos];
            array2[pos] = array1[pos] - array2[pos];
            array1[pos] = array1[pos] - array2[pos];
        }
        System.out.println("\nAfter Swapping The Output: ");

        System.out.println("\nELEMENTS OF FIRST ARRAY: ");
        for(pos=0; pos<array1.length; pos++)
        {
            System.out.println(array1[pos] + "  ");
        }

        System.out.println("\nELEMENTS OF SECOND ARRAY: ");
        for(pos=0; pos<array2.length; pos++)
        {
            System.out.println(array2[pos] + "  ");
        }
    }
}
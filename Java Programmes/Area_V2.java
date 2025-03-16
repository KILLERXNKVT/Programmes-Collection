/* PROGRAM NO: 8 AIM : Area of different shapes using overloaded functions. */

import java.util.*;

public class Area_V2 {

    void Area_of_triangle(float t_base , float t_height) 
    {
        double area =  (t_base * t_height)/2;
        System.out.println("Area of the triangle: " + area + " sq units");
        System.out.println(" ");
    }

    void Area_of_square(float a) 
    {
        System.out.println("Area of the square: " + a * a + " sq units");
        System.out.println(" ");
    }

    void Area_of_rectangle(float l, float b) 
    {
        System.out.println("Area of the rectangle: " + l * b + " sq units");
        System.out.println(" ");
    }

    void Area_of_circle(double r) 
    {
        double area = 3.14 * r * r;
        System.out.println("Area of the circle: " + area + " sq units");
        System.out.println(" ");
    }

    public static void main(String args[]) 
    {
        Area_V2 cal = new Area_V2();
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the base and height of a traingle: ");
        float t_base = sc.nextFloat();
        float t_height = sc.nextFloat();
        cal.Area_of_triangle(t_base, t_height);

        System.out.println("Enter the side of square: ");
        int a = sc.nextInt();
        cal.Area_of_square(a);

        System.out.println("Enter the length and breadth of a rectangle: ");
        float l = sc.nextFloat();
        float b = sc.nextFloat();
        cal.Area_of_rectangle(l, b);

        System.out.print("Enter the radius of the circle: ");
        double r = sc.nextDouble();
        cal.Area_of_circle(r);
    }
}
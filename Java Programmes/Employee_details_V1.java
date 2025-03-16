public class Employee_details_V1 {
    
    int ID;
    long PHNO;
    String NAME, DESI, DEP;

    Employee_details_V1(int eid, String ename, long ephno, String edesi, String edep)
    {
        ID = eid;
        NAME = ename;
        PHNO = ephno;
        DESI = edesi;
        DEP = edep;
    }

    void display()
    {
        System.out.println("");
        System.out.println("Employee Id: " + ID);
        System.out.println("Employee Name: " + NAME);
        System.out.println("Employee Phone Numbe: " + PHNO);
        System.out.println("Employee Phone Numbe: " + DESI);
        System.out.println("Employee Department: " + DEP);
    }
    public static void main(String arg[])
    {
        Employee_details_V1 e1 = new Employee_details_V1(1, "Kavya", 454545555, "Manager", "Company");
        e1.display();
    }
}
/* PROGRAM NO: 4 AIM : Create CPU with attribute price. Create inner class Processor 
(no. of cores, manufacturer) and static nested class RAM (memory, manufacturer). Create an object of CPU 
and print information of Processor and RAM. */

class CPU 
{     
	double price=39999.89; 

	public class Processor     
	{         
		int ncores = 8;         
		String pmanufact = "Intel";     
	}    

	public static class RAM     
	{             
		int memory = 4;             
		String rmanufact = "Kingston";    
	} 

} 

public class SystemInfo 
{     
	public static void main(String args[])     
    {        
		CPU c1=new CPU();         
		CPU.Processor p1=new CPU().new Processor();         
		CPU.RAM r1=new CPU.RAM(); 
		System.out.println("");
		System.out.print("CPU Price: ");         
		System.out.println(c1.price);         
		System.out.print("No. of Cores: ");         
		System.out.println(p1.ncores);         
		System.out.print("Processor Manufacture: ");        
		System.out.println(p1.pmanufact); 
		System.out.print("RAM Memory: "); 
		System.out.println(r1.memory);         
		System.out.print("RAM Manufacture: ");         
		System.out.println(r1.rmanufact);     
	} 
}          
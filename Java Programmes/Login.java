/* PROGRAM NO: 12 AIM : Write a user defined exception class to authenticate the user name and password. */ 

import java.lang.Exception; 
import java.util.Scanner; 
class Authenticate extends Exception 
{     
	String uid,pswd; 
    Authenticate(String message)     
	{         
		super(message);     
	}     
	Authenticate(String userid,String password)     
	{         
		uid=userid;         
		pswd=password;     
	} 
} 
 
public class Login 
{     
	public static void main(String args[])     
	{                  
		Authenticate a[]=new Authenticate[20];         
		Scanner in=new Scanner(System.in);        
		try         
		{             
			int ch=0,i=-1,flag=0;                         
			while(true)             
			{                 
				System.out.println("1.Sign Up");                 
				System.out.println("2.Login"); 
                System.out.println("3.Exit");                 
				System.out.println("Enter your choice");                 
				ch=in.nextInt();                                  
				switch(ch)                 
				{                     
					case 1:System.out.println("Enter new login name");                             
					String user_id=in.next();                             
					System.out.println("Enter new login password");                             
					in.skip("[\r\n]+");                             
					String passwrd=in.next();                             
					a[++i]=new Authenticate(user_id,passwrd);                            
					System.out.println("New User added");                            
					break;                                                  
					case 2:System.out.println("Enter login name");                             
					user_id=in.next();                             
					System.out.println("Enter login password");                             
					in.skip("[\r\n]+");                             
					passwrd=in.next();                             
					flag=0;                         
					for(int j=0;j<i+1;j++)                         
					{                         
						if(a[j].uid.matches(user_id))                         
						{                            
							if(a[j].pswd.matches(passwrd)) 
                            {                                 
								System.out.println("Welcome "+a[j].uid+" Login Success!!!");                                 
								flag=1;                             
							}                         
						}                         
					}                         
					if(flag==0)                         
					{                             
						throw new Authenticate("Invalid Credentials Please Check before Login!!!");                         
					}                         
					break;                                                  
					case 3:System.exit(1);                             
					break;                                          
					default:System.out.println("Invalid Option!!!");                                       
				}               
			}           
		}            
		catch(Authenticate e)         
		{             
			System.out.println(e.getMessage());         
		}    
	} 
} 
#include<stdio.h>
#include<stdlib.h>

#define MAX 5

int stack[MAX],top=-1;

void push()
{
	
	int item;
	
	if(top==MAX-1)
        {
	   printf("\nStack is OverFlow!!!");
        }
        else
        {
           printf("\nEnter the element to be inserted on stack:");
           scanf("%d",&item);

           top+=1;
           stack[top]=item; 
           printf("The item %d is pushed successfully!!!",stack[top]);
        }
}


void pop()
{

         
	if(top==-1)
        {
            printf("\nStack is UnderFlow!!!");
        }
        else
        {
            printf("\nItem %d is popped out",stack[top]);
            top--;
        }
}


void traversal()
{
        int i;
        
        printf("\nThe Given Stack is:\n");	
	for(i=0;i<=top;i++)
        {
            printf("%d\t",stack[i]);
        }
}


void peek()
{

	if(top==-1)
            printf("No Element to peek!!!");
        else
            printf("The top element is %d",stack[top]);
}





void main()
{
	int choice;

	while(choice)
	{ 

          printf("\nStack operations\n");
          printf("---------------------\n");	
	  printf("1.PUSH\n");
          printf("2.POP\n");
          printf("3.PEEK\n");
          printf("4.TRAVERSAL\n");
          printf("5.EXIT\n");	
          printf("Enter your choice");
          scanf("%d",&choice);

          switch(choice)
          {
		
		case 1:push();
                       break;
                case 2:pop();
                       break;
                case 3:peek();
                       break;
                case 4:traversal();
                       break;
                case 5:exit(0);
                       break;
                default:printf("Wrong Choice!!!");
	  }
       }

}

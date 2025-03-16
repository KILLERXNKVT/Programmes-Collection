/*ALGORITHM
Step 1:start
Step 2:print 1. Input,2.union,3.intersection,4.difference
Step 3:read a choice and assign to ch
Step 4:if ch==1 then call input()
Step 5:if ch==2 then call union()
Step 6:if ch==3 then call intersection()
Step 7:if ch==4 then call difference()
Step 8:else exit
Step 9:stop

Input element to bit string
Step 1:start
Step 2:read the size of first set and assign to n
Step 3:for i=0 to n read the elements
Step 2:read the size of second set and assign to n
Step 3: for i=0 to n read the elements
Step 4:print the first and second
Step 5:stop

Display the elements in bit string
Step 1:start
Step 2:print third set for i=0 to 9
Step 3:if c[i]=0 then print i+1
Step 4: stop

Union in bit string
Step 1:start
Step 2:for i=0 to 9
Step 3:if a[i]!=b[i] then c[i]=1
Step 4:else c[i]=a[i]
Step 5:call display()
Step 6:stop

Intersection in bit string
Step 1:start
Step 2:for i=0 to 9
Step 3:if a[i]=b[i] then c[i]=1
Step 4:else c[i]=0
Step 5:display third set
Step 6:for i=0 to 9 print c[i]
Step 7:call display()
Step 8:stop

Difference in bit string
Step 1:start
Step 2:for i=0 to 9
Step 3:if a[i]==1&&b[i]==1 then c[i]=1
Step 4:else c[i]=0
Step 5: for i=0 to 9 print c[i]
Step 6:call display()
Step 7:stop*/

#include <stdio.h>
void input();
void output();
void setunion();
void intersection();
void difference();
int a[] = {0, 0, 0, 0, 0, 0, 0, 0, 0}, b[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
int main()
{
    int ch, wish;
    do
    {
        printf("\n____MENU____\n");
        printf("1.Input\n2.Union\n3.Intersection\n4.Difference\n");
        printf("enter choice\n");
        scanf("%d", &ch);
        switch (ch)
        {
        case 1:
            input();
            break;
        case 2:
            setunion();
            break;
        case 3:
            intersection();
            break;
        case 4:
            difference();
            break;
        }
        printf("\nDo you wish to continue ?(1/0)\n");
        scanf("%d", &wish);
    } while (wish == 1);
}
void input()
{
    int n, x, i;
    printf("enter size of the 1st set\n");
    scanf("%d", &n);
    printf("enter elements\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &x);
        a[x - 1] = 1;
    }
    printf("enter size of the 2nd set\n");
    scanf("%d", &n);
    printf("enter elements\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &x);
        b[x - 1] = 1;
    }
    printf("\n1st set\n");
    for (i = 0; i < 9; i++)
    {
        printf("%d", a[i]);
    }
    printf("\n2nd set\n");
    for (i = 0; i < 9; i++)
    {
        printf("%d", b[i]);
    }
}
void output(int c[])
{
    int i;
    printf("\n Set is");
    for (i = 0; i < 9; i++)
    {
        if (c[i] != 0)
            printf(" %d ", i + 1);
    }
}
void setunion()
{
    int i, c[10];
    for (i = 0; i < 9; i++)
    {
        if (a[i] != b[i])
            c[i] = 1;
        else
            c[i] = a[i];
    }
    for (i = 0; i < 9; i++)
    {
        printf("%d", c[i]);
    }
    output(c);
}
void intersection()
{
    int i, c[10];
    for (i = 0; i < 9; i++)
    {
        if (a[i] == b[i])
            c[i] = a[i];
        else
            c[i] = 0;
    }
    for (i = 0; i < 9; i++)
    {
        printf("%d", c[i]);
    }
    output(c);
}
void difference()
{
    int i, c[10];
    for (i = 0; i < 9; i++)
    {
        if (a[i] == 1 && b[i] == 0)
            c[i] = 1;
        else
            c[i] = 0;
    }
    for (i = 0; i < 9; i++)
    {
        printf("%d", c[i]);
    }
    output(c);
}
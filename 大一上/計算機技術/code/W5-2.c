#include<stdio.h>

int main()
{
    int n, sum=0, n1=1, n2=1, count=0;

    printf("Please input a number: ");
    scanf("%d",&n);

    for(int i=2 ; i<=n ; i++)
    {
        int a=0;
        for(int j=2 ; j<i ; j++)
        {
            while(i % j ==0) 
            {
                a=1;
                break;
            }
        }

        if(a == 0) 
        {
            if( sum % 2 == 0 )
                n1=i;
            
            else
                n2=i;
            
            if(n2 - n1 == 2) 
            {
                printf("(%d,%d)",n1,n2);
                count++;
            }

            if(n2 - n1 == -2) 
            {
                printf("(%d,%d)",n2,n1);
                count++;
            }

            sum++;
        }   
    }
    printf("\n");
    printf("Total is %d",count);

    return 0;
}
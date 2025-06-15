#include<stdio.h>

int main()
{
    int num , sum = 0 ,total=0, comma=0;

    printf("Please input a number: ");
    scanf("%d",&num);
 
    for(int i=2 ; i<=num ; i++)
    {
        sum=0;
        for(int j=2 ; j<=i/2 ; j++)
        {
            if(i%j==0)
            {
                sum++;
                break;
            }
        }
        if(sum==0)
        {
            comma++;
            total++;
            if(comma != 1) printf(",");
            printf("%d",i);
        }
    }
    printf("\nTotal is %d",total);
    

    return 0;
}
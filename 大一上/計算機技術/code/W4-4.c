#include<stdio.h>

int main()
{
    int Lowerbound ,Upperbound;
    int sum=0, max, a, n, answer;

    printf("Please input the Lowerbound and the Upperbound:");
    scanf("%d %d",&Lowerbound,&Upperbound);

    for(int i=Lowerbound ; i<=Upperbound ; i++)
    {
        a=i;
        sum += a;
        while(a != 1)
        {
            if(a%2 == 0) a = a/2;
            else a = 3*a + 1;
            sum += a;
        }

        if(i == Lowerbound) 
        {
            max = sum;
            n = i;
        }

        else if(sum > max)
        {
            max = sum;
            n = i;
        }
        sum = 0;  
    }
    
    printf("%d %d",n,max);

    return 0;
}
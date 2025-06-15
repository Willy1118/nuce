#include<stdio.h>

int main()
{
    int num, sum;

    scanf("%d",&num);

    while(num != 0)
    {
        sum=0;
        for(int i=1 ; i<num ; i++)
        {
            for(int j=i+1 ; j<=num ; j++)
            {
                int a=i, b=j, remainder;

                while(b%a != 0)
                {
                    remainder = b%a;
                    b=a;
                    a=remainder;
                }
                sum += a;
            }
        }
        printf("%d\n",sum);
        scanf("%d",&num);
    }

    return 0;
}
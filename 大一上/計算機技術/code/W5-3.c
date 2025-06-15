#include<stdio.h>

int main()
{
    int n, number, time=1, ugly=2;

    printf("Please input a number: ");
    scanf("%d",&n);

    printf("1");

    while( time < n )
    {
        number = ugly;
        while(number % 2 == 0) number /= 2;
        while(number % 3 == 0) number /= 3;
        while(number % 5 == 0) number /= 5;
        if(number == 1)
        {
            printf(",%d",ugly);
            time++;
        }
        ugly++;
    }

    return 0;
}
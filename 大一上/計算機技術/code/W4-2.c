#include<stdio.h>

int main()
{
    int a, b, exchange, remainder;

    printf("Please input two integers: ");
    scanf("%d %d",&a,&b);

    if(a<b)
    {
        exchange=a;
        a=b;
        b=exchange;
    }

    while(a%b != 0)
    {
        remainder = a%b;
        a=b;
        b=remainder;
    }

    printf("%d",b);

    return 0;
}
#include<stdio.h>

int add(int a)
{
    int sum=0;
    while(a>=1)
    {
        sum += a%10;
        a /= 10;
    }
    if(sum>=10) add(sum);
    else return sum;
}

int main()
{
    int num;

    scanf("%d",&num);

    while(num!=0)
    {
        printf("%d\n",add(num));
        scanf("%d",&num);
    }

    return 0;
}
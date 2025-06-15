#include<stdio.h>

int main()
{
    int num1=0 , num2=1;
    int n,beside,change;
    

    printf("Please input a number: ");
    scanf("%d",&n);
    printf("%d,%d",num1,num2);

    for(int i=3 ; i<=n ; i++)
    {
        beside = num1 + num2 ;
        printf(",%d",beside);
        num1 = num2;
        num2 = beside;
    }

    return 0;
}
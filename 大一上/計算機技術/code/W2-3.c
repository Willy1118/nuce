#include<stdio.h>
#include<stdlib.h>
int main()
{
    int n, space;
    printf("Please input a number: ");
    scanf("%d",&n);

    for(int i=1 ; i<=n ; i++)
    {
        for(int j=n-i ; j>=1 ; j--) printf(" ");
        for(int k=1 ; k<=2*i-1 ; k++) printf("%d",i%10);       
        printf("\n");
    }

    return 0;
}
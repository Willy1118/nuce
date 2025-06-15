#include <stdio.h>
#include <stdlib.h>
int main()
{
    int n, space, b;
    printf("Please input a number: ");
    scanf("%d", &n);

    for (int i=1; i<=n; i++)
    {
       for(int j=n-i ; j>=1 ; j--) printf(" ");
       for(int k=1 ; k<=i ; k++) printf("%d",k%10);
       for(int l=i-1 ; l>=1 ; l--) printf("%d",l%10);
       printf("\n");
    }

    return 0;
}
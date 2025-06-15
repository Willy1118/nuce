#include <stdio.h>
#include <stdlib.h>
int main()
{
    int n,n1=1,n2=2,n3=3,n4,sum=0;

    printf("Please enter a number: ");
    scanf("%d",&n);

    for(int i=1 ; i<n/4 ; i++)
    {
        for(int j=2 ; j<n ; j++)
        {
            for(int k=3 ; k<n ; k++)
            {
                for(int l=4 ; l<n ; l++)
                {
                    if(i+j+k+l == n)
                    {
                        if((i<j) && (j<k) && (k<l)) sum += 1;
                    }
                }               
            }
        }
    }
    printf("%d",sum);

    return 0;
}
#include<stdio.h>
#include<stdlib.h>
int main()
{
    int i,n,num,sum=0;
    int max=0,min=0;
    float average;

    printf("Please input the number of integers:");
    scanf("%d",&n);

    for( i=1 ; i<=n ; i++)
    {
        printf("Integer #%d.... ",i);
        scanf("%d",&num);
        sum += num;
        if(i == 1)
        {
            max = num;
            min = num;
        }
        else
        {
            if(num > max) max = num;
            if(num < min) min = num; 
        }
    }    

    average = (float)sum/n;
    printf("The average is %.2f\n",average);
    printf("The maximum is %d\n",max);
    printf("The minimum is %d\n",min);

    return 0;
}
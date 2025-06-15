#include<stdio.h>

int main()
{
    int num, s[100]={0}, a=0, sum=0;

    printf("Please input a number:");
    scanf("%d",&num);

    for(int i=2 ; i<=num ; i++)
    {
        int record = 0;
        for(int j=2 ; j<i ; j++)
        {
            if(i%j == 0)
            {
                record = 1;
                break;
            }
        }
        if(record == 0) 
        {
            s[a] = i;
            a += 1;
        }
    }

    for(int i=0 ; i<a ; i++) 
    {
        if(s[i+1] - s[i] >= 5)
        {
            int a=0;
            for(int j=0 ; j<s[i+1]-s[i]-4 ; j++)
            {
                int k=i;
                printf("(%d,%d,%d,%d)",s[k]+1+a,s[k]+2+a,s[k]+3+a,s[k]+4+a);
                a+=1;
                sum += 1;
            }
        }
    }
    printf("\nTotal is %d",sum);

    return 0;
}
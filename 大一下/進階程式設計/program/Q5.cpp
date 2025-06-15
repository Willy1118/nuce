#include<stdio.h>

int main()
{
    long long a[100000]={0}; 

    long long Lowerbound ,Upperbound;
    long long sum=0, max=0, n, num, answer;

    scanf("%lld", &num);

    for(int x=0 ; x<num ; x++)
    {
        scanf("%lld %lld", &Lowerbound, &Upperbound);
        for(long long i=Lowerbound ; i<=Upperbound ; i++)
        {
            if(a[i] == 0) //沒算過
            {   
                long long temp=i;
                a[i]=i;
                while(temp != 1)
                {
                    if(temp%2 == 0) temp = temp/2;
                    else temp = 3*temp + 1;
                    a[i] += temp;
                }
            }
            //printf("a[%lld]=%lld\n", i, a[i]);

            if(a[i] > max) //比大小
            {
                max = a[i];
                n=i;
            }
            //printf("\nn=%lld",n);
        }
        printf("%lld %lld\n", max, n);
        max=0;
    }

    return 0;
}
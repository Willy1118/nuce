#include<stdio.h>

int main()
{
    int prime[2762], num, count=0, plus=0, answer;

    scanf("%d",&num);
    while(num != 0)
    {
        answer=0;
        count=0;
        for(int i=2 ; i<=num ; i++)
        {
            int sum=0;
            for(int j=2 ; j<=i/2 ; j++)
            {
                if(i%j == 0)
                {
                    sum++;
                    break;
                }
            }
            if(sum == 0)
            {
                prime[count] = i;
                count++;
            }
        }

        for(int i=0 ; i<count ; i++)
        {
            plus=0;
            for(int j=i ; j<count ; j++)
            {
                plus += prime[j];
                if(plus >= num) break;            
            }
            
            if(plus == num) answer += 1;
        }
        printf("%d\n",answer);

        scanf("%d",&num);
    }    
}
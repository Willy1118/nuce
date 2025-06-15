#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main()
{
    int sum=0,s,n=0;

    srand((time(NULL)));
    //int num = (rand()%31)+10;
    int num=36;
    
    printf("N=%d\n",num);

    while(num != sum) 
    {
        int a=num-sum;
        if(a%4 == 0) s=3;
        else if(a%4 == 2) s=1;
        else if(a%4 == 3) s=2;
        else s=1;

        printf("Sum=%d,computer add %d\n",sum,s);
        sum += s;
        printf("Sum=%d,You add:",sum);
        scanf("%d",&n);
        
        sum += n;
        //a = num-sum;
        
        //printf("sum=%d num=%d",sum,num);
    }
    printf("Sum=%d,You lose!!",num);

    return 0;
}
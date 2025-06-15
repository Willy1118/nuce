#include<stdio.h>

int main()
{
    int a, b, c, mode;
    int record[10]={0};

    printf("請輸入A:B.... ");
    scanf("%d:%d",&a,&b);

    for(int i=a ; i<=b ; i++)
    {
        c=i;
        while(c != 0)
        {
            mode = c%10;
            c = c/10;
            
            for(int j=0 ; j<=9 ; j++)
            {
                if(j == mode) record[j] += 1;
            }
        }
    }
    printf("0~9數字出現的數字次數為.... ");
    printf("%d",record[0]);
    for(int i=1 ; i<10 ; i++) printf(",%d",record[i]);

    return 0;
}
#include<stdio.h>
#include<string.h>

void card15(char arr[15])
{
    int total=0, a=1;
    for(int i=0 ; i<14 ; i++)
    {
        if(a==2) 
        {
            if(arr[i]*a>=10) total -= 9;
            total += (int)arr[i]*a;
            a=1;
        }
        else
        {
            total += (int)arr[i]*a;
            a=2;
        }   
    }
    if(10-total%10 == arr[14]) printf("卡號正確\n");
    else if(total%10 == 0 && arr[14] == 0) printf("卡號正確\n");
    else printf("卡號錯誤\n");
}
void card16(char arr[16])
{
    int total=0, a=2;
    for(int i=0 ; i<15 ; i++)
    {
        if(a==2) 
        {
            if(arr[i]*a>=10) total -= 9;
            total += (int)arr[i]*a;
            a=1;
        }
        else
        {
            total += (int)arr[i]*a;
            a=2;
        }  
    }
    if(10-total%10 == arr[15]) printf("卡號正確\n");
    else if(total%10 == 0 && arr[15] == 0) printf("卡號正確\n");
    else printf("卡號錯誤\n");
}

int main()
{
    int length, record=0, y, sum=0;
    char card[17], x[17];
    while(record == 0)
    {
        sum=0;
        printf("請輸入卡號:");
        scanf("%s",card);
        length = strlen(card);
        if( (length!=15) && (length!=16) )
        {
            printf("Error!! 非15或16的卡號數字");
            break;
        }

        for(int i=0 ; i<length ; i++)
        {
            card[i] = (int)card[i]-48;
        }

        for(int i=0 ; i<length ; i++)
        {
            if(card[i]<0 || card[i]>9)
            {
                record = 1;
                printf("Error!! 非15或16的卡號數字");
            }
        }
        if(record == 1) continue;

        if(length == 15) card15(card);
        if(length == 16) card16(card);
    }
    
}
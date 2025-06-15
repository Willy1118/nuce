#include<stdio.h>

int main()
{
    int num, th=3;
    int save[4]={0};

    printf("請輸入介於1-3999的阿拉數字:");
    scanf("%d",&num);
    printf("轉成羅馬數字為:");
    
    while(num>0)
    {
        save[th] += num%10;
        num /= 10;
        th--;
    }
    //for(int i=0 ; i<4 ; i++) printf("%d",save[i]); 

    if(save[0] != 0)
        for(int i=0 ; i<save[0] ; i++)
            printf("M");
    
    if(save[1] != 0)
    {
        if(save[1] < 4)
            for(int i=0 ; i<save[1] ; i++)
                printf("C");
        else if(save[1] == 4) printf("CD");
        else if(save[1] == 5) printf("D");
        else if(save[1] >= 6 && save[1] <= 8)
        {
            printf("D");
            for(int i=5 ; i<save[1] ; i++)
                printf("C");
        }
        else if(save[1] == 9) printf("CM");
    }

    if(save[2] != 0)
    {
        if(save[2] < 4)
            for(int i=0 ; i<save[1] ; i++)
                printf("X");
        else if(save[2] == 4) printf("XL");
        else if(save[2] == 5) printf("L");
        else if(save[2] >= 6 && save[2] <= 8)
        {
            printf("L");
            for(int i=5 ; i<save[2] ; i++)
                printf("X");
        }
        else if(save[2] == 9) printf("XC");
    }

    if(save[3] != 0)
    {
        if(save[3] < 4)
            for(int i=0 ; i<save[3] ; i++)
                printf("I");
        else if(save[3] == 4) printf("IV");
        else if(save[3] == 5) printf("V");
        else if(save[3] >= 6 && save[3] <= 8)
        {
            printf("V");
            for(int i=5 ; i<save[3] ; i++)
                printf("I");
        }
        else if(save[3] == 9) printf("IX");
    }

    return 0;
}
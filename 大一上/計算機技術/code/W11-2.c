#include<stdio.h>

int main()
{
    int cen, count=0, day[12]={31,29,31,30,31,30,31,31,30,31,30,31};

    printf("Please input the centry: ");
    scanf("%d",&cen);

    for(int i=(cen-1)*100+1 ; i<=cen*100 ; i++)
    {
        //printf("%d ",i);
        int year=i, week, deter=0;
        //printf("%d:",year);
        week = (year + (int)((year-1)/4) - (int)(year-1)/100 + (int)(year-1)/400)%7;
        
        if( (year%4 == 0) && (year%100 != 0) ) deter=1;
        else if(year%400 == 0) deter=1;
        else deter=2;

        if(deter == 1) day[1]=29;
        if(deter == 2) day[1]=28;
        //for(int a=0 ; a<12 ; a++) printf("%d ",day[a]);
        //printf("\n");

        //printf("week:%d\n",week);

        for(int a=0 ; a<12 ; a++)
        {
            if(week==0) count++;
            week = (week + day[a])%7;
        }


    }
    printf("%d times",count);

    return 0;
}
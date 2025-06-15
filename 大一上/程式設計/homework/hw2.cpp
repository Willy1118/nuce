#include<stdio.h>

int main()
{
    int hour1, minute1, hour2, minute2, answer;
    int hour_lag, minute_lag;

    scanf("%d %d %d %d", &hour1, &minute1, &hour2, &minute2);

    while( (hour1 != 0) || (minute1 != 0) || (hour2 != 0) || (minute2 != 0) )
    {
        if( minute2 < minute1 )
        {
            hour_lag = hour2 - hour1 - 1;
            minute_lag = minute2 + 60 - minute1;
        }

        else
        {
            hour_lag = hour2 - hour1;
            minute_lag = minute2 - minute1;
        }
        
        answer = 60*hour_lag + minute_lag ;
        if( answer < 0 ) answer = 1440 + answer;

        printf("%d\n",answer);


        scanf("\n%d %d %d %d", &hour1, &minute1, &hour2, &minute2);
    }

    return 0;
}
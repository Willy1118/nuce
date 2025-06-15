#include<stdio.h>
#include<iostream>
using namespace std;
int main()
{
    char planet;
    int amount, hour, minute, second, time=0;

    scanf("%d",&amount);

    for(int i=0 ; i<amount ; i++)
    {
        cin >> planet >> hour >> minute >> second;

        if(planet == 'Z')
        {
            int all;
            all = hour*48*30 + minute*30 + second;
            printf("E %d %d %d\n", all/3600, (all%3600)/60, (all%3600)%60);
        }
        else if(planet == 'E')
        {
            int all;
            all = hour*3600 + minute*60 + second;
            printf("Z %d %d %d\n", all/1440, (all%1440)/30, (all%1440)%30);
        }
    }
   
    return 0;
}
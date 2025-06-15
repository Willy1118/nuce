#include<stdio.h>

int main()
{
    int y1, y2, m1, m2, d1, d2, dec;
    int m, x;

    printf("請輸入西元開始日期(yyyy/mm/dd)為...");
    scanf("%d/%d/%d",&y1,&m1,&d1);
    printf("請輸入西元結束日期(yyyy/mm/dd)為...");
    scanf("%d/%d/%d",&y2,&m2,&d2);

    int copy_y1=y1, copy_y2=y2;

    while(copy_y1%400 != 0) copy_y1 += 4;
    while(copy_y2%400 != 0) copy_y2 -= 4;

    m=((copy_y2-copy_y1)/400)*97+1;
    x=(copy_y1-y1)/4 + (y2-copy_y2)/4 - (y2-copy_y2)/100 - (copy_y1-y1)/100;
    
    if(m1>=3 && y1%4==0) m--;
    if(m2<=2 && y2%4==0) m--;

    printf("%d",m+x);

    return 0;
}
#include<stdio.h>

int main()
{
    int length, width, gcd, lcm, piece;
    
    printf("請輸入長方形的長(公分)為... ");
    scanf("%d",&length);
    printf("請輸入長方形的寬(公分)為... ");
    scanf("%d",&width);
    
    int a=length, b=width;
    while(a % b != 0)
    {
        gcd=a%b;
        a=b;
        b=gcd;
    } 
    gcd=b;
    
    lcm = gcd * (length/gcd) * (width/gcd);
    piece = (lcm/length) * (lcm/width);

    printf("最少需要%d個相同的正方形,排成邊長為%d公分的正方形",piece,lcm);

    return 0;
}
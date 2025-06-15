#include<stdio.h>

int main()
{
    int n, sum=0, time=1;
    int x1, y1, x2, y2;

    scanf("%d",&n);

    for(int i=0 ; i<n ; i++)
    {
        sum = 0;
        scanf("%d %d %d %d",&x1, &y1, &x2, &y2);

        if(x1+y1 == x2+y2)
        {
            sum += y1-y2-1;
        }

        else
        {
            for(int y=x1+y1+2 ; y<=x2+y2 ; y++)
            {
                sum += y;
            }
            sum += y1;
            sum += x2;
        }

        printf("%d: %d\n",time, sum+1);
        time += 1;
    }

    return 0;
}
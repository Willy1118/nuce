#include<stdio.h>

int main()
{
    int num;

    while(scanf("%d", &num) != EOF)
    {
        int a[10000]={0}, b[10000][2];
        int index=0, ans=0;;
        for(int i=0 ; i<num ; i++)
        {
            a[i] = 1;
            scanf("%d %d", &b[i][0], &b[i][1]);
            if(b[i][0] > b[i][1])
            {
                int tmp = b[i][0];
                b[i][0] = b[i][1];
                b[i][1] = tmp;
            }
        }
        for(int i=1 ; i<num ; i++)
        {
            for(int j=0 ; j<i ; j++)
            {
                if(b[i][0] == b[j][0] && b[i][1] == b[j][1] && b[i][0] != b[i][1])
                {
                    //printf("in\n");
                    a[j] ++;
                    break;
                }
            }
        }
        for(int i=0 ; i<num ; i++)
        {
            //printf("%d ",a[i]);
            ans += a[i]/2;
        }
        printf("%d\n",ans);
    }

    return 0;
}
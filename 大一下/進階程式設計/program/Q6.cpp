#include<stdio.h>

int main()
{
    int amount, sum=0, area[1000] ;
    int rect_num;
    int rect[1000][2];

    scanf("%d", &rect_num);

    for(int x=0 ; x<rect_num ; x++)
    {
        scanf("%d",&amount);
        int rec[amount], max=0;



        for(int i=0 ; i<amount ; i++)
        {
            rec[i] = 0;
            scanf("%d %d", &rect[i][0], &rect[i][1]);
            if(rect[i][0] < rect[i][1])
            {
                int temp = rect[i][0];
                rect[i][0] = rect[i][1];
                rect[i][1] = temp;
            }
            
        }
        
        for(int i=amount-1 ; i>0 ; i--)
        {                              
            for(int j=0 ; j<i ; j++)
            {
                if(rect[j][0] > rect[j+1][0])
                {
                    int temp = rect[j][0];
                    rect[j][0] = rect[j+1][0];
                    rect[j+1][0] = temp;

                    int t = rect[j][1];
                    rect[j][1] = rect[j+1][1];
                    rect[j+1][1] = t;
                }
            }
        }

        for(int i=0 ; i<amount-1 ; i++)
        {
            if(rect[i][0] == rect[i+1][0] && rect[i][1]>rect[i+1][1])
            {
                int temp = rect[i][0];
                rect[i][0] = rect[i+1][0];
                rect[i+1][0] = temp;

                int t = rect[i][1];
                rect[i][1] = rect[i+1][1];
                rect[i+1][1] = t;
            }
        }

        for(int i=0 ; i<amount ; i++) area[i] = rect[i][0] * rect[i][1];

        //for(int i=0 ; i<amount ; i++) printf("%d %d %d\n", rect[i][0], rect[i][1], area[i]);
        //printf("\n\n");
        
        for(int i=0 ; i<amount ; i++)
        {
            max=0;
            for(int j=amount-1 ; j>=0 ; j--)
            {
                if(rect[i][1] >= rect[j][1] && area[i] >= area[j])
                {
                    if(rec[j]>max)
					max=rec[j];
                }
                //printf("i=%d j=%d max=%d\n", i, j, max);
            }
            if(max==0) rec[i]=1;
			else rec[i] = 1+max;
        }
        for(int i=0 ; i<amount ; i++)
		{
			if(rec[i]>sum)
			{
				sum=rec[i];
			}
		}
		
		printf("%d\n",sum);
        sum=0;
    }
    
    return 0;
}
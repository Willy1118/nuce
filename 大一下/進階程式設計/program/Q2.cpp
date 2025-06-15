#include<stdio.h>

int main()
{
    int row, column;

    while(scanf("%d %d", &row, &column) != EOF)
    {
        //printf("%d", row*column);
        int pic[row*column];
        int save[256][2];
        int count = 0, decrease=1, dec=0;

		for(int i=0 ; i<256 ; i++)
		{
			save[i][0] = i;
			save[i][1] = 0;
		}

        for(int i=0 ; i<row*column ; i++)
        {
            scanf("%d", &pic[i]);
        }
        
        for(int i=0 ; i<row*column ; i++)
        {
			save[pic[i]][1] ++ ;
    	}

        /*for(int i=0 ; i<256 ; i++)
        {
            printf("%d %d\n", save[i][0], save[i][1]);
        }*/
    	
		int max=0, m=0;
		for(int i=0 ; i<=255 ; i++)
		{
			if(save[i][1]>=max)
			{
				max=save[i][1];
				if(save[i][0]>m) m=save[i][0];
			}
		}
		printf("%d\n",max);

        for(int i=0 ; i<=255 ; i++)
        {
            if(save[i][1] != 0) dec++;       
            
        }
        //printf("\n%d\n",dec);
        if(dec == 256) 
        {
            printf("-1\n");
            continue;
        } 

        while(1)
        {
            if(save[m-decrease][1] == 0 && m-decrease >= 0)
            {
                printf("%d\n",m-decrease);
                break;
            }
            if(save[m+decrease][1] == 0 && m+decrease <= 255)
            {
                printf("%d\n",m+decrease);
                break;
            }
            decrease ++ ;
        }
    } 
}
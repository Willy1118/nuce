#include<stdio.h>
#include<string.h>

int main()
{
    FILE *DataIn;
    DataIn = fopen("txt/t9.txt","r");

    int num, all, count=0, now=0, dec=0, max=0;
    int n[30], save[2][1000]={0}, sum[1000]={1};

    for(int i=0 ; i<1000 ; i++) sum[i] = 1;

    if(DataIn != NULL)
    {
        fscanf(DataIn , "%d" ,&all);
        //printf("%d",all);
        while(count != all)
        {
            int dec=0;
            fscanf(DataIn , "%d" ,&num);
            for(int i=0 ; i<num ; i++) fscanf(DataIn , "%d" ,&n[i]);
            
            for(int i=0 ; i<num ; i++)
            {
                for(int j=i+1 ; j<num ; j++)
                {
                    save[0][now]=n[i];
                    save[1][now]=n[j];
                    
                    for(int k=0 ; k<now ; k++)
                    {
                        if(save[0][now] == save[0][k] && save[1][now]==save[1][k])
                        {
                            dec=1;
                            sum[k] ++ ;
                            break;
                        }
                    }
                    if(dec == 1) now--;
                    now++;
                } 
            }   
            
            count++;
        } 
    }

    for(int i=0 ; i<now ; i++)
    {
        if(sum[i]>max) max=sum[i];
    }

    for(int i=0 ; i<now ; i++) 
    {
        if(sum[i]==max)
        {
            printf("(%d,%d) %d次",save[0][i],save[1][i],sum[i]);
            printf("\n");
        }   
    }

    return 0;
}

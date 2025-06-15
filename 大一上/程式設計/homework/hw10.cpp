#include<stdio.h>
#include<string.h>

int main()
{
    int len = 1, count[1501];
    char str[1501], save[1501];

    //scanf("%[^\n]%*c",str);
    //len = strlen(str);
    //printf("%d\n",len);

    while(scanf("%[^\n]%*c",str) != EOF)
    {
        int now=0, dec, count[1501]={0}, max=0, incre=1, temp_save[1501], bubble=0, temp=0;
        len = strlen(str);
        /*for(int i=0 ; i<len ; i++)
        {
            if(str[i] == 13) str[i]='\0';
        }*/
        for(int i=0 ; i<len ; i++)
        {
            dec=0;
            save[now] = str[i];
            for(int j=0 ; j<now ; j++)
            {
                if(save[now] == save[j])
                {
                    dec = 1;
                    count[j] ++ ;
                    break;
                }
            }
            if(dec == 1) now--;
            else count[now]++;
            now++;
        }

        for(int i=0 ; i<now ; i++)
        {
            //printf("%c %d\n", (char)save[i], count[i]);
            //printf("%d %d\n", save[i], count[i]);
            if(count[i] > max) max = count[i];
        }
        //printf("%d",max);
        //printf("\n");

        while(incre != max+1)
        {
            temp=0;
            for(int i=0 ; i<len ; i++)
            {
                //printf("count[%d]=%d incre=%d\n", i, count[i], incre);
                if(count[i] == incre) 
                {
                    temp_save[temp] = save[i];
                    //printf("temp_save[%d]=%d ", temp, temp_save[temp]);
                    temp ++ ;
                }
            }

            bubble=0;
            if(temp == 1 && temp_save[0] != 0) printf("%d %d\n", (int)((char)temp_save[0]), incre);
            else
            {
                for (int i=1; i<temp ; i++)
                {
                    for(int j=1 ; j<temp-bubble ; j++)
                    {
                        if(temp_save[j-1] < temp_save[j])
                        {
                            int c = temp_save[j-1];
                            temp_save[j-1] = temp_save[j];
                            temp_save[j] = c;
                        }
                    }
                    bubble++;
                }
                //printf("temp=%d\n",temp);
                for (int i=0; i<temp ; i++)
                {
                    //printf("%c %d\n", (char)temp_save[i], incre);
                    if(temp_save[i] != 0) printf("%d %d\n", temp_save[i], incre);
                }
            }
            
            incre++;
        }
        
        printf("\n");
        
        
        //printf("%d\n",len);
        
    }
    return 0;
}
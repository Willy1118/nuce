#include<stdio.h>
#include<string.h>

int main()
{
    int list[100][2], length, max=0, count=0, plus=0, circle=0;
    char s[100];

    printf("請輸入一個字串:",s);
    scanf("%s%*c",s);
    length = strlen(s);
    printf("%d\n",length);

    for(int i=0 ; i<length ; i++)
    {
        for(int j = length-1 ; j>i ; j--)
        {
            count = 0;
            circle = 0;
            for(int a=0 ; a<=j-i ; a++)
            {
                if(s[i+a] == s[j-a]) count += 1;
                circle += 1;
            }
            //printf("count=%d \n",count);
            //printf("circle=%d ",circle);
            //printf("i=%d j=%d j-i=%d",i,j,j-i);
            //printf("\n");

            
            /*if(count == circle)
            {
                for(int x=i ; x<=j ; x++) printf("%c",s[x]);
                printf("\n");
            }*/
            plus += 1;
            //printf("\n");
            //printf("plus=%d",plus);

            if(count == circle)
            {
                if(plus == 1) max=count;
                else if(plus > 1);
                {
                    //printf("count=%d max=%d\n",count,max);
                    if(count > max) 
                    {
                        //printf("換\n");
                        max=count;
                    }
                    //printf("max=%d\n",max);
                }
                //if(plus >= 1)
                    //printf("max=%d\n",max);
            }            
        }
    }
    int x=0;
    printf("最小子字串為:");
    
    for(int i=0 ; i<length ; i++)
    {
        int a=0;
        
        for(int j = length-1 ; j>i ; j--)
        {
            count = 0;
            circle = 0;
            for(int a=0 ; a<=j-i ; a++)
            {
                if(s[i+a] == s[j-a]) count += 1;
                circle += 1;
            }
            //printf("max=%d circle=%d count=%d\n ",max,circle,count);
            if(count == circle)
            {
                
                if(count == max)
                {
                    //printf("x=%d count=%d\n",x,count);
                    if(x<=count && x>0) printf(",");
                    for(int x=i ; x<=j ; x++) printf("%c",s[x]);
                    x++;                   
                }               
            }
            
            //printf("\n");
            
        }
    }
    

    return 0;
}

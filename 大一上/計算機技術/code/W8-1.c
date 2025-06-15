#include<stdio.h>
#include<string.h>
int main()
{
    while(1)
    {

    
        int num, s[64]={0}, sum=0, multi=1;

        printf("Please input a decimal number:");
        scanf("%d",&num);
        
        if(num>0)
        {
            int count=0;
            while(num>0)
            {
                //printf("in\n");
                //printf("count=%d num=%d",count,num);
                s[count] = num%16;
                num /= 16;
                count++ ;
            }
            //printf("count=%d\n",count);
            //for(int i=0 ; i<count ; i++) printf("%d ",s[i]);
            if(s[6] < 8)
            {
                for(int i=0 ; i<=count ; i=i+2)
                {
                    //printf("sum=%d\n",sum);
                    //printf("s[i+1]=%d multi=%d\n",s[i+1],multi);
                    sum += s[i+1]*multi;
                    //printf("sum=%d\n",sum);
                    multi *= 16;
                    //printf("s[i]=%d multi=%d\n",s[i],multi);
                    sum += s[i]*multi;  
                    //printf("sum=%d\n",sum);
                    multi *= 16;
                }
                printf("%d",sum);
            } 
            else
            {
                //for(int i=0 ; i<count ; i++) printf("%d ",s[i]);
                printf("-");
                for(int i=0 ; i<=count ; i=i+2)
                {
                    //printf("sum=%d\n",sum);
                    //printf("s[i+1]=%d multi=%d\n",s[i+1],multi);
                    sum += (15-s[i+1])*multi;
                    //printf("result=%d\n",(15-s[i+1])*multi);
                    //printf("sum=%d\n",sum);
                    multi *= 16;
                    //printf("s[i]=%d multi=%d\n",s[i],multi);
                    //printf("s[i+1]=%d multi=%d\n",s[i],multi);
                    sum += (15-s[i])*multi;
                    //printf("result=%d\n",(15-s[i])*multi);  
                    //printf("sum=%d\n",sum);
                    multi *= 16;
                }
                printf("%d",sum+1);
            }
        }
        else
        {
            num = num-2*num;
            //printf("%d",positive);
            int count=0;
            while(num>0)
            {
                //printf("in\n");
                //printf("count=%d num=%d",count,num);
                s[count] = num%16;
                num /= 16;
                count++ ;
            }
            //printf("count=%d ",count);
            //for(int i=0 ; i<count ; i++) printf("%d ",s[i]);
            printf("\n");

            //printf("s[7]=%d ",s[7]);

            if(s[6] < 8)
            {
                //printf("IN\n");
                printf("-");
                for(int i=0 ; i<(count/2+count%2)*2 ; i++)
                {
                    s[i]=15-s[i];
                }
                s[0] += 1;
                /*for(int i=0 ; i<(count*2+count%2)*2 ; i++)
                {
                    printf("%d ",s[i]);
                }*/
                //printf("\n");
                //for(int i=0 ; i<)
                for(int i=0 ; i<(count/2+count%2)*2 ; i=i+2)
                {
                    int temp=s[i];
                    s[i]=(15-s[i+1]);
                    s[i+1]=15-temp;
                }
                /*for(int i=0 ; i<(count*2+count%2)*2 ; i++)
                {
                    printf("%d ",s[i]);
                }*/
                for(int i=0 ; i<(count/2+count%2)*2 ; i++)
                {
                    //printf("i=%d\n",i);
                    sum += s[i]*multi;
                    multi *= 16;
                    //printf("sum=%d\n",sum);
                }
                printf("%d",sum+1);
            }
            else
            {
                for(int i=0 ; i<(count/2+count%2)*2 ; i++)
                {
                    s[i]=15-s[i];
                }
                s[0] += 1;
                /*for(int i=0 ; i<(count/2+count%2)*2 ; i++)
                {
                    printf("%d ",s[i]);
                }*/
                printf("\n");
                //for(int i=0 ; i<)
                /*for(int i=0 ; i<(count/2+count%2)*2 ; i=i+2)
                {
                    int temp=s[i];
                    s[i]=(15-s[i+1]);
                    s[i+1]=15-temp;
                }*/
                /*for(int i=0 ; i<(count*2+count%2)*2 ; i++)
                {
                    printf("%d ",s[i]);
                }*/
                for(int i=0 ; i<(count/2+count%2)*2 ; i=i+2)
                {
                    //printf("sum=%d\n",sum);
                    //printf("s[i+1]=%d multi=%d\n",s[i+1],multi);
                    sum += s[i+1]*multi;
                    //printf("sum=%d\n",sum);
                    multi *= 16;
                    //printf("s[i]=%d multi=%d\n",s[i],multi);
                    sum += s[i]*multi;  
                    //printf("sum=%d\n",sum);
                    multi *= 16;
                }
                printf("%d",sum);
            }
        }
        printf("\n");
    }

    return 0;
}
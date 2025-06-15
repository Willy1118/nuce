#include<stdio.h>
#include<string.h>

int main()
{
    int length, a=1, b=1;
    char s[100],x[100]={0};

    printf("請輸入一個字串:",s);
    scanf("%s%*c",s);
    length = strlen(s);
    //printf("%d\n",length);

    for(int i=1;i<=length;i++)
    {
        a *= i; 
    }
    //printf("a=%d\n",a);

    for(int i=0 ; i<length ; i++)
    {
        s[i] = (int)s[i]-48;
    }
    /*for(int i=0 ; i<length ; i++)
    {
        printf("%d ",s[i]);
    }*/
    for(int i=0 ; i<length ; i++)
    {      
        x[s[i]] += 1;
    }
    /*for(int i=1 ; i<9 ; i++)
    {
        printf("%d ",x[i]);
    }*/
    for(int i=1 ; i<9 ; i++)
    {
        //printf("x[%d]=%d\n",i,x[i]);
        if(x[i]>1)
        {
            b=1;
            //printf("a=%d b=%d",a,b);
            //printf("\n");
            for(int j=1 ; j<=x[i] ; j++)
            {
                b *= j;
            }
            a = a / b;
            //printf("a=%d b=%d",a,b);
        }
    }
    printf("%d",a);

    return 0;
}
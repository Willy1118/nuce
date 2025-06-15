#include<stdio.h>
#include<string.h>

int main()
{
    char a[2000][20], b[2000][20], new[2000][20];
    int an=0, bn=0, sum[820]={0}, repeat=0 ,len, news=0;
    FILE *A;
    FILE *B;
    A = fopen("txt/t10.txt","r");
    B = fopen("txt/t11.txt","r");

    if (A != NULL && B != NULL )
    {       
        while(fscanf(A, "%s" ,a[an]) == 1) 
        {
            len = strlen(a[an]);
            if((a[an][0]>='A') && (a[an][0]<='Z')) a[an][0] = (char)((int)a[an][0]+32);
            if((a[an][len-1]==',') || (a[an][len-1]=='.')) a[an][len-1] = '\0';
            an++;  
        }
        while(fscanf(B, "%s" ,b[bn]) == 1)
        {
            len = strlen(b[bn]);
            if((b[bn][0]>='A') && (b[bn][0]<='Z')) b[bn][0] = (char)((int)b[bn][0]+32);
            if((b[bn][len-1]==',') || (b[bn][len-1]=='.')) b[bn][len-1] = '\0';
            bn++;
        }
        /*for(int i=0 ; i<an ; i++) printf("%s ",a[i]);
        printf("\n");
        for(int i=0 ; i<bn ; i++) printf("%s ",b[i]);*/                  
    }

    for(int i=0 ; i<bn ; i++)
    {
        for(int j=0 ; j<an ; j++)
        {
            int count=0;
            int temp1=i;
            int temp2=j;
            
            //if(strcmp(a[temp1],b[temp2])!=0) break;
            while(strcmp(a[temp2],b[temp1])==0)
            {
                count++;
                temp1++;
                temp2++;
            }
            //printf("%d\n",count);
            if(count>=7)
            {
                for(int k=j ; k<temp2 ; k++)
                    sum[k]=1;     
            }
        }
    }
    /*for(int i=0 ; i<820 ; i++) 
    {
        if(sum[i] == 1)
        {
            //printf("i=%d,in ",i);
            strcpy(new[news],b[i]);
            news++;
        } 
    }*/
    for(int i=0 ; i<820 ; i++) 
    {
        //printf("%d ",sum[i]);
        repeat += sum[i];
    }
/*
    for(int i=0 ; i<news ; i++)
    {
        for(int j=i+1 ; j<news ; j++)
        {
            if(strcmp(new[i],new[j]) == 0)
            {
                repeat -- ;
                break;
            }
        }
    }*/

    //for(int i=0 ; i<820 ; i++) printf("%d ",sum[i]);
    printf("%d/820=%.2f%%",repeat,100*(float)repeat/820);
    
    return 0;
}
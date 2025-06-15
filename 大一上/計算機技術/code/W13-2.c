#include<stdio.h>
#include<string.h>

int main()
{
    char word[100][22];
    int n=0, word_wrap;

    FILE *DataIn;
    FILE *DataOut;
    DataIn = fopen("txt/t12.txt","r");
    DataOut = fopen("txt/t13.txt","w");

    printf("The width of word wrap: ");
    scanf("%d",&word_wrap);
    int remain=word_wrap;

    if (DataIn != NULL && DataOut != NULL)
    {
        while(fscanf(DataIn, "%s" ,word[n]) == 1)
        {
            int num=strlen(word[n]);

            if(num<=remain)
            {
                fprintf(DataOut , "%s " , word[n]);
                remain = remain-num-1;
            }
            else if(num>remain && num<=word_wrap)
            {
                fprintf(DataOut , "\n%s " , word[n]);
                remain = word_wrap - num - 1;
            }
            else if(num>remain && num>word_wrap)
            {    
                if(remain == word_wrap-1) 
                {
                    //fprintf(DataOut , " ");
                    for(int i=0 ; i<word_wrap-1 ; i++) fprintf(DataOut , "%c" , word[n][i]);
                    fprintf(DataOut , "\n");
                    for(int i=word_wrap-1 ; i<num ; i++) fprintf(DataOut , "%c" , word[n][i]);
                    fprintf(DataOut , " ");
                    remain = word_wrap - (num - word_wrap ) - 2;
                }
                else 
                {
                    fprintf(DataOut , "\n");
                    for(int i=0 ; i<word_wrap ; i++) fprintf(DataOut , "%c" , word[n][i]);
                    fprintf(DataOut , "\n");
                    for(int i=word_wrap ; i<num ; i++) fprintf(DataOut , "%c" , word[n][i]);
                    fprintf(DataOut , " ");
                    remain = word_wrap - (num - word_wrap ) - 1;
                }
                    
                  
            }
            if(remain == -1) 
            {
                fprintf(DataOut,"\n ");
                remain = word_wrap - 1;       
            }
            printf("%d:%d\n",n+1,remain);

            n++;
            //printf("%d\n",num);
        }
        
    }
    return 0;
}
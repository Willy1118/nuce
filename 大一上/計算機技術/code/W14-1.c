#include<stdio.h>
#include<string.h>

int main()
{
    int n=0, count[26]={0};
    char word[30][31];

    FILE *DataIn;
    DataIn = fopen("txt/t15.txt","r");

    if(DataIn != NULL)
    {
        while(fscanf(DataIn, "%s" ,word[n]) == 1)
        {
            int count[26]={0}, sum=0, dec=0;
            int len = strlen(word[n]);
            
            for(int i=0 ; i<len ; i++)
            {
                if( (word[n][i]>='A') && (word[n][i]<='Z') ) word[n][i] = (char)((int)word[n][i]+32);
            }
            
            for(int i=0 ; i<len ; i++)
            {
                count[(int)word[n][i]-97] ++ ;
            }

            for (int i=0 ; i<26 ; i++)
            {
                if(count[i] != 0) sum++;
            }

            for(int i=1 ; i<26 ; i++)
            {
                for(int j=0 ; j<i ; j++)
                {
                    if(count[i]!=0)
                    {
                        if(count[i]==count[j])
                        {
                            dec=1;
                            break;
                        }
                    }
                }
            }
            
            if(sum>=2 && dec==0) printf("Yes\n");
            else printf("No\n");

            n++;
        }
    }

    return 0;
}
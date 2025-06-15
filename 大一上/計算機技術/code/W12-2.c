#include<stdio.h>
#include<string.h>

int main()
{
    char word[100][20]={'0'}, ch, n=0;
    int s[100]={0},count=0;

    FILE *DataIn;
    FILE *DataOut;
    DataIn = fopen("txt/t3.txt","r");
    DataOut = fopen("txt/t4.txt","w");

    for(int i=0 ; i<100 ; i++) s[i]++;

    if (DataIn != NULL && DataOut != NULL)
    {
        while(fscanf(DataIn, "%s" ,word[n]) == 1)
        {
            int num=strlen(word[n]);
            int same=1;
            //printf("in\n");
            if(word[n][num-1]==',' || word[n][num-1]=='.') 
            {
                word[n][num-1]='\0';
            }

            for(int i=0;i<n;i++)
		    {
				if(strcmp(word[n],word[i]))
				{
					continue;
				}
				same=0;
				s[i]++;
			}
			if(same==1) n++;
        }
        for(int i=0 ; i<n ; i++)
	    {
            printf("%d\n",s[i]);
		    fprintf(DataOut,"%s: %d\n",word[i],s[i]);
		}       
    }
    fclose(DataIn);
    fclose(DataOut);

    return 0;
}
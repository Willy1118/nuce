#include<stdio.h>

int main()
{
    char ch;
    int a=0, e=0 ,i=0, o=0, u=0;

    FILE *DataIn;
    FILE *DataOut;
    DataIn = fopen("txt/t1.txt","r");
    DataOut = fopen("txt/t2.txt","w");

    if (DataIn != NULL && DataOut != NULL)
    {
        printf("in");
        while((ch=fgetc(DataIn)) != EOF)
        {
            if (ch == 'A' || ch == 'a') a += 1;
            else if (ch=='E' || ch == 'e') e += 1;
            else if (ch=='I' || ch == 'i') i += 1;
            else if (ch=='O' || ch == 'o') o += 1;
            else if (ch=='U' || ch == 'u') u += 1;
        }
        fprintf(DataOut,"A E I O U\n");
        fprintf(DataOut,"%d %d %d %d %d",a,e,i,o,u);       
    }


    return 0;
}
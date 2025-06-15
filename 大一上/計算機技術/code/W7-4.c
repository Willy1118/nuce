#include<stdio.h>
#include<string.h>

int main()
{
    char s1[50], s2[50]; 
    int r1[26]={0}, r2[26]={0};
    int n1, n2, count=0;

    printf("Please input the string 1:");
    scanf("%[^\n]%*c",s1);
    n1 = strlen(s1);

    printf("Please input the string 2:");
    scanf("%[^\n]%*c",s2);
    n2 = strlen(s2);

    for(int i=0 ; i < n1 ; i++)
    {
        if(s1[i] >= 97 && s1[i] <= 122) s1[i] = (int)s1[i]-97;
        else if(s1[i] >= 65 && s1[i] <= 90) s1[i] = (int)s1[i]-65;
        if(s1[i] >= 0 && s1[i] <= 25) r1[s1[i]] += 1;
    }
   
    /*for(int i=0 ; i<26 ; i++)
    {
        printf("%d ",r1[i]);
    }*/
    printf("\n");

    for(int i=0 ; i < n2 ; i++)
    {
        if(s2[i] >= 97 && s2[i] <= 122) s2[i] = (int)s2[i]-97;
        else if(s2[i] >= 65 && s2[i] <= 90) s2[i] = (int)s2[i]-65;
        if(s2[i] >= 0 && s2[i] <= 25) r2[s2[i]] += 1;
    }
   
    /*for(int i=0 ; i<26 ; i++)
    {
        printf("%d ",r2[i]);
    }*/

    for(int i=0 ; i<26 ; i++)
    {
        if(r1[i] == r2[i]) count += 1;
    }

    if(count == 26) printf("yes");
    else printf("no");

    return 0;
}
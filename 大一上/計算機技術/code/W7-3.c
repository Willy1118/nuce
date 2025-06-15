#include<stdio.h>
#include<string.h>

int main()
{
    char s1[100] ,s2[100];
    int n1, n2, sum=0, count=0, c;

    printf("Please input the string 1:");
    scanf("%s%*c",s1);
    n1 = strlen(s1);

    printf("Please input the string 2:");
    scanf("%s%*c",s2);
    n2 = strlen(s2);

    for(int i=0 ; i<n1 ; i++)
    {
        sum = 0;
        c=i;
        for(int j=0 ; j<n2 ;j++)
        {
            if (s1[c] == s2[j])
            {
                sum += 1;
            }
            c++;
            if(sum == n2) count++;
        }
    }
    if(count == 0) printf("string 2 is not a substring of string 1");
    else
    {
        printf("string 2 is a substring of string 1\n");
        printf("repeat %d times",count);
    }
    return 0;
}
#include<stdio.h>

int main()
{
    int l, min;

    scanf("%d",&l);

    int m[l][l];

    for(int i=0 ; i<l ; i++)
        for(int j=0 ; j<l ; j++)
            scanf("%d",&m[i][j]);
    
    min = m[0][0] + m[0][1] + m[0][2] + m[1][1];

    for(int i=0 ; i<=l-2 ; i++)
    {
        for(int j=1 ; j<=l-2 ; j++)
        {
            int temp = m[i][j] + m[i][j-1] + m[i][j+1] + m[i+1][j];
            if(temp < min) min = temp;
        }
    } 

    for(int i=1 ; i<=l-2 ; i++)
    {
        for(int j=1 ; j<=l-1 ; j++)
        {
            int temp = m[i][j] + m[i-1][j] + m[i+1][j] + m[i][j-1];
            if(temp < min) min = temp;
        }
    }  

    for(int i=1 ; i<=l-1 ; i++)
    {
        for(int j=1 ; j<=l-2 ; j++)
        {
            int temp = m[i][j] + m[i][j-1] + m[i][j+1] + m[i-1][j];
            if(temp < min) min = temp;
        }
    } 

    for(int i=1 ; i<=l-2 ; i++)
    {
        for(int j=0 ; j<=l-1 ; j++)
        {
            int temp = m[i][j] + m[i-1][j] + m[i+1][j] + m[i][j+1];
            if(temp < min) min = temp;
        }
    }  

    printf("%d",min);

    return 0;
}
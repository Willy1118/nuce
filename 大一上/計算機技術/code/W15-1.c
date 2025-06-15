#include<stdio.h>
#include<string.h>

int main()
{
    char input1[42], input2[42];
    int num[2][40]={0}, sum[40]={0};
    int len1, len2, carry=0, change1=0, change2=0;

    printf("Please input number #1:");
    scanf("%s",input1);
    printf("Please input number #2:");
    scanf("%s",input2);

    len1 = strlen(input1);
    len2 = strlen(input2);

    for(int i=0 ; i<len1 ; i++)
    {
        if(input1[i] == '.')
        {
            int temp = i ;
            for(int j=19-i+1, k=0 ; j<i, k<temp ; j++, k++)
            {
                num[0][j] = (int)input1[k]-48;
            }
            for(int j=20, k=i+1 ; j<39, k<len1 ; j++, k++)
            {
                num[0][j] = (int)input1[k]-48;
            }
            change1=1;
        }
    }
    
    if(change1 == 0)
    {
        for(int j=20-len1, k=0 ; j<20, k<len1 ; j++, k++)
        {
            num[0][j] = (int)input1[k]-48;
        }
    }
    //for(int i=0 ; i<40 ; i++) printf("%d",num[0][i]);

    for(int i=0 ; i<len2 ; i++)
    {
        if(input2[i] == '.')
        {
            int temp = i ;
            for(int j=19-i+1, k=0 ; j<i, k<temp ; j++, k++)
            {
                num[1][j] = (int)input2[k]-48;
            }
            for(int j=20, k=i+1 ; j<39, k<len2 ; j++, k++)
            {
                num[1][j] = (int)input2[k]-48;
            }
            change2=1;
        }
    }
    if(change2 == 0)
    {
        for(int j=20-len2, k=0 ; j<20, k<len2 ; j++, k++)
        {
            num[1][j] = (int)input2[k]-48;
        }
    }
    /*for(int i=0 ; i<40 ; i++) printf("%d",num[0][i]);
    printf("\n");
    for(int i=0 ; i<40 ; i++) printf("%d",num[1][i]);*/

    for(int i=39 ; i>=0 ; i--)
    {
        sum[i] = (num[0][i] + num[1][i] + carry)%10 ;
        carry = (num[0][i] + num[1][i] + carry)/10;
    }

    printf("The sum is:");

    if(change1 == 0 && change2 == 0)
    {
        for(int i=0 ; i<39 ; i++) 
            if(num[0][i] != 0 || num[1][i] != 0)
                printf("%d",sum[i]);
    }  
    else
    {
        int dec1=0, dec2=0;
        for(int i=0 ; i<=19 ; i++)
        {
            if(sum[i] == 0) 
                dec1++;
            else if(sum[i] != 0) break;
        }
        if(dec1 == 20) printf("0");
        for(int i=dec1 ; i<=19 ; i++) printf("%d",sum[i]);
        printf(".");
        for(int i=39 ; i>=20 ; i--)
        {
            if(sum[i] == 0) 
                dec2++;
            else if(sum[i] != 0) break;
        }
        for(int i=20 ; i<40-dec2 ; i++) printf("%d",sum[i]);
    }  

    /*for(int i=0 ; i<40 ; i++) printf("%d",num[0][i]);
    printf("\n");
    for(int i=0 ; i<40 ; i++) printf("%d",num[1][i]);*/
    return 0;

}
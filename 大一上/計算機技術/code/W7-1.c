#include<stdio.h>
#include<string.h>

int main()
{
    int n, i=0, check=0, turn, length, sum=0, x=1; 
    char binary[1000];

    printf("Please input a decimal:");
    scanf("%d",&n);

    int save[n];

    while(n != 1)
    {
        save[i] = n%2;
        n = n/2;
        i += 1;
    }
    printf("1");

    for(int a=i-1 ; a>=0 ; a--) printf("%d",save[a]);
    printf("\n");

    printf("Please input a binary number:");
    scanf("%s",binary);

    length = strlen(binary);
    

    for(int i=0 ; i<length ; i++)
    {
        binary[i] = (int)binary[i]-48;
    }


    for(int k=length-1 ; k>=0 ; k--)
    {
        
        check = binary[k]*x;
        x=x*2;
        sum += check;
        
    }
    printf("%d\n",sum);
    

    return 0;
}
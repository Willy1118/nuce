#include<stdio.h>
#include<string.h>

int check_ISBN10(char *arr)
{
    int total=0, multi=10;
    for(int i=0 ; i<10 ; i++)
    {
        total += *(arr+i)*multi;
        multi -- ;       
    }
    if(total%11 == 0) printf("The ISBN code is correct\n");
    else printf("The ISBN code is wrong\n");
}

int check_ISBN13(char *arr)
{
    int total=0;
    for(int i=0 ; i<12 ; i++)
    {
        if(i%2==0)
            total += *(arr+i)*1;
        else
            total += *(arr+i)*3;       
    }

    if(10 - total%10 == arr[12]) printf("The ISBN code is correct\n");
    else if(total%10 == 0 && arr[12] == 0) printf("The ISBN code is correct\n");
    else printf("The ISBN code is wrong\n");    
}

int main()
{
    while(1)
    {
        int len, check;
        char input[13];

        printf("Please input an ISBN code:");
        scanf("%s",input);
        len = strlen(input);

        for(int i=0 ; i<len ; i++)
        {
            input[i] = (int)input[i]-48;
            if(input[i] == 40) input[i] = 10;
        }

        if(len == 10) check = check_ISBN10(input);                      
        else if(len == 13) check = check_ISBN13(input);           
        
        else 
        {
            printf("Error!\n");
            break;       
        }
    }
    return 0;
}
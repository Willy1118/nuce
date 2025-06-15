#include<stdio.h>

int main()
{
    int num1,num2,sum=0;
    char choice = 'y';

    while(choice == 'y')
    {
        printf("Number 1:");
        scanf("%d",&num1);
        printf("Number 2:");
        scanf("%d",&num2);
        if(num1 > num2)
        {
            printf("Error!! Number1 > Number2");
            printf("\n");
            continue;
        }
        if(num1 <= num2)
        {
            for(int i=num1 ; i<=num2 ; i++) 
            {
                sum += i;
            }
        }
        printf("Sum = %d\n",sum);
        printf("Again(Y/N)?? ");
        scanf("%*c%c",&choice);
        sum = 0;
    }

    return 0;
}
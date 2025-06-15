#include<stdio.h>

int main()
{
    int data , sum=0 , drink;

    scanf("%d",&data);

    int now , change , remain;
        
    for(int i=0 ; i<data ; i++)
    {
        scanf("%d %d %d", &now, &change, &remain);

        while((now + change) >= remain)
        {
            drink = (now + change)/remain;
            sum += drink;
            now = (now + change)%remain;
            change = drink;
            
        }
        printf("%d\n",sum);
        sum = 0;
    }
    return 0;
}
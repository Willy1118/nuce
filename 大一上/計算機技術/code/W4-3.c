#include<stdio.h>

int main()
{
    int number, foot, correct=0;
    int chicken, rabbit;

    printf("總數量+總腳數:");
    scanf("%d+%d",&number,&foot);

    while( (number != 0)&&(foot != 0) )
    {
        for(int i=0 ; i<=number ; i++)
        {
            chicken = i;
            rabbit = number-i;
            if(2*chicken + 4*rabbit == foot) 
            {
                correct=1;
                break;
            }
        }
        
        if(correct == 1) printf("雞%d隻 兔子%d隻\n",chicken,rabbit);
        if(correct == 0) printf("無解\n");

        correct = 0;
        
        printf("總數量+總腳數:");
        scanf("%d+%d",&number,&foot);
    }   

    return 0;   
}
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main()
{
    int a=0, b=0, guess[4], answer[4], repeat, count=0;

    srand(time(NULL));
    for(int i=0 ; i<4 ; i++)
    {
        do{
            repeat = 0;
            answer[i]=rand()%10;
            for(int j=0 ; j<i ; j++)
            {
                if(answer[i] == answer[j]) 
                {
                    repeat = 1;
                    break;
                }        
            }
        }while(repeat == 1);
        printf("%d",answer[i]);
    }
    printf("\n");

    printf("Please input four digits(0-9): ") ;
    for(int i=0 ; i<4 ; i++) scanf("%1d",&guess[i]);

    while( (guess[0] != answer[0]) || (guess[1] != answer[1]) || (guess[2] != answer[2]) || (guess[3] != answer[3]) )
    {
        count++;
        a=0;
        b=0;
        for(int i=0 ; i<4 ; i++)
        {
            if(guess[i] == answer[i])
                a++;
        }
        
        for(int i=0 ; i<4 ; i++)
        {
            for(int j=0 ; j<4 ; j++)
            {
                if(i != j)
                {
                    if(guess[i] == answer[j]) b++;
                }
            }
        }
        printf("The result is %dA%dB\n",a,b);

        printf("Please input four digits(0-9): ") ;
        for(int i=0 ; i<4 ; i++) scanf("%1d",&guess[i]);
    }
    printf("You got it!! %d times!!",count+1);

    return 0;
}
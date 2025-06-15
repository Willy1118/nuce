#include<stdio.h>
#include<string.h>

int main()
{
    int num;

    FILE *DataIn;
    DataIn = fopen("txt/t16.txt","r");

    if (DataIn != NULL)
    {
        while(fscanf(DataIn, "%d" ,&num) == 1)
        {
            int equal=0;
            int center=2;
            int dec=0;
            while(equal < num)
            {
                int sum1=0, sum2=0;
                for(int i=1 ; i<center ; i++) sum1 += i;
                for(int i=center+1 ; i<=num ; i++) sum2 += i;

                if(sum1 == sum2)
                {
                    dec=1;
                    break;
                }
                center++;
                equal++;
            }
            if(dec == 0) printf("null\n");
            else printf("%d\n",center);
        }
    }

    return 0;
}
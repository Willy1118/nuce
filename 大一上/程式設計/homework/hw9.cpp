#include<stdio.h>

int main()
{
    int num, arr_long, time=0;

    scanf("%d",&num);

    while(time<num)
    {
        scanf("%d",&arr_long);
        int arr[arr_long], change_time=0, bubble=0;

        for (int i=0 ; i<arr_long ; i++)
        {
            scanf("%d",&arr[i]);
        }
        
        for(int i=1 ; i<arr_long ; i++)
        {
            for(int j=1 ; j<arr_long-bubble ; j++)
            {
                if(arr[j-1]>arr[j])
                {
                    int temp = arr[j-1];
                    arr[j-1] = arr[j];
                    arr[j] = temp;
                    change_time ++ ;
                }
            }
            bubble ++ ;
        }
        printf("%d\n",change_time);
        time ++ ;
    }

    return 0;
}
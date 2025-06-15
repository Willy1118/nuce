#include<stdio.h>

void sort(int *ptr , int n)
{
    //printf("in\n");
    while(n>1)
    {
        for(int i=0 ; i<n ; i++)
        {       
            if( *(ptr+i) > *(ptr+i+1) )
            {
                //printf("in\n");
                int temp = *(ptr+i);
                *(ptr+i) = *(ptr+i+1);
                *(ptr+i+1) = temp;
            }
        }
        n -= 1;
        //printf("\n");
    }
}
int main()
{
    int n;

    printf("請輸入整數的個數:");
    scanf("%d",&n);

    int arr[n];

    for(int i=0 ; i<n ; i++)
    {
        printf("請輸入第%d個數:",i+1);
        scanf("%d",&arr[i]);
    }

    sort(arr,n);

    printf("排序結果:");
    for(int i=0 ; i<n ; i++)
    {
        printf("%d ",arr[i]);
    }

    return 0;
}
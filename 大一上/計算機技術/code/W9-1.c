#include<stdio.h>

static int count=0;

void tower(int n, char A, char B, char C)
{
    if(n==1)
    {
        printf("ring %d:%cto%c\n",n,A,C);
        count += 1 ;
    }
    else
    {
        tower(n-1,A,C,B);
        printf("ring %d:%cto%c\n",n,A,C);
        tower(n-1,B,A,C);
        count ++ ;
    }
}

int main()
{
    int n;
    printf("請輸入要移動的環數:");
    scanf("%d",&n);
    tower(n, 'A', 'B', 'C');
    printf("共需%d個步驟",count);
}
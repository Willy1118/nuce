#include<stdio.h>

int main()
{
    int size, record, sum=0;

    printf("Please input the size of matrix: ");
    scanf("%d",&size);

    int m1[size][size], m2[size][size], m3[size][size];

    printf("Please input matrix1:\n");
    for(int i=0 ; i<size ; i++)
        for(int j=0 ; j<size ; j++)
            scanf("%d",&m1[i][j]);
    
    printf("Please input matrix2:\n");
    for(int i=0 ; i<size ; i++)
        for(int j=0 ; j<size ; j++)
            scanf("%d",&m2[i][j]);
    
    printf("m1*m2=\n");
    for(int i=0 ; i<size ; i++)
    {
        for(int j=0 ; j<size ; j++)
        {
            sum = 0;
            for(int k=0 ; k<size ; k++)
            {
                record = m1[i][k] * m2[k][j];
                sum += record;
            }
            printf("%d ",sum);
        }
        printf("\n");
    }


    return 0;
}
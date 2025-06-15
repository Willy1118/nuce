#include<stdio.h>

int gcd(int a, int b)
{
    while(b%a != 0)
    {
        int remainder = b%a;
        b=a;
        a=remainder;        
    }
    return a;
}

void sort(int (*ptr)[2],int n)
{
    //printf("in\n");
    while(n>1)
    {
        for(int i=0 ; i<n ; i++)
        {       
            if( (float)**(ptr+i)/(*(*(ptr+i)+1)) > (float)**(ptr+i+1)/(*(*(ptr+i+1)+1)) )
            {
                //printf("in\n");
                int temp = **(ptr+i);
                **(ptr+i) = **(ptr+i+1);
                **(ptr+i+1) = temp;
                int t = (*(*(ptr+i)+1));
                (*(*(ptr+i)+1)) = (*(*(ptr+i+1)+1));
                (*(*(ptr+i+1)+1)) = t;
            }
        }
        n -= 1;
        //printf("\n");
    }
}

int main()
{
    int n,a[210][2]={0}, n1=0;

    printf("Please input a number: ");
    scanf("%d",&n);

    for(int i=1 ; i<n ; i++)
    {
        for(int j=n ; j>i ; j--)
        {
            int gcdd = gcd(i,j);
            //printf("i=%d j=%d gcd=%d ",i,j,gcdd);
            //printf("%d %d\n",i/gcdd,j/gcdd);

            a[n1][0] = i/gcdd;
            a[n1][1] = j/gcdd;

            if(i==1 && j==n)
            {
                a[n1][0] = i/gcdd;
                a[n1][1] = j/gcdd;
                n1+=1;
            }
            else
            {
                int count=0;
                for(int k=0 ; k<n1 ; k++)
                {
                    if(a[n1][0] != a[k][0] || a[n1][1] != a[k][1]) count++;                 
                }
                if(count == n1)
                {
                    a[n1][0] = i/gcdd;
                    a[n1][1] = j/gcdd;
                    n1+=1;
                }   
            } 
            //printf("n1=%d\n",n1);          
        }
    }
    printf("0 ");
    for(int l=0 ; l<n1 ; l++)
    {
        printf("%d/%d ",a[l][0],a[l][1]);
        sort(a,n1);
    }
    printf("1");
    printf("(total number:%d)",n1+2);

    return 0;
}
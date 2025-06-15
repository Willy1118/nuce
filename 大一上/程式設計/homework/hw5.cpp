#include<stdio.h>

int main()
{
    int num, count;

    while(scanf("%d",&num) != EOF)
    {
        count=0;
        int a[num], n[num];
        for(int i=0 ; i<num ; i++)
        {
            scanf("%d",&a[i]);
        }
        for(int i=0 ; i<num-1 ; i++)
        {
            n[i] = a[i+1]-a[i];
            if(n[i] < 0) n[i] = -n[i];
        }
        
        for(int i=0 ; i<num-1 ; i++)
        {
            for(int j=i+1 ; j<num-1 ; j++)
            {
                if(n[i] >= n[j])
                {
                    int a=n[i];
                    n[i]=n[j];
                    n[j]=a;
                }               
            }          
        }
        
        for(int i=0 ; i<num-1 ; i++)
        {
            if(n[i]==i+1) count += 1; 
        }
        if(count == num-1) printf("Yes\n");
        else printf("No\n");
    }

    return 0;
}
#include<iostream>
#include<vector>
using namespace std;

int main()
{
    int n;
    int w[10000], f[10000];
    long long cost=0, temp=0 ;

    cin >> n;

    for(int i=0 ; i<n ; i++)
    {
        cin >> w[i];
    }

    for(int i=0 ; i<n ; i++)
    {
        cin >> f[i];
    }

    for(int i=0 ; i<n ; i++)
    {
        for(int j=0 ; j<n-i-1 ; j++)
        {
            if(w[j]*f[j+1] > w[j+1]*f[j])
            {
                int temp1 = w[j];
                w[j] = w[j+1];
                w[j+1] = temp1;
                int temp2 = f[j];
                f[j] = f[j+1];
                f[j+1] = temp2;
            }
        }
    }
    
    for(int i=n-1 ; i>0 ; i--)
    {
        for(int j=0 ; j<i ; j++)
        {
            temp += w[j];
        }
        cost += f[i] * temp;
        temp = 0;
    }

    cout << cost;

    return 0;
}
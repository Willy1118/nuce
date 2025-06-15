#include<iostream>
#include<string>
using namespace std;

long long Find_Max(long long a, long long b)
{
    if(a > b) return a;
    else return b;
}

long long Find_LCSI(string num1, string num2)
{
    int len_num1 = num1.length();
    int len_num2 = num2.length();
    long long lcsi[51][51] = {0};

    for(int i=1 ; i<=len_num1 ; i++)
    {
        for(int j=1 ; j<=len_num2 ; j++)
        {
            if(num1[i-1] == num2[j-1])
            {
                lcsi[i][j] = lcsi[i-1][j-1]*10 + (num1[i-1] - 48);
            }
            else
            {
                lcsi[i][j] = Find_Max(lcsi[i-1][j], lcsi[i][j-1]);
            }
        }
    }
    return lcsi[len_num1][len_num2];
}

int main()
{
    string num1 ,num2;

    while(cin >> num1 >> num2)
    {
        cout << Find_LCSI(num1 ,num2) << endl;
    }

    return 0;
}
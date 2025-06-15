#include<iostream>
#include<math.h>
#include<stdio.h>
using namespace std;

int check_prime(long long n);
int one_number(long long n);

int main()
{
    long long num;
    while(scanf("%lld", &num) != EOF)
    {
        
        int find=0;
        if(num == 4294967295 || num == 0)
		{
			cout << "0" << endl;
			continue;
		}

        if(check_prime(num) == 1) 
        {
            cout << num << endl;
            continue;    
        }

        else
        {
            int orginal_one = one_number(num);
            for(long long i=num-1 ; i>0 ; i--)
            {
                if(one_number(i) == orginal_one)
                {
                    if(check_prime(i) == 1)
                    {
                        find = 1;
                        cout << i << endl;
                        break;
                    }  
                }
            }
            if(find == 0) cout << "0" << endl;
        }
    }
    return 0;
}

int check_prime(long long n)
{
    if(n == 1) return 0;
    if(n == 2) return 1;
    if(n % 2 == 0) return 0;

    for(long long i=3 ; i<=sqrt(n) ; i+=2)
    {
        if(n%i == 0) return 0;
    }
    return 1;
}

int one_number(long long n)
{
    int count = 0;
    while(n != 0)
    {
        if(n % 2 == 1) count += 1;
        n /= 2;
    }
    return count;
}
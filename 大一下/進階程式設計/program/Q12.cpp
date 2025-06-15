#include<iostream>
#include<cstdlib>
#include<string.h>
using namespace std;

int main()
{
    char s[100000];
    int len, s_len, max_len=0, now=0;
    int rec[100000] = {0};

    while(scanf("%s%*c", s) != EOF)
    {
        max_len=0, now=0;
        len = strlen(s);


        for(int i=0 ; i<len-1 ; i++)
        {
            if(s[i] == s[i+1]) //even
            {
                s_len = 2;
                int seq=1;
                while( (i-seq >= 0) && (i+seq+1 <= len-1) )
                {
                    if(s[i-seq] == s[i+seq+1])
                    {
                        s_len += 2;
                    }
                    else break;
                    seq ++ ;
                }
                //cout << s_len;
                
                if(s_len > max_len)
                {
                    //for(int temp=0 ; temp<=now ; temp++) rec[temp] = 0;
                    max_len = s_len;
                    now = 0;
                    rec[now] = i - s_len/2 + 1;
                    now = 1;
                }
                else if(s_len == max_len)
                {
                    rec[now] = i - s_len/2 + 1;
                    now++;
                }
            }

            if(s[i-1] == s[i+1]) //odd
            {
                s_len = 3;
                int seq=2;
                while( (i-seq >= 0) && (i+seq <= len-1) )
                {
                    if(s[i-seq] == s[i+seq])
                    {
                        s_len += 2;
                    }
                    else break;
                    seq ++ ;
                }
                //cout << s_len;

                if(s_len > max_len)
                
                
                {
                    //for(int temp=0 ; temp<=now ; temp++) rec[temp] = 0; //
                    max_len = s_len;
                    now = 0;
                    rec[now] = i - s_len/2;
                    now = 1;
                }
                else if(s_len == max_len)
                {
                    rec[now] = i - s_len/2;
                    now++;
                }
            }
        }
        cout << max_len << " ";
        for(int i=0 ; i<now ; i++)
        {
            for(int j=rec[i] ; j<rec[i]+max_len ; j++)
            {
                cout << s[j];
            } 
            if(i != now-1) cout << ", ";
            rec[i] = 0;
        }
        cout << endl;
    }
    

    return 0;
}
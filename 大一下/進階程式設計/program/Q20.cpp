#include<iostream>
#include<string>
using namespace std;

int max_len(int len1, int len2)
{
    if(len1 > len2) return 0;
    else return 1;
}

int max(int a, int b)
{
    if(a > b) return a;
    else return b;
}

int absolute_value(int a, int b)
{
    if(a > b) return a-b;
    else return b-a;
}

int compare(int a, int b)
{
    if(a < b) return -1;
    if(a == b) return 0;
    if(a > b) return 1;
}

int main()
{
    string s1, s2;
    int coordinate_value, len_s1, len_s2;
    int MAX_dis[100][100] = {0};
    int count[100][100];

    while(cin >> s1 >> s2 >> coordinate_value)
    {
        int MAX_dis[100][100] = {0};
        len_s1 = s1.length();
        len_s2 = s2.length();

        for(int i=0 ; i<len_s1 ; i++)
        {
            for(int j=0 ; j<len_s1 ; j++)
            {
                count[i][j] = 1;
            }
        }

        if(max_len(len_s1, len_s2))
        {
            string temp_s = s1;
            s1 = s2;
            s2 = temp_s;

            int temp = len_s1;
            len_s1 = len_s2;
            len_s2 = temp;
        }

        for(int i=1 ; i<=len_s1 ; i++)
        {
            MAX_dis[i][0] = MAX_dis[i-1][0] + absolute_value(s1[i-1]-'A'+1, coordinate_value);
            count[i][0] = count[i-1][0];
        }

        for(int i=1 ; i<=len_s1 ; i++)
        {
            for(int j=1 ; j<=len_s1 ; j++)
            {
                if(j > i)
                {
                    MAX_dis[i][j] = 0;
                }
                else if(i == j)
                {
                    MAX_dis[i][j] = MAX_dis[i-1][j-1] + absolute_value(s1[i-1]-'A'+1, s2[j-1]-'A'+1);
                    count[i][j] = count[i-1][j-1];
                }
                else 
                {
                    MAX_dis[i][j] = max(MAX_dis[i-1][j] + absolute_value(s1[i-1]-'A'+1, coordinate_value), MAX_dis[i-1][j-1] + absolute_value(s1[i-1]-'A'+1, s2[j-1]-'A'+1));
                    
                    int comp = compare(MAX_dis[i-1][j] + absolute_value(s1[i-1]-'A'+1, coordinate_value), MAX_dis[i-1][j-1] + absolute_value(s1[i-1]-'A'+1, s2[j-1]-'A'+1));

                    if(comp == -1)
                        count[i][j] = count[i-1][j-1];
                    else if(comp == 0)
                        count[i][j] = count[i-1][j] + count[i-1][j-1];
                    else
                        count[i][j] = count[i-1][j];
                }    
            }
        }   

        cout << MAX_dis[len_s1][len_s2] << " " << count[len_s1][len_s2]++ << endl;
    }

    return 0;
}
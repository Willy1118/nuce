#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

bool check(int len, int K, vector <int> position)
{
    int now_pos = position[0] + len;
    int num = 1;

    for(int i: position)
    {
        if(i <= now_pos) continue;
        num ++ ;
        now_pos = i + len;
    }
    return (num <= K);
}

int main()
{
    int N, K;
    int L=0 ,R=int(1e9)+1;
    vector <int> position;

    cin >> N >> K;
    
    position.resize(N);

    for(int &x : position) cin >> x;
    sort(position.begin(), position.end());

    while(R - L > 1)
    {
        int m = (L+R)/2;

        if(check(m, K, position)) R=m;
        else L=m;
    }

    cout << R << endl;

    return 0;
}
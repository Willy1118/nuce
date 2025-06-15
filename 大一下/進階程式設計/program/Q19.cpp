#include<iostream>
using namespace std;

int F(int people ,int bomb, int round)
{
    if(round == 0) return 0;

    else
    {
        return (F(people-1, bomb, round-1) + bomb) % people;
    }

}

int main()
{
    int people, bomb, round;

    while(cin >> people >> bomb >> round)
    {
        cout << F(people, bomb, round) + 1;
        cout << endl;
    }
    

    return 0;
}
#include<iostream>
using namespace std;

int main()
{
    int data_number, info_num;
    
    cin >> data_number;

    for(int i=0 ; i<data_number ; i++)
    {
        cin >> info_num;
        int a[30], v[30][30]={0};
        int time=0;

        for(int print_x=0 ; print_x<info_num ; print_x++)
        {
            for(int print_y=0 ; print_y<info_num ; print_y++)
            {
                v[print_x][print_y]=0;
            }
        }

        for(int j=0 ; j<info_num ; j++) cin >> a[j];

        for(int j=0 ; j<info_num-2 ; j++)
        {
            v[j][j+2] = a[j]*a[j+1]*a[j+2];
        }

        for(int time=3 ; time<=info_num-1 ; time++)
        {
            for(int x=0 ; x<info_num-time ; x++)
            {
                int begin = x;
                int over = x+time;
                for(int y=begin+1 ; y<=over-1 ; y++)
                {
                    int temp = v[begin][y] + v[y][over] + a[begin] * a[y] * a[over];
                    if(y == begin+1) v[begin][over] = temp;
                    else if(temp > v[begin][over]) v[begin][over] = temp;
                }
            }
        }
        cout << v[0][info_num-1] << " ";

        for(int print_x=0 ; print_x<info_num ; print_x++)
        {
            for(int print_y=0 ; print_y<info_num ; print_y++)
            {
                v[print_x][print_y]=0;
            }
        }
        for(int j=0 ; j<info_num-2 ; j++)
        {
            v[j][j+2] = a[j]*a[j+1]*a[j+2];
        }

        for(int time=3 ; time<=info_num-1 ; time++)
        {
            for(int x=0 ; x<info_num-time ; x++)
            {
                int begin = x;
                int over = x+time;
                for(int y=begin+1 ; y<=over-1 ; y++)
                {
                    int temp = v[begin][y] + v[y][over] + a[begin] * a[y] * a[over];
                    if(y == begin+1) v[begin][over] = temp;
                    else if(temp < v[begin][over]) v[begin][over] = temp;
                }
            }
        }
        cout << v[0][info_num-1] << endl;
        
    }

    return 0;
}
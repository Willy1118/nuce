#include<iostream>
using namespace std;

int main()
{
    char rec[9][100000];
    int num, round=2, out, tmp_out=0, score=0, base[4]={0};

    for(int i=0 ; i<9 ; i++)
    {
        gets(rec[i]); //讀一整列
    }
    /*for(int i=0 ; i<9 ; i++)
    {
        cout << rec[i] << " ";
    }*/
    scanf("%d",&out);
    //printf("%d",out);


    while(1)
    {
        int b=0;
        for(int i=0 ; i<9 ; i++)
        {
            char now = rec[i][round];
            
            //printf("一壘=%d 二壘=%d 三壘=%d 分數=%d 出局=%d\n", base[1], base[2], base[3], score, tmp_out);

            if(tmp_out == out)
            {
                b = 2;
                break;
            }

           
            
            if(now != '1' && now != '2' && now != '3' && now != 'H' && now != 'F' && now != 'G' && now != 'S' ) 
            {
                b = 1;
                break;
            }
            //printf("now=%c ",now);
            if(now == 'H') //全壘打
            {
                score = score + base[1] + base[2] + base[3] + 1;
                base[1] = 0;
                base[2] = 0;
                base[3] = 0;
                //printf("全壘 一壘=%d 二壘=%d 三壘=%d 分數=%d 出局=%d\n", base[1], base[2], base[3], score, tmp_out);
                continue;
            }

            if(now == '1') //一壘安打
            {
                score += base[3];
                base[3] = base[2];
                base[2] = base[1];
                base[1] = 1;
                //printf("一安 一壘=%d 二壘=%d 三壘=%d 分數=%d 出局=%d\n", base[1], base[2], base[3], score, tmp_out);
                continue;
            }

            if(now == '2') //二壘安打
            {
                score = score + base[3] + base[2];
                base[3] = base[1];
                base[2] = 1;
                base[1] = 0;
                //printf("二安 一壘=%d 二壘=%d 三壘=%d 分數=%d 出局=%d\n", base[1], base[2], base[3], score, tmp_out);
                continue;
            }

            if(now == '3') //三壘安打
            {
                score = score + base[3] + base[2] + base[1];
                base[3] = 1;
                base[2] = 0;
                base[1] = 0;
                //printf("三安 一壘=%d 二壘=%d 三壘=%d 分數=%d 出局=%d\n", base[1], base[2], base[3], score, tmp_out);
                continue;
            }

            if(now == 'S' || now == 'F' || now == 'G') //出局
            {
                tmp_out += 1;
                if(tmp_out % 3 == 0 && tmp_out != 0) 
                {
                    base[1] = 0;
                    base[2] = 0;
                    base[3] = 0;
                }
                //printf("出局 一壘=%d 二壘=%d 三壘=%d 分數=%d 出局=%d\n", base[1], base[2], base[3], score, tmp_out);
            }

            
        }
        round += 3;

        if(b == 1) break;
        if(b == 2) 
        {
            printf("%d", score);
            break;
        }
    }
        

    return 0;
}
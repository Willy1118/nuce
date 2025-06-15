#include<stdio.h>


int main()
{
    int king, rook, rook_2, record;

    while(scanf("%d %d %d",&king, &rook, &rook_2) != EOF)
    {

        //將和軍起始位置一樣->IS
        if( king == rook )
        {
            printf("IS\n");
            continue;
        }
        //車不是垂直水平移動 或 車移動後的位置和將一樣 或 車沒移動->IM
        if( ((rook/8 != rook_2/8) && (rook % 8 != rook_2 % 8)) || (king == rook_2) || (rook == rook_2) )
        {
            printf("IM\n");
            continue;
        }
        else 
        {  
            if( ( (rook/8 == king/8) && (king/8 == rook_2/8) ) || ( (rook%8 == king%8) && (king%8 == rook_2%8) ) )
            {
                //車越過將->IM
                if( ( (rook<king) && (king<rook_2) ) || ( (rook>king) && (king>rook_2) ) )
                {
                    printf("IM\n");
                    continue;
                } 
            }

            if( (rook_2/8 == king/8) || (rook_2%8 == king%8) )
            {
                //車在將可走範圍->MNA
                if( ( rook_2%8 == king%8+1 ) || (rook_2%8 == king%8-1) || (rook_2/8 == king/8+1) || (rook_2/8 == king/8-1) )
                {
                    printf("MNA\n");
                    continue;
                }
            }
            //將不可移動->S
            if( ( (king == 0) && (rook_2 == 9) ) || ( (king == 7) && (rook_2 == 14) ) || ( (king == 56) && (rook_2 == 49) ) || ( (king == 63) && (rook_2 == 54) ) )
            {
                printf("S\n");
                continue;
            }
            //其餘狀況代表合法移動且車、將沒互相干擾->A
            else
                printf("A\n");
        }
    }

    return 0;
}
#include<stdio.h>
#include<stdlib.h>

// 瑼Ｘ??血歇蝬??冽 edges_number 銝?
bool edge_exists(int edges_number[][2], int edges, int begin, int end) {
    for (int i = 0; i < edges; i++) {
        if ((edges_number[i][0] == begin && edges_number[i][1] == end) ||
            (edges_number[i][0] == end && edges_number[i][1] == begin)) {
            return true;
        }
    }
    return false;
}


int main(int argc, char *argv[])
{
    int i, j;

    FILE *fp;
    char newline[10];
    const char *tempch = " ";  // 靽格??const char*
    int nodenum, edgenum=0, cost, begin, end;
    int edges = 0;
    int edges_number[50][2];

    // ??瑼? "cost239" 銝西???暺?????
    fp = fopen("cost239", "r");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // 霈?洵銝銵?
    fgets(newline, sizeof(newline), fp);

    // ?斗瑼??澆? (?臬???貉?閮?
    if (sscanf(newline, "%i %i", &nodenum, &edgenum) == 1) {
        // ?芣?蝭暺????閬?撘?蝞?
        //printf("nodenum = %d\n", nodenum);
    } else {
        // 蝭暺???賊??
        //printf("nodenum = %d, edgenum = %d\n", nodenum, edgenum);
    }

    // ????亦??
    int A[nodenum][nodenum];
    for (i = 0; i < nodenum; i++)
        for (j = 0; j < nodenum; j++)
            A[i][j] = 0;

    // 霈??鞈?
    while (fgets(newline, sizeof(newline), fp) != NULL) {
        sscanf(newline, "%i %i %i", &begin, &end, &cost);
        A[begin][end] = 1;
        A[end][begin] = 1;

        // 蝣箔?摮????摨 begin < end
        if (begin > end) {
            int temp = begin;
            begin = end;
            end = temp;
        }

        // 憒???摮嚗?摮 edges_number
        if (!edge_exists(edges_number, edges, begin, end)) {
            edges_number[edges][0] = begin;
            edges_number[edges][1] = end;
            edges++;
        }
    }
    fclose(fp);

    // 憒?瑼?瘝????嚗?撘銵?蝞?
    if (edgenum == 0) {
        edgenum = edges;
    }
    //printf("Total edges = %d\n", edgenum);

    int r, f;

    int k, c, pre, no; // no ?冽餈質馱?桀?頝臬??瑕漲
    int b = 0; // b 銵函內?曉??亦?暺??
    int s = 0, e = nodenum, cycle = 0; // ????憪?暺???暺?敺芰閮
    int temp[nodenum];
    int order[20000][nodenum]; // ?其?摮頝臬??????
    int check_re[20000];
    int check_cycle[nodenum];
    int all_cycles[20000][nodenum + 1];
    int cycles_length[20000];

    // ????order ?拚??-1
    for (i = 0; i < 20000; i++)
        for (j = 0; j < nodenum; j++)
            order[i][j] = -1;

    // 撠???暺身摰??頝臬??絲暺?
    for (i = 0; i < nodenum; i++)
        order[i][0] = i;

    int adde; // 閮?頝臬??啣????
    int t; // ?怠?霈
    int smallest, compare;
    int m, n;
    int basis_cycle_number, find_cycle=2;
    int basis_cycle[50];
    int gaussian[50][edgenum];

    for(int i=0 ; i<50 ; i++)
        for(int j=0 ; j<edgenum ; j++)
            gaussian[i][j] = 0;
        

    // ???脰?頝臬???嚗?閰行?唳???蝪∪敺芰頝臬?
    for (no = 1; no < nodenum; no++) // 閮剖??桀?頝臬??摨?no
    {
        adde = 0;
        s = 0;

        for (k = 0; k < e; k++) // 敺?s ??e ?風??楝敺?
        {
            s = s + b;
            b = 0;
            pre = order[s][no - 1]; // ???嗅?頝臬???敺???暺?

            // ?曉??pre 蝭暺?啁?蝭暺?
            for (i = order[s][0] + 1; i < nodenum; i++)
            {
                if (A[pre][i] == 1) // 憒? pre ??i 蝭暺??
                {
                    // 瑼Ｘ閰脩?暺?血歇蝬??冽頝臬?銝?
                    for (j = 1; j < (no - 1); j++)
                    {
                        if (order[s][j] == i) // 憒?撌脣??剁???箸炎??
                        {
                            j = -1;
                            break;
                        }
                    }
                    if (j != -1)
                        temp[b++] = i; // 憒??芣?堆?撠迨蝭暺???temp ???銝?
                }
            }
            c = 0;

            if (b > 0) // 憒??曉?唳蝭暺?
            {
                adde = adde + b - 1;
                // 撠?楝敺?敺宏?誑擉啣蝛粹?蝯行頝臬?
                for (i = e + adde; i > s; i--)
                {
                    for (j = 0; j < no; j++)
                        order[i + b - 1][j] = order[i][j];
                }

                // ?湔頝臬???嚗蒂撠蝭暺??亥楝敺葉
                for (i = s; i < (s + b); i++)
                {
                    order[i][no] = temp[c++];
                    for (j = 0; j < no; j++)
                        order[i][j] = order[s][j];

                    // 瑼Ｘ?臬敶Ｘ?敺芰
                    if (no > 1 && A[order[i][no]][order[i][0]] == 1)
                    {
                        for (m = 0; m <= no; m++)
                            check_cycle[m] = order[i][m];

                        // 撠儐?啗??摮耦撘??嫣噶瑼Ｘ?臬??
                        compare = 0;
                        for (m = 1; m <= no; m++)
                            compare = compare * 10 + check_cycle[m];
                        compare = compare * 10 + check_cycle[0];

                        check_re[i] = 0;
                        for (m = no; m >= 0; m--)
                            check_re[i] = check_re[i] * 10 + check_cycle[m];

                        for (m = 0; m < i; m++)
                        {
                            if (check_re[m] == compare) // 憒??曉??敺芰嚗歲??
                            {
                                m = -1;
                                break;
                            }
                        }

                        // 憒??芣?圈?銴儐?堆?頛詨敺芰銝血?????
                        if (m != -1)
                        {
                            //printf("Cycle = %d : ", cycle);
                            for (j = 0; j <= no; j++){
                                all_cycles[cycle][j] = order[i][j];
                            }
                            all_cycles[cycle][no+1] = order[i][0];
                            cycles_length[cycle] = no + 2;
                            cycle++;
                        }
                    }
                }
            }
            else // 憒??芣?圈?亦?暺?
            {
                // 撠?曉?楝敺? order ???銝剔宏??
                for (i = s; i < e + adde; i++)
                {
                    for (j = 0; j <= no; j++)
                        order[i][j] = order[i + 1][j];
                }
                adde--;
            }
        }
        e = e + adde;
    }
    // printf("%d cycles", cycle);
    //printf("\n");

    

    basis_cycle_number = 2;
    basis_cycle[0] = 0;
    basis_cycle[1] = 1;

    // 撠洵銝?洵鈭ycle摮gaussian
    for(int c=0 ; c<2 ; c++)
    {
        for(int i=0 ; i<cycles_length[c]-1 ; i++)
        {
            for(int j=0 ; j<edgenum ; j++)
            {
                if( (all_cycles[c][i]==edges_number[j][0]&&all_cycles[c][i+1]==edges_number[j][1]) || (all_cycles[c][i]==edges_number[j][1]&&all_cycles[c][i+1]==edges_number[j][0]) )
                {
                    gaussian[c][j] = 1;
                }
            }
        }
    }

    // ?啣擃
    for(int i=0 ; i<3 ; i++)
    {
        for(int j=0 ; j<edgenum ; j++){
            //printf("%d ", gaussian[i][j]);
        }
        //printf("\n");
    }
    
    basis_cycle_number = edgenum - nodenum + 1;

    int total_combination = (1 << find_cycle) - 1;
    int now_cycle = 2;
    while(find_cycle != basis_cycle_number)
    {
        bool is_add = true;
        int now_gaussian[edgenum]={0};
        //printf("\n\nnow-cycle = %d => gaussian = ", now_cycle);
        for(int i=0 ; i<cycles_length[now_cycle]-1 ; i++)
        {
            for(int j=0 ; j<edgenum ; j++)
            {
                if( (all_cycles[now_cycle][i]==edges_number[j][0]&&all_cycles[now_cycle][i+1]==edges_number[j][1]) || (all_cycles[now_cycle][i]==edges_number[j][1]&&all_cycles[now_cycle][i+1]==edges_number[j][0]) )
                {
                    now_gaussian[j] = 1;
                }
                gaussian[find_cycle][j] = now_gaussian[j];
            }
        }
        for(int j=0 ; j<edgenum ; j++){
            //printf("%d ", now_gaussian[j]);
        }
        //printf("\n");
        for(int i=1 ; i<=total_combination ; i++)
        {
            int result[edgenum] = {0};
            int  all = 0;
            for(j=0 ; j<find_cycle ; j++)
            {
                if (i & (1 << j))
                {
                    for (int k = 0; k < edgenum; k++) 
                    {
                        result[k] ^= gaussian[j][k];  // ??蝝?XOR
                    }
                }
            }
            //printf("result %d : ",i);
            for(int cmp=0 ; cmp<edgenum ; cmp++)
            {
                //printf("%d ", result[cmp]);
                if(result[cmp] ^ now_gaussian[cmp] == 0)
                {
                    all += 1;
                }
            }
            //printf(" all = %d", all);
            if(all == edgenum) 
            {
                is_add = false;
            }
            //printf(" is_add = %d\n", is_add);
            if(!is_add) break;
        }
        if(is_add)
        {
            basis_cycle[find_cycle] = now_cycle;
            
            find_cycle += 1;
            total_combination = (1 << find_cycle) - 1;
        }
        //printf("find_cycle = %d ,total_combination = %d", find_cycle, total_combination);
        now_cycle += 1;
    }

    printf("basis cycle:\n");
    for(int i=0 ; i<basis_cycle_number ; i++)
    {
        printf("cycle %d : ", i+1);
        for(int j=0 ; j<cycles_length[basis_cycle[i]]-1 ; j++)
        {
            printf("%d -> ", all_cycles[basis_cycle[i]][j]);
        }
        printf("%d", all_cycles[basis_cycle[i]][0]);
        printf("\n");
    }
    
}
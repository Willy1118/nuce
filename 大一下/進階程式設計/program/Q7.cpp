#include<stdio.h>
#include<stdlib.h>
#include<iostream>
#include<vector>
using namespace std;

int main()
{
    int grade[100000];
    int student, all=0, max=0;
    char ch;

    scanf("%d", &student);

    for(int x=0 ; x<student ; x++)
    {
        int max=0;
        int index=0;
        while(1)
        {    
            scanf("%d", &grade[index]); 
            ch = getchar();  
            if(grade[index] > max) max = grade[index];
            
            index++;
            if(ch != ' ') break;
        }
        
        if(max < 95)
        {
            for(int i=0 ; i<index ; i++)
                if((grade[i] + (95 - max)) >= 55 && (grade[i] + (95 - max)) <= 59)
                    all++;
        }
            
        //for(int i=0 ; i<index ; i++) printf("%d ", grade[i]);
        else
        {
            for(int i=0 ; i<index ; i++)
            {
                if( grade[i]>=55 && grade[i]<=59 ) all++;
            }
        }
        
        printf("%d\n",all);
        all=0;
    }

    return 0;
}
#include<stdio.h>
#include<string.h>

#define MAX 1000
char animal[MAX][100], place[MAX][100], animal_name[MAX][100][100];

int amount[MAX];
int animal_amount[MAX][100];
int animal_num[MAX];

int loc_check(char * loc, int n)
{
    for(int i=0 ; i<n ; i++)
        if(strcmp(place[i], loc) == 0)
            return i;
    return -1;
}

int animal_check(char* animal, int n, char animal_name[][100])
{
    for(int i=0 ; i<n ; i++)
        if(strcmp(animal_name[i], animal) == 0)
            return i;
    return -1;
}

int main()
{
    int n, num=0;
    scanf("%d", &n);

    for(int i=0 ; i<n ; i++)
    {
        scanf("%s %d %s", animal[i], &amount[i], place[i]);
        
        int where_loc = loc_check(place[i], num);
        if(where_loc == -1)
        {
            where_loc = num;
            num ++;
            strcpy(place[where_loc], place[i]);
        }
        
        int where_animal = animal_check(animal[i], animal_num[where_loc], animal_name[where_loc]);
        if(where_animal == -1)
        {
            where_animal = animal_num[where_loc];
            animal_num[where_loc]++ ;
            strcpy(animal_name[where_loc][where_animal], animal[i]);
        }

        animal_amount[where_loc][where_animal] += amount[i];
    }
    for(int i=0 ; i<num ; i++) 
	{
        printf("%s : ", place[i]);
        for (int j=0 ; j<animal_num[i] ; j++) 
		{
            printf("%s %d", animal_name[i][j], animal_amount[i][j]);
            if(j != animal_num[i]-1) 
			{
                printf(", ");
            }
        }
        printf("\n");
    }
}
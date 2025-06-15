#include<iostream>
#include<cstring>
#include<iomanip>
using namespace std;

#define name_long 30

void sorting(char **name, int *score, int people);
float average(int *arr, int people);

struct information 
{
    int people;
    int *score;
    char **name;
};

int main()
{
    struct information student;

    cout << "Please input the number of the students: ";
    cin >> student.people;

    student.score = new int[student.people];
    student.name = new char*[student.people];

    for(int i=0 ; i<student.people ; i++)
    {
        cout << "Please enter the name and the score of the " << i+1 << " student: ";
        student.name[i] = new char [name_long];
        cin >> student.name[i];
        cin >> student.score[i];
    }
    sorting(student.name, student.score, student.people);

    cout << endl << endl;
    for(int i=0 ; i<student.people ; i++)
    {
        cout << student.name[i] << " " << student.score[i] << endl;
    }
    
    cout << "The average are " << setprecision(3) << average(student.score, student.people) ;
    return 0;
}

void sorting(char **name, int *score, int people)
{
    for(int i=people-1 ; i>=0 ; i--)
    {
        for(int j=0 ; j<i ; j++)
        {
            if(score[j] > score[j+1])
            {
                int temp = score[j];
                score[j] = score[j+1];
                score[j+1] = temp;

                char change[30];
                strcpy(change, name[j]);
                strcpy(name[j], name[j+1]);
                strcpy(name[j+1], change);
            }
        }
    }
   
}

float average(int *arr, int people)
{
    int sum=0;
    for(int i=0 ; i<people ; i++)
    {
        sum += arr[i];
    }

    float aver = (float)sum/people ;
    return aver;
}
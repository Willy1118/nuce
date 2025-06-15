#include<iostream>
using namespace std;

int find_class(int student, int* classmate)
{
    if(classmate[student] == student) return student;
    else return classmate[student] = find_class(classmate[student], classmate);
}

void union_class(int student1, int student2, int *classmate)
{
    int class1 = find_class(student1, classmate);
    int class2 = find_class(student2, classmate);
    classmate[class2] = class1;
}

int main()
{
    int student, relationship;
    int student1, student2;
    int classmate[5000];
    while(cin >> student >> relationship)
    {
        int ans = 0;

        for(int i=0 ; i<student ; i++)
        {
            classmate[i] = i;
        }

        for(int i=0 ; i<relationship ; i++)
        {
            cin >> student1 >> student2;
            union_class(student1, student2, classmate);
        }
        for(int i=0 ; i<student ; i++)
        {    
            if(classmate[i] == i) ans += 1;
        }
        cout << ans << endl;
    }

    return 0;
}
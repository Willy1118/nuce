#include <iostream>
#include <fstream>

using namespace std;

class FileFilter
{
    public:
        virtual char transform(char ch) = 0;

        void doFilter(ifstream &in, ofstream &out)
        {
            char ch;
            while(in.get(ch))
            {
                ch = transform(ch);
                out.put(ch);
            }
        }
};

class LineBreaksRemovolFilter :public FileFilter
{
    char transform(char ch)
    {
        if(ch == '\n') return ' ';
        else return ch;
    }
};

int main() 
{
    ifstream inputFile("input.txt");
    ofstream outputFile("output.txt");

    if (!inputFile.is_open()) {
        cout << "Failed to open input file." << endl;
        return 0;
    }

    LineBreaksRemovolFilter lineBreaksRemovolFilter;
    lineBreaksRemovolFilter.doFilter(inputFile, outputFile);

    inputFile.close();
    outputFile.close();

    return 0;
}
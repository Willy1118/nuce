#include<iostream>
using namespace std;

class Publication
{
    private:
        string title;
        int volumn;
        int year;
    public:
        void set_info()
        {
            cout << "Enter the title : ";
            getline(cin, title);

            cout << "Enter the volumn : ";
            cin >> volumn;

            cout << "Enter the year : ";
            cin >> year;
        }
        void display_info()
        {
            cout << "Title : " << title << endl;
            cout << "Volumn : " << volumn << endl;
            cout << "Year : " << year << endl;
        }
};

class Book
{
    private:
        string author;
        string ISBN;
        int price;
    public:
        void set_info()
        {
            cin.ignore();

            cout << "Enter the author : ";
            getline(cin, author);

            cout << "Enter the ISBN : ";
            getline(cin, ISBN);

            cout << "Enter the price : ";
            cin >> price;
        }
        void display_info()
        {
            cout << "Author : " << author << endl;
            cout << "ISBN :" << ISBN << endl;
            cout << "Price : $" << price << endl;
        }
};

class Journal
{
    private:
        int month;
        string ISSN;
        float impactFactor;
        int annualSubscription;
    public:
        void set_info()
        {
            cout << "Enter the month : ";
            cin >> month;

            cin.ignore();

            cout << "Enter the ISSN : ";
            getline(cin, ISSN);

            cout << "Enter the impact Factor : ";
            cin >> impactFactor;

            cout << "Enter the annual Subscription : ";
            cin >> annualSubscription;
        }
        void display_info()
        {
            cout << "Month : " << month << endl;
            cout << "ISSN : " << ISSN << endl;
            cout << "Impact Factor : " << impactFactor << endl;
            cout << "Annual Subscription : $" << annualSubscription << endl;
        }
};

class Magazine
{
    private:
        int month;
        string editor;
        int annualSubscription;
    public:
        void set_info()
        {
            cout << "Enter the month : ";
            cin >> month;

            cin.ignore();

            cout << "Enter the editor : ";
            getline(cin, editor);

            cout << "Enter the annual Subscription : ";
            cin >> annualSubscription;
        }
        void display_info()
        {
            cout << "Month : " << month << endl;
            cout << "Editor : " << editor << endl;
            cout << "Annual Subscription : $" << annualSubscription << endl;
        }
};

int main()
{
    Publication publication;
    Book book;
    Journal journal;
    Magazine magazine;

    publication.set_info();

    cout << endl;
    cout << "Enter the book details\n";
    book.set_info();
    
    cout << endl;
    cout << "Enter the journal details\n";
    journal.set_info();
    
    cout << endl;
    cout << "Enter the magazine details\n";
    magazine.set_info();
    
    cout << endl;
    publication.display_info();

    cout << "\nBook details:\n";
    book.display_info();

    cout << "\nJournal details:\n";
    journal.display_info();

    cout << "\nMagazine details:\n";
    magazine.display_info();

    return 0;
}
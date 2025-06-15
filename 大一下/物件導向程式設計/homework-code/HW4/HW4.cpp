#include<iostream>
#include<iomanip>
#include<cstdlib>
#include<string.h>
using namespace std;

class Customer
{
    public:
        char name[50];
        char address[100];
        char phone_number[10];
    
        void setName(char *n)
        {
            strcpy(name, n);
        }
        void setAddress(char *n)
        {
            strcpy(address, n);
        }
        void set_Phone(char *n)
        {
            strcpy(phone_number, n);
        }
            

};

class Car
{
    public:
        char make[20];
        char model[10];
        int year;

        void set_make(char c)
        {
            strcpy(make, "German");
        }
    
        void set_model(char c)
        {
            if( c == 'A' || c == 'a' ) strcpy(model, "Mercedes");
            else if( c == 'B' || c == 'b' ) strcpy(model, "Porsche");
            else if( c == 'C' || c == 'c' ) strcpy(model, "BMW");
        }
        void set_year(char c)
        {
            if( c == 'A' || c == 'a' ) year = 2021;
            else if( c == 'B' || c == 'b' ) year = 2022;
            else if( c == 'C' || c == 'c' ) year = 2023;
        }
};

class ServiceQuoto
{
    public:
        float car_price = 0.0;
        float car_tax = 0.0;
        float labor_charge = 0.0;
        void set_price(char c)
        {
            if( c == 'A' || c == 'a' )
            {
                car_price = 750000;
                car_tax = 1.1;
                labor_charge = 20000;
            }
            else if( c == 'B' || c == 'b' )
            {
                car_price = 1000000;
                car_tax = 1.2;
                labor_charge = 25000;
            }
            else if( c == 'C' || c == 'c' )
            {
                car_price = 1250000;
                car_tax = 1.3;
                labor_charge = 30000;
            }
        }
    
};

void ShowQuoto(char *name, char *address, char *phone_number, char *make, char *model, int year, float car_price, float car_tax, float labor_charge)
{
    cout << endl << "-------------------------------" << endl;
    cout << "Customer's name : " << name << endl;
    cout << "Customer's address : " << address << endl;
    cout << "Customer's phone number : " << phone_number << endl;
    cout << "Customer's car model : " << model << endl;
    cout << "The country of the car : " << make << endl;
    cout << "The year of the car : " << year << endl;
    cout << "Price of the car : "<< setiosflags(ios::fixed) << setprecision(2) << car_price << endl;  
    cout << "Labor price : " << labor_charge << endl; 
    cout << "Tax : " << car_tax << setiosflags(ios::fixed) << setprecision(2)  << endl;
    cout << "Total price : " << setiosflags(ios::fixed) << setprecision(2) << (car_price + labor_charge) *car_tax << endl;
    cout << "-------------------------------" << endl;
}

int main()
{
    int first = 0, set = 2, year, find_delete=0, find=0;
    char decision, model, check;
    char name[50], address[100], phone_number[11];
    class Customer customer[50];
    class Car car[50];
    class ServiceQuoto price[50];
    cout << "The first \"insert\" should input 2 information" << endl;
    while(1)
    {
        cout << "Insert, delete or search (I/D/S) : ";
        cin >> decision;

        if( decision == 'I' || decision == 'i')
        {
            if(first == 0)
                for(int i=0 ; i<2 ; i++)
                {
                    cin.ignore();
                    cout << "Please input your name : ";
                    cin.getline(name, 50);
                    cout << "please input your address : ";
                    cin.getline(address, 100);
                    cout << "please input your phone number : ";
                    cin.getline(phone_number, 10);
                    cout << "Which model do you want (A.Mercedes B:Porsche C:BMW) : ";
                    cin >> model;

                    customer[i].setName(name);
                    customer[i].setAddress(address);
                    customer[i].set_Phone(phone_number);
                    car[i].set_model(model);
                    car[i].set_year(model);
                    car[i].set_make(model);
                    price[i].set_price(model);

                    cout << endl;
                    first = 1;
                }
            else
            {
                cin.ignore();
                cout << "Please input your name : ";
                cin.getline(name, 50);
                cout << "please input your address : ";
                cin.getline(address, 100);
                cout << "please input your phone number : ";
                cin.getline(phone_number, 10);
                cout << "Which model do you want (A.Mercedes B:Porsche C:BMW) : ";
                cin >> model;

                customer[set].setName(name);
                customer[set].setAddress(address);
                customer[set].set_Phone(phone_number);
                car[set].set_model(model);
                car[set].set_year(model);
                car[set].set_make(model);
                price[set].set_price(model);

                cout << endl;
                set ++ ;
            }
        }

        else if( decision == 'D' || decision == 'd')
        {
            int local;
            cin.ignore();
            cout << "Which name of customer do you want to delete?";
            cin.getline(name, 50);
            cout << "What is the customer's phone number?";
            cin.getline(phone_number, 10);

            for(int i=0 ; i<set ; i++)
            {
                char check;
                
                if( strcmp(customer[i].name, name) == 0 && strcmp(customer[i].phone_number, phone_number) == 0 )
                {
                    local = i;
                    cout << "find it! Are you sure to delete it? (Y/N)" ;
                    cin >> check;
                    if(check == 'Y' || check == 'y') find_delete = 1;
                    if(check == 'N' || check == 'n') find_delete = 2;
                    break;
                }
            }
            if(find_delete == 0)
                cout << "There is no information, please input again." << endl;
            else if(find_delete == 1)
            {
                cout << "We delete it!" << endl;
                strcpy(customer[local].name, " ");
                strcpy(customer[local].phone_number, " ");
            }
            else if(find_delete == 2)
            {
                cout << "Ok, We won't it!" << endl;
            }
            find_delete = 0;
        }

        else if( decision == 'S' || decision == 's')
        {
            cin.ignore();
            cout << "Search name or date?(N/D)";
            cin >> check;
            if( check == 'N' || check == 'n' )
            {
                cin.ignore();
                cout << "Input name : ";
                cin.getline(name, 50); 
                for(int i=0 ; i<set ; i++)
                {
                    if( strcmp(customer[i].name, name ) == 0 )
                    {
                        cout << "find it!" << endl;
                        ShowQuoto(customer[i].name, customer[i].address, customer[i].phone_number, car[i].make, car[i].model, car[i].year, price[i].car_price, price[i].car_tax, price[i].labor_charge);
                        find = 1;
                    }
                }
                    
            } 
            if( check == 'D' || check == 'd' )
            {
                
                cout << "Enter the year : ";
                cin >> year;
                for(int i=0 ; i<set ; i++)
                    if( car[i].year == year) 
                    {
                        cout << "find it!" << endl;
                        ShowQuoto(customer[i].name, customer[i].address, customer[i].phone_number, car[i].make, car[i].model, car[i].year, price[i].car_price, price[i].car_tax, price[i].labor_charge);
                        find = 1;
                    }
            }
            
            /*for(int i=0 ; i<set ; i++)
            {
                if( strcmp(customer[i].name, name) == 0 && strcmp(customer[i].phone_number, phone_number) == 0 )
                {
                    cout << "find it!" << endl;
                    ShowQuoto(customer[i].name, customer[i].address, customer[i].phone_number, car[i].make, car[i].model, car[i].year, price[i].car_price, price[i].car_tax, price[i].labor_charge);
                    find = 1;
                    break;
                }
            }*/
            if(find == 0)
                cout << "There is no information, please input again." << endl;
            find = 0;
        }
    
        else
        {
            cout << "You input wrong tab, please input again" << endl;
        }
    }
    return 0;
}
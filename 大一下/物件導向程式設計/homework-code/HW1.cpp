#include<iostream>
using namespace std;

int charge(int day, float rate, int services, int medication);
int charge(int services, int medication);
int check_input(float);

int main()
{
    char patient;

    cout << "Welcome to the hospital online system.\nIf you are inpatient ,please print 'i', if you are outpatient, please print 'o'" << endl;
    while(1)
    {
        int day, services, medication, check, c;
        float rate, total;
        cin >> patient;
        if(patient == 'i')
        {
            cout << endl << endl;
            while(1)
            {
                cout << "Enter the number of days you spent in the hospital:";
                cin >> day;
                check = check_input(day);
                if(check == 1)
                {
                    cout << "Sorry, your enter can not be zero, or less than zero. Please reenter. \n";
                    continue;
                }
                break;
            }
            
            while(1)
            {
                cout << endl << "Enter the daily rate:";
                cin >> rate;
                check = check_input(rate);
                if(check == 1)
                {
                    cout << "Sorry, your enter can not be zero, or less than zero. Please reenter. \n";
                    continue;
                }
                break;
            }
            
            while(1)
            {
                cout << endl << "Enter the charges for hospital services:";
                cin >> services;
                check = check_input(services);
                if(check == 1)
                {
                    cout << "Sorry, your enter can not be zero, or less than zero. Please reenter. \n";
                    continue;
                }
                break;
            }
            
            while(1)
            {
                cout << endl << "Enter the medication charges:";
                cin >> medication;
                check = check_input(medication);
                if(check == 1)
                {
                    cout << "Sorry, your enter can not be zero, or less than zero. Please reenter. \n";
                    continue;
                }
                break;
            }
            
            total = charge(day, rate, services, medication);  
            cout << "The total charge are " << total << endl;      
        }
        else if( patient == 'o')
        {
            cout << endl << endl;
            while(1)
            {
                cout << endl << "Enter the charges for hospital services:";
                cin >> services;
                check = check_input(services);
                if(check == 1)
                {
                    cout << "Sorry, your enter can not be zero, or less than zero. Please reenter. \n";
                    continue;
                }
                break;
            }
            
            while(1)
            {
                cout << endl << "Enter the medication charges:";
                cin >> medication;
                check = check_input(medication);
                if(check == 1)
                {
                    cout << "Sorry, your enter can not be zero, or less than zero. Please reenter. \n";
                    continue;
                }
                break;
            }

            total = charge(services, medication);
            cout << "The total charge are " << total << endl;
        }
        else
        {
            cout << endl << endl;
            cout << "Sorry, you entered the wrong word, please enter again!" << endl;
            cout << "If you are inpatient ,please print 'i', if you are outpatient, please print 'o'" << endl;
            continue;
        }
        cout << "Thank you!";
        break;
    }

    return 0;
}

int charge(int day, float rate, int services, int medication)
{
    int money = (day*3000 + services + medication) * (1 + rate);
    return money;
    
}

int charge(int services, int medication)
{
    int money = services + medication;
    return money;
    cout << "thank you!";
}

int check_input(float a)
{
    if (a <= 0) return 1;
}
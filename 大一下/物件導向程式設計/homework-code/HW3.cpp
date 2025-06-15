#include<iostream>
using namespace std;

class PatientAccount
{
    private:
        double rate = 1.3;
        int day;
        int charges=0;
    public:
        void set_day(int n)
        {
            day = n;
        }
        int day_charge()
        {
            return 5000 * day * rate;
        }

        void add_charge(int charge)
        {
            charges += charge;
        }
        int display_charge()
        {
            cout << "\n\nThe total charges are " << charges << " dollars.\nPlease pay the money, then you can check out ";
        }

};

class Surgery
{
    private:
        int num;
        int charge;
    public:
        void update_charge(PatientAccount *pa)
        {
            pa->add_charge(charge);
        }
        void set_surgery(int n)
        {
            num = n;
        }
        int surgery_charge()
        {
            switch(num)
            {
                case 1 : 
                        charge = 35000;
                        break;
                case 2 :
                        charge = 30000;
                        break;
                case 3 : 
                        charge = 29000;
                        break;
                case 4 : 
                        charge = 28000;
                        break;
                case 5 : 
                        charge = 10000; 
                        break;
            }
        }
};

class Pharmacy
{
    private:
        int num;
        int charge;
    public:
        void update_charge(PatientAccount *pa)
        {
            pa->add_charge(charge);
        }
        void set_medicine(int n)
        {
            num = n;
        }
        int medicine_charge()
        {
            switch(num)
            {
                case 1 : 
                        charge = 100;
                        break;
                case 2 :
                        charge = 50;
                        break;
                case 3 : 
                        charge = 40;
                        break;
                case 4 : 
                        charge = 70;
                        break;
                case 5 : 
                        charge = 150; 
                        break;
            }
        }
};

int main()
{
    PatientAccount dis;
    Surgery s;
    Pharmacy medicine;
    int day, sur, drug;
    int day_charge;
    double charge = 0;

    cout << "Hello, please input the day you spent in hospital (5000*1.3(rate) dollars/day) : ";
    cin >> day;
    dis.set_day(day);
    day_charge = dis.day_charge();
    dis.add_charge(day_charge);
    cout << endl << endl;
    
    cout << "Please select what surgery you do" << endl 
         << "1.Gastrectomy (35000 dollars)" << endl
         << "2.Appendectomy (30000 dollars)" << endl
         << "3.Circumcision (29000 dollars)" << endl
         << "4.Thymectomy (28000 dollars)" << endl
         << "5.Splenectomy (10000 dollars)" <<endl
         << "What surgery do you do:";
    cin >> sur;
    s.set_surgery(sur);
    s.surgery_charge();
    s.update_charge(&dis);
    cout << endl << endl;

    cout << "Please select what medicine you take(can choose many, if you have made your selection, input 0)" << endl
         << "1.painkiller (100 dollars)" << endl
         << "2.stomach medicine (50 dollars)" << endl
         << "3.antibiotic (40 dollars)" << endl
         << "4.antipyretic (70 dollars)" << endl
         << "5.Vitamin (150 dollars)" <<endl;
    cout << "What medicine do you take:";
    cin >> drug;
    while(drug != 0)
    {
        cout << "What medicine do you take:";
        medicine.set_medicine(drug);
        medicine.medicine_charge();
        medicine.update_charge(&dis);
        cin >> drug;
    }
    dis.display_charge();

    return 0;
}
#include<iostream>
#include<iomanip>
using namespace std;

class Length
{
    private:
        float centimeter;
        float millimeter;
    public:
        Length(float cm=0.0, float mm=0.0)
        {
            centimeter = cm;
            millimeter = mm;
        }
        
        void set(float cm)
        {
            centimeter = cm;
            millimeter = cm * 10.0;
        }

        void get() const
        {
            cout << "Centimeter = " << setprecision(6) << centimeter << " ,Millimeter = " << setprecision(6) << millimeter << endl;
        }

        bool operator==(const Length& other) const
        {
            return centimeter == other.centimeter;
        }

        Length operator+(const Length& other) const 
        {
            float cm = centimeter + other.centimeter;
            float mm = millimeter + other.millimeter;
            return Length(cm, mm);
        }   

        Length operator*(float scalar) const 
        {
            float cm = centimeter * scalar;
            float mm = millimeter * scalar;
            return Length(cm, mm);
        }  

        Length operator*(const Length& other) const 
        {
            float cm = centimeter * other.centimeter;
            float mm = millimeter * other.millimeter;
            return Length(cm, mm);
        }
};

class Rectangle
{
    private:
        Length side1;
        Length side2;
    public:
        void setSides()
        {
            float cm1, cm2;
            cout << "Please input the side1 of the rectangle: ";
            cin >> cm1;
            side1.set(cm1);
            cout << "Please input the side2 of the rectangle: ";
            cin >> cm2;
            side2.set(cm2);
            cout << endl;
        }

        void getSides()
        {
            cout << "side1 : ";
            side1.get();
            cout << "side2 : ";
            side2.get();
        }

        bool is_Square()
        {
            return side1 == side2;
        }

        Length get_Area()
        {
            return side1 * side2;
        }

        Length get_Perimeter()
        {
            return (side1 + side2) * 2.0;
        }
};

int main()
{
    Rectangle rectangle;
    rectangle.setSides();
    rectangle.getSides();
    cout << "Is this rectangle square : " << (rectangle.is_Square() ? "Yes" : "No") << endl;
    cout << "Area : " ;
    rectangle.get_Area().get();
    cout << "Perimeter : " ;
    rectangle.get_Perimeter().get();

    return 0;
}
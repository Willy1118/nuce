#include<iostream>
#include<fstream>
using namespace std;

int item_quantity = 0;

struct inventory
{
    string item_description;
    int Quantity_On_Hand;
    int Wholesale_Cost;
    int Retail_cost;
    string Date;
};

void AddRecord(fstream& file)
{
    inventory item;

    file.seekg(item_quantity * sizeof(item), ios::beg);
    

    cout << "Enter item description: ";
    cin >> item.item_description;
    cout << "Enter quantity on hand: ";
    cin >> item.Quantity_On_Hand;
    cout << "Enter wholesale cost: ";
    cin >> item.Wholesale_Cost;  
    cout << "Enter retail cost: ";
    cin >> item.Retail_cost;   
    cin.ignore();    
    cout << "Enter date added to inventory: ";
    cin >> item.Date;

    item_quantity++;

    file.seekg(item_quantity * sizeof(item), ios::beg);
    file.write(reinterpret_cast<char *>(&item),sizeof(item));

    cout << "Record added successfully." << endl;
}

void DisplayRecord(fstream& file)
{
    inventory item;
    int recNum;

    cout << "Which record do you want to display? ";
    cin >> recNum;

    if(recNum > item_quantity || recNum <= 0)
    {
        cout << "There is no information!\n";
        return;
    }

    file.seekg(recNum * sizeof(item), ios::beg);
    file.read(reinterpret_cast<char *>(&item),sizeof(item));
  
    cout << "Item description: " << item.item_description << endl;
    cout << "Quantity on hand: " << item.Quantity_On_Hand << endl;
    cout << "Wholesale cost: " << item.Wholesale_Cost << endl;
    cout << "Retail cost: " << item.Retail_cost << endl;
    cout << "Date added to inventory: " << item.Date << endl;
}

void ChangeRecord(fstream& file)
{
    inventory item ;
    int recNum;

    cout << "Which record do you want to change? ";
    cin >> recNum;

    if(recNum > item_quantity || recNum <= 0)
    {
        cout << "There is no information!\n";
        return;
    }

    file.seekg((recNum) * sizeof(item), ios::beg);
    file.read(reinterpret_cast<char *>(&item),sizeof(item));
  
    cout << "Item description: " << item.item_description << endl;
    cout << "Quantity on hand: " << item.Quantity_On_Hand << endl;
    cout << "Wholesale cost: " << item.Wholesale_Cost << endl;
    cout << "Retail cost: " << item.Retail_cost << endl;
    cout << "Date added to inventory: " << item.Date << endl << endl;

    cin.ignore();
    char choice;
    cout << "Are you sure to change? (Y/N)";
    cin >> choice;

    if(choice == 'N' || choice == 'n')
    {
        cout << "OK, record won't be changed." << endl;
        return;
    }

    cout << "Enter the new data: " << endl;

    cout << "Enter item description: ";
    cin >> item.item_description;
    cout << "Enter quantity on hand: ";
    cin >> item.Quantity_On_Hand;
    cout << "Enter wholesale cost: ";
    cin >> item.Wholesale_Cost;    
    cout << "Enter retail cost: ";
    cin >> item.Retail_cost;    
    cin.ignore();
    
    cout << "Enter date added to inventory: ";
    cin >> item.Date;

    file.seekg((recNum) * sizeof(item), ios::beg);
    file.write(reinterpret_cast<char *>(&item),sizeof(item));
}

int main()
{
    inventory record;
    fstream inventoryFile("invtry.txt", ios::in | ios::out | ios::binary);

    if(!inventoryFile)
    {
        cout << "Error opening file!";
        return 0;
    }

    int choice;
    
    while (true) {
        cout << "\nMenu:" << endl;
        cout << "1. Add new record" << endl;
        cout << "2. Display record" << endl;
        cout << "3. Change record" << endl;
        cout << "4. Quit" << endl;
        cout << "Enter your choice (1-4): ";
        cin >> choice;
        cout << endl;

        switch(choice)
        {
            case 1:
                cin.ignore();
                AddRecord(inventoryFile);
                break;
            case 2:
                DisplayRecord(inventoryFile);
                break;
            case 3:
                ChangeRecord(inventoryFile);
                break;
            case 4:
                inventoryFile.close();
                return 0;
            default:
                cout << "Invalid choice. Try again." << endl;
                break;
        }
    }
    return 0;
}
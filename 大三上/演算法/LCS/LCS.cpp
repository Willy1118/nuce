#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// 去除字串最前面的0
string Remove_Leading_Zeros(const string &str) {
    int index = 0;
    // 找到第一個非 '0' 的位置
    while (index < str.length() && str[index] == '0') {
        index++;
    }
    // 如果全為 '0'，則回傳 "0"
    if (index == str.length()) {
        return "0";
    }
    // 回傳從第一個非 '0' 字元開始的子字串
    string result = "";
    for (int i = index; i < str.length(); ++i) {
        result += str[i];
    }
    return result;
}

// 比較兩個字串的數值大小，先去除字串最前面的 0
string Find_Max_String(const string &a, const string &b) {
    string clean_a = Remove_Leading_Zeros(a);
    string clean_b = Remove_Leading_Zeros(b);

    if (clean_a.length() > clean_b.length()) return clean_a;
    if (clean_a.length() < clean_b.length()) return clean_b;
    return max(clean_a, clean_b);
}

string Find_LCSI(const string &num1, const string &num2) {
    int len_num1 = num1.length();
    int len_num2 = num2.length();
    string lcsi[51][51]; // 儲存目前的最大共同子整數

    for (int i = 1; i <= len_num1; ++i) {
        for (int j = 1; j <= len_num2; ++j) {
            if (num1[i - 1] == num2[j - 1]) {
                lcsi[i][j] = lcsi[i - 1][j - 1] + num1[i - 1];
            } else {
                lcsi[i][j] = Find_Max_String(lcsi[i - 1][j], lcsi[i][j - 1]);
            }
        }
    }

    return Remove_Leading_Zeros(lcsi[len_num1][len_num2]);
}

int main() {
    string num1, num2;

    while (cin >> num1 >> num2) {
        cout << Find_LCSI(num1, num2) << endl;
    }

    return 0;
}
#include<iostream>
#include<vector>
using namespace std;

struct Point
{
	float a;
	float b;
};

void find_pts(Point p, float d, float x, float &x_sum, float &y_sum)
{
    if(p.a > 0 && p.b > 0)
    {
        x_sum += p.a;
        y_sum += p.b;
    }
	
	if(x < 0) return;
	
    if (!(p.a + d > 0 && p.b + d > 0)) return;

	d = d/2;
	find_pts(Point{p.a+d, p.b+d}, d, x-1, x_sum, y_sum);
	find_pts(Point{p.a+d, p.b-d}, d, x-1, x_sum, y_sum);
	find_pts(Point{p.a-d, p.b+d}, d, x-1, x_sum, y_sum);
	find_pts(Point{p.a-d, p.b-d}, d, x-1, x_sum, y_sum);
}

int main()
{
	float a, b, d, x, x_sum=0, y_sum=0;
	while(cin >> a >> b >> d >> x)
    {
        find_pts(Point{a, b}, d, x, x_sum, y_sum);

        cout << x_sum << " " << y_sum << endl;
        x_sum = 0;
        y_sum = 0;
    }
	
	return 0;
}
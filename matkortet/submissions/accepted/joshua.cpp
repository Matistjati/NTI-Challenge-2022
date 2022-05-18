#include <bits/stdc++.h>

using namespace std;


int main()
{
	string code;
    cin >> code;
    

	cout << fixed << setprecision(15) << pow(1/10., count(code.begin(), code.end(), '.')) << "\n";

	return 0;
}
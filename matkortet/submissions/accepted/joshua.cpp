#include <bits/stdc++.h>

using namespace std;


int main()
{
	int r, c;
	cin >> r >> c;

	vector<string> grid(r);
	
	for (int i = 0; i < r; i++) cin >> grid[i];

    int lanes = 0;
    for (int i = 0; i < c; i++)
    {
        bool works = true;
        for (int j = 0; j < r; j++) if (grid[j][i]=='#') works = false;
        if (works) lanes++;
    }

	cout << lanes << "\n";

	return 0;
}
#include <bits/stdc++.h>

using namespace std;


int main()
{
	int r, c;
	cin >> r >> c;

	vector<string> start(r);
	vector<string> goal(r);

	for (int i = 0; i < r; i++) cin >> start[i];
	for (int i = 0; i < r; i++) cin >> goal[i];

	int differences = 0;
	for (int i = 0; i < r; i++) for (int j = 0; j < c; j++) if (start[i][j] != goal[i][j]) differences++;

	cout << differences << "\n";

	return 0;
}
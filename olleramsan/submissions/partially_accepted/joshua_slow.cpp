#include <bits/stdc++.h>

using namespace std;


int main()
{
	int n, t;
	cin >> n >> t;

	vector<string> items(n);
    for (int i = 0; i < n; i++) cin >> items[i];

    int index = 0;

    for (int i = 0; i < t-1; i++)
    {
        index++;
        if (index==n) index = 0;
    }

    cout << items[index] << "\n";

	return 0;
}
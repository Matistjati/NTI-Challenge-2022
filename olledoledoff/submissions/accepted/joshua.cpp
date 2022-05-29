#include <bits/stdc++.h>

using namespace std;


int main()
{
	int n, t;
	cin >> n >> t;

	vector<string> items(n);
    for (int i = 0; i < n; i++) cin >> items[i];

    cout << items[(t-1)%n] << "\n";

	return 0;
}
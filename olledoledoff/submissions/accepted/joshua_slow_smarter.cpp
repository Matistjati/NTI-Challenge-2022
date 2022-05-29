#include <bits/stdc++.h>

using namespace std;


int main()
{
    int n, t;
    cin >> n >> t;

    vector<string> items(n);
    for (int i = 0; i < n; i++) cin >> items[i];

    int index = t - 1;

    int sz = items.size();
    while (index >= 0)
    {
        index -= sz;
    }
    index += items.size();

    cout << items[index] << "\n";

    return 0;
}
#include <bits/stdc++.h>

using namespace std;


int main()
{
    int s, b, k;
    cin >> s >> b >> k;

    cout << (s*double(b)/60.>=k ? "Destroyed!" : "Spared for now...") << "\n";

    return 0;
}
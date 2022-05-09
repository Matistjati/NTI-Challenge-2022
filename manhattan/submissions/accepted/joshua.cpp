#include <bits/stdc++.h>

using namespace std;


int main()
{
    int n;

    vector<pair<int,int>> cities(n);
    for (int i = 0; i < n; i++)
    {
        int x,y;
        cin >> x >> y;
        cities[i] = {x,y};
    }


    int ans = 0;

    for (int i = 1; i < n; i++)
    {
        ans += abs(cities[i].first-cities[i-1].first)+abs(cities[i].second-cities[i-1].second);
    }

    cout << ans << "\n";

    return 0;
}
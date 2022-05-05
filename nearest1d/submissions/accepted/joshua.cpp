#include <bits/stdc++.h>

using namespace std;


int main()
{
    int n, m;
    cin >> n >> m;

    vector<int> controls(n);
    vector<int> sources(m);

    for (int i = 0; i < n; i++) cin >> controls[i];
    for (int i = 0; i < m; i++) cin >> sources[i];

    vector<pair<int, int>> ans(n, { -1, int(2e9) });

    for (int i = 0; i < n; i++)
    {
        auto it = lower_bound(begin(sources), end(sources), controls[i]);
        if (it != end(sources)) ans[i] = { it - begin(sources), abs(controls[i] - *it) };
        if (it != begin(sources) && abs(controls[i] - *prev(it)) < ans[i].second) ans[i] = { prev(it) - begin(sources), abs(controls[i] - *prev(it)) };

    }

    for (int i = 0; i < n; i++)
    {
        cout << ans[i].first << " ";
    }

    cout << "\n";

    return 0;
}
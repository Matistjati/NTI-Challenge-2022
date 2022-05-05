#include <bits/stdc++.h>

using namespace std;


int main()
{
    int n, m;
    cin >> n >> m;


    set<int> seen;

    queue<pair<int, int>> q;

    map<int, int> controls;
    for (int i = 0; i < n; i++)
    {
        int control;
        cin >> control;
        controls[control] = i;
    }
    for (int i = 0; i < m; i++)
    {
        int origin;
        cin >> origin;
        q.emplace(origin, i);
    }

    vector<int> ans(n, -1);

    while (q.size())
    {
        pair<int, int> curr = q.front();
        q.pop();

        if (seen.count(curr.first)) continue;
        seen.insert(curr.first);

        if (curr.first < 0 || curr.first >(*prev(end(controls))).first) continue;

        if (controls.count(curr.first) && ans[controls[curr.first]] == -1) ans[controls[curr.first]] = curr.second;
        q.emplace(curr.first - 1, curr.second);
        q.emplace(curr.first + 1, curr.second);
    }

    for (int i = 0; i < n; i++)
    {
        cout << ans[i] << " ";
    }

    cout << "\n";

    return 0;
}
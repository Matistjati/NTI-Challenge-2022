#include <bits/stdc++.h>

using namespace std;


int main()
{
    int n, l, h;
    cin >> n >> l >> h;

    int s = 0;
    int num = 0;
    for (int i = 0; i < n; i++)
    {
        int v;
        cin >> v;
        if (v>=l&&v<=h)
        {
            s += v;
            num += 1;
        }
    }
    
    cout << fixed << setprecision(15) << (double(s)/num) << "\n";

    return 0;
}
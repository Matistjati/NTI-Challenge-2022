#include "validate.h"

#include <bits/stdc++.h>
using namespace std;

#define rep(i, a, b) for(int i = a; i < (b); ++i)
#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
#define debug(...) //ignore
typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef long double ld;

int main(int argc, char **argv)
{
    init_io(argc, argv);

    int n;
    judge_in >> n;

    vector<pair<ll,ll>> cities(n);
    for (int i = 0; i < n; i++)
    {
        ll x,y;
        judge_in >> x >> y;
        cities[i] = {x,y};
    }


    ll ans = 0;

    for (int i = 1; i < n; i++)
    {
        ans += abs(cities[i].first-cities[i-1].first)+abs(cities[i].second-cities[i-1].second);
    }

    assert(ans < int(2e9));

    ll user_ans;
    if (!(author_out >> user_ans)) wrong_answer("No output");

    if (user_ans > int(2e9)) wrong_answer("too large ans");

    string trailing;
    if(author_out >> trailing) wrong_answer("Trailing output");

    accept();
}

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

    int n, m;
    judge_in >> n >> m;

    vector<int> controls(n);
    vector<int> sources(m);

    for (int i = 0; i < n; i++) judge_in >> controls[i];
    for (int i = 0; i < m; i++) judge_in >> sources[i];

    vector<set<int>> ans(n);

    for (int i = 0; i < n; i++)
    {
        auto it = lower_bound(begin(sources), end(sources), controls[i]);
        if (it != end(sources)) ans[i].insert(it-begin(sources));
        if (it != begin(sources)) ans[i].insert(prev(it)-begin(sources));
    }

    int k;
    vi user_ans(n);
    for (int i = 0; i < n; i++)
    {
        if(!(author_out >> user_ans[i])) wrong_answer("Expected more output");
        if (user_ans[i] < 0 || user_ans[i] > n) wrong_answer("Answer outside of valid 0,n");
        if (!ans[i].count(user_ans[i])) wrong_answer("Wrong answer");
    }
    
        


    string trailing;
    if(author_out >> trailing) wrong_answer("Trailing output");

    accept();
}

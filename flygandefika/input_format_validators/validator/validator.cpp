#include "validator.h"

#include <bits/stdc++.h>
using namespace std;


void run()
{
    int highest_c = Arg("max_l");
	int n = Int(1, Arg("max_n")); Space();
    int m = Int(1, Arg("max_m")); Endl();

    int prev = -1;
    set<int> seen;
    for (int i = 0; i < n; i++)
    {
        int co = Int(0, highest_c);
        assert(co>prev);
        prev = co;
        assert(seen.count(co)==0);
        seen.insert(co);
        Space();
    }

    Endl();

    seen = set<int>();
    prev = -1;
    for (int i = 0; i < m; i++)
    {
        int co = Int(0, highest_c);
        assert(co>prev);
        prev = co;
        assert(seen.count(co)==0);
        seen.insert(co);
        Space();
    }

    Endl();

	Eof();
}

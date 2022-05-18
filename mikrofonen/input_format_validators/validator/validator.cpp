#include "validator.h"

#include <bits/stdc++.h>
using namespace std;


void run()
{
	int n = Int(1, Arg("max_n")); Space();
    int l = Int(20, 300); Space();
    int h = Int(20, 300); Endl();

    assert(l<=h);

    int good = 0;
    for (int i = 0; i < n; i++)
    {
        int v = Int(int(-1e9), int(1e9));
        if (v>=l&&v<=h) good++;
        
        Space();
    }
    assert(good>0);

    Endl();
	Eof();
}

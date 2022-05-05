#include "validator.h"

#include <bits/stdc++.h>
using namespace std;


void run()
{
    int highest_c = Arg("max_c");
	int n = Int(1, Arg("max_n")); Space();
    int m = Int(1, Arg("max_m")); Endl();

    for (int i = 0; i < n; i++)
    {
        int co = Int(0, highest_c);
        Space();
    }

    Endl();

    for (int i = 0; i < m; i++)
    {
        int co = Int(0, highest_c);
        Space();
    }

    Endl();

	Eof();
}

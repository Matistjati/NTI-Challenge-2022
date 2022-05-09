#include "validator.h"

#include <bits/stdc++.h>
using namespace std;


void run()
{
	int n = Int(1, Arg("max_n")); Endl();
    int max_coord = Arg("max_c");

    
    for (int i = 0; i < n; i++)
    {
        int x = Int(-max_coord, max_coord); Space();
        int y = Int(-max_coord, max_coord); Endl();
        
    }

	Eof();
}

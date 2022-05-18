#include "validator.h"

#include <bits/stdc++.h>
using namespace std;

void ReadLn(int len) {

	for (int j = 0; j < len; j++) {
		char ch = Char();
	}
	Endl();
}

void run()
{
	int r = Int(1, Arg("max_r")); Space();
    int c = Int(1, Arg("max_c")); Endl();
    assert(c>=r*3);

    for (int i = 0; i < r; i++)
    {
        ReadLn(c);
    }


	Eof();
}

#include "validator.h"

#include <bits/stdc++.h>
using namespace std;

void ReadLn(int len, bool twoChars) {

	for (int j = 0; j < len; j++) {
		char ch = Char();
        if (twoChars)
        {
            assert(ch=='.'||ch=='#');
        }
	}
	Endl();
}

void run()
{
    bool twoChars = Arg("two_chars");
	int r = Int(1, Arg("max_r")); Space();
    int c = Int(1, Arg("max_c")); Endl();


    for (int i = 0; i < r*2; i++)
    {
        ReadLn(c, twoChars);
    }


	Eof();
}

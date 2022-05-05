#include "validator.h"

#include <bits/stdc++.h>
using namespace std;

void ReadWord(int max_len)
{
	int n = 0;
	while (Char() != ' ') {n++;}
	assert(n<=max_len+1);
}

void run()
{
    int l = Arg("max_l");
	int n = Int(1, Arg("max_n")); Space();
    int t = Int(1, Arg("max_t")); Endl();

    for (int i = 0; i < n; i++)
    {
        ReadWord(l);
    }

    Endl();
	Eof();
}

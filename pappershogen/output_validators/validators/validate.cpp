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

void flip(ll r);

string getans();


ll n;
ll sa;
vector<deque<bool> > blocks;
vector<bool> flipped;
vector<ll> sizes;

int main(int argc, char **argv)
{
    init_io(argc, argv);

    int n;
    judge_in >> n;


    string tc;
    judge_in >> tc;
    

    
    int m;
    if (!(author_out >> m)) wrong_answer("Expected more output on num moves");
    
    if (m == 1)
    {
        int move;
        if (!(author_out >> move)) wrong_answer("Expected a move m=1");
        if (move < 1 || move > n) wrong_answer("Move m=1 outside of range");
        for (int i = 0; i < move; i++)
        {
            tc[i] = tc[i] == 'N' ? 'U' : 'N';
        }
        
    }
    else if (m>1)
    {
        if (m > int(5e5)) wrong_answer("Too many moves");

        vector<int> moves(m);

        for (int i = 0; i < m; i++)
        {
            if(!(author_out >> moves[i])) wrong_answer(("Expected more output on "+to_string(i)).c_str());
            if (moves[i] < 1 || moves[i] > n) wrong_answer(("Answer outside of valid (1,n):"+to_string(moves[i])+", m:" +to_string(m)+"\n").c_str());
        }
        
        string trailing;
        if(author_out >> trailing) wrong_answer(("Trailing output"+trailing+", m:" +to_string(m)).c_str());


        sa = 0;
        for (; (sa + 1) * (sa + 1) < n; sa++) {} // Calculating the floor(sqrt(n))

        for (ll i = 0; i < sa; i++) {
            blocks.push_back(deque<bool>());
            flipped.push_back(false);
            sizes.push_back(sa);
        }

        for (ll i = 0; i < n - (sa * sa); i++) { // Ah yes, the bug that python simply solves at runtime...
            sizes[((sa * sizes.size()) - 1 - i) % (sizes.size())]++;
        }

        ll index = 0;
        for (ll i = 0; i < sizes.size(); i++) {
            for (ll j = 0; j < sizes[i]; j++) {
                blocks[i].push_back(bool(tc[index] == 'U')); // Reading input :)
                index++;
            }
        }

        for (ll i = 0; i < m; i++) { // Add security checks here if u need it in this code
            flip(moves[i]);
        }

        tc = getans();
    }
    
    bool solved = true;
    for (int i = 0; i < tc.size(); i++)
    {
        if (tc[i]!='U')
        {
            solved=false;
        }
    }
    
    if (solved)
    {
        accept();
    }
    else
    {
        wrong_answer(("Didnt solve, m:" +to_string(m) + ", tc:" + tc).c_str());
    }


    

}


void flip(ll r) {
    if (r == n) {
        rep(i, 0, flipped.size()) { flipped[i] = !flipped[i]; } // Not-ing everything
        rep(i, 0, ll(blocks.size() / 2)) { // Flipping everything
            blocks[i].swap(blocks[blocks.size() - 1 - i]);
            swap(flipped[i], flipped[flipped.size() - 1 - i]);
            swap(sizes[i], sizes[sizes.size() - 1 - i]);
        }
        //cout << "flip 501 (out of 501) actually didn't cause this error..." << endl;
        // It seems to be the print(501); tha causes the segfault
    }
    else {

        ll right_index = 0;
        ll right_size = 0;
        while (right_index < sizes.size()) { // Finding the right index for the rest of the code O(sqrt(n))
            if (right_size + sizes[right_index] <= r) {
                right_index++;
                right_size += sizes[right_index - 1];
            }
            else { break; }
        }
        //cout << right_index << " " << right_size << " " << r << endl;

        vi slice;
        slice.clear();
        if (flipped[right_index]) {
            rep(i, 0, r - right_size) {
                slice.push_back(blocks[right_index].back());
                blocks[right_index].pop_back();
            }
        }
        else {
            rep(i, 0, r - right_size) {
                slice.push_back(!blocks[right_index].front());
                blocks[right_index].pop_front();
            }
        }
        sizes[right_index] = blocks[right_index].size();

        rep(i, 0, right_index) {
            flipped[i] = !flipped[i];
        }
        //cout << slice.size() << endl;
        rep(i, 0, ll(right_index / 2)) {
            blocks[i].swap(blocks[right_index - 1 - i]);
            swap(flipped[i], flipped[right_index - 1 - i]);
            swap(sizes[i], sizes[right_index - 1 - i]);
        }

        if (flipped[0]) {
            rep(i, 0, r - right_size) {
                blocks[0].push_back(!slice[slice.size() - 1 - i]);
            }
        }
        else {
            rep(i, 0, r - right_size) {
                blocks[0].push_front(slice[i]);
            }
        }
        sizes[0] = blocks[0].size();
    }
}

string getans()
{
    string res = "";
     for(ll i = 0; i < sizes.size(); i++) {
        if (flipped[i]) {
            for(ll j = sizes[i]; j > 0; j--) {
                res += !blocks[i][j-1];
            }
        } else {
            for(ll j = 0; j < sizes[i]; j++) {
                res += blocks[i][j];
            }
        }
    }

    for (int i = 0; i < res.size(); i++)
    {
        res[i] = res[i] ? 'U' : 'N';
    }

    return res;
}
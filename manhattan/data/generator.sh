#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_n=5 max_c=3000
sample_manual 1
sample_manual 2

# Two
group group1 15
limits max_n=2 max_c=1000000000
tc g1-1 gen_random n=2 max=1000000000 min=-1000000000 y_zero=0 seed=9808074
tc g1-2 gen_random n=2 max=1000000000 min=-1000000000 y_zero=0 seed=345743
tc g1-3 gen_random n=2 max=1000000000 min=-1000000000 y_zero=0 seed=76596749
tc g1-4 gen_random n=2 max=1000000000 min=-1000000000 y_zero=0 seed=3567864

# Y zero
group group2 25
limits max_n=100000 max_c=1000000000
tc g2-1 gen_random n=100000 max=1000 min=0 y_zero=1 seed=9765836
tc g2-2 gen_random n=100000 max=1000 min=0 y_zero=1 seed=653823
tc g2-3 gen_random n=100000 max=1000 min=0 y_zero=1 seed=2457457
tc g2-4 gen_random n=100000 max=1000 min=0 y_zero=1 seed=97764
tc g2-5 gen_random n=100000 max=1000 min=0 y_zero=1 seed=567467
tc g2-6 gen_random n=100000 max=1000 min=0 y_zero=1 seed=7698567

# Full
group group3 60
include_group group1
include_group group2
limits max_n=100000 max_c=1000000000
tc g3-1 gen_random n=100000 max=1000 min=-1000 y_zero=0 seed=35767453
tc g3-2 gen_random n=100000 max=1000 min=-1000 y_zero=0 seed=78462
tc g3-3 gen_random n=100000 max=1000 min=-1000 y_zero=0 seed=1344255
tc g3-4 gen_random n=100000 max=1000 min=-1000 y_zero=0 seed=8736523
tc g3-5 gen_random n=100000 max=1000 min=-1000 y_zero=0 seed=24685865
tc g3-6 gen_random n=100000 max=1000 min=-1000 y_zero=0 seed=24579667

#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_r=5 max_c=5 two_chars=0
sample_manual 1
sample_manual 2

# 1x1
group group1 20
limits max_r=1 max_c=1 two_chars=0
tc g1-1 gen_random r=1 c=1 two_chars=0 error_rate=1 seed=69
tc g1-2 gen_random r=1 c=1 two_chars=0 error_rate=0 seed=69
tc g1-3 gen_random r=1 c=1 two_chars=0 error_rate=1 seed=420
tc g1-4 gen_random r=1 c=1 two_chars=0 error_rate=0 seed=420

# Two chars
group group2 30
limits max_r=1000 max_c=1000 two_chars=1
tc g2-1 gen_random r=1 c=1 two_chars=1 error_rate=1 seed=10
tc g2-2 gen_random r=1 c=1 two_chars=1 error_rate=1 seed=420
tc g2-3 gen_random r=100 c=100 two_chars=1 error_rate=0.69 seed=534757
tc g2-4 gen_random r=1000 c=1000 two_chars=1 error_rate=0 seed=3467689
tc g2-5 gen_random r=1000 c=1000 two_chars=1 error_rate=1 seed=4545743
tc g2-6 gen_random r=1000 c=1000 two_chars=1 error_rate=0.6 seed=6854235
tc g2-7 gen_random r=17 c=999 two_chars=1 error_rate=0.2 seed=457345
tc g2-8 gen_random r=789 c=156 two_chars=1 error_rate=0.5 seed=4655688

# 100x100
group group3 20
include_group group1
limits max_r=100 max_c=100 two_chars=0
tc g3-1 gen_random r=100 c=100 two_chars=0 error_rate=0.69 seed=34567457
tc g3-2 gen_random r=100 c=100 two_chars=0 error_rate=0.23 seed=4576896
tc g3-3 gen_random r=75 c=1 two_chars=0 error_rate=1 seed=238787
tc g3-4 gen_random r=1 c=89 two_chars=0 error_rate=0.5 seed=9456812

# 1000x1000
group group4 30
include_group group1
include_group group2
include_group group3
limits max_r=1000 max_c=1000 two_chars=0
tc g4-1 gen_random r=1000 c=1000 two_chars=0 error_rate=0.64 seed=238532875
tc g4-2 gen_random r=123 c=1000 two_chars=0 error_rate=0.2 seed=65487568
tc g4-3 gen_random r=1000 c=912 two_chars=0 error_rate=0.92 seed=7126768
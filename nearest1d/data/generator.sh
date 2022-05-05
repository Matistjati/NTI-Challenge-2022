#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_r=10 max_c=15
sample_manual 1
sample_manual 2

# Empty
group group1 10
limits max_r=1000 max_c=1000
tc g1-1 gen_random r=100 c=350 percent_trees=0 seed=69
tc g1-2 gen_random r=333 c=1000 percent_trees=0 seed=69
tc g1-3 gen_random r=250 c=892 percent_trees=0 seed=69
tc g1-4 gen_random r=1 c=999 percent_trees=0 seed=69

# One row
group group2 20
limits max_r=1 max_c=1000
tc g2-1 gen_random r=1 c=4   percent_trees=0     seed=13461346
tc g2-2 gen_random r=1 c=100 percent_trees=0.123 seed=324576742
tc g2-3 gen_random r=1 c=269 percent_trees=0.53  seed=53536854757
tc g2-4 gen_random r=1 c=859 percent_trees=0.32  seed=13463416
tc g2-5 gen_random r=1 c=999 percent_trees=0.68  seed=3568563
tc g2-6 gen_random r=1 c=375 percent_trees=0.45  seed=3568674
tc g2-7 gen_random r=1 c=385 percent_trees=0.9   seed=6582321
tc g2-8 gen_random r=1 c=924 percent_trees=1     seed=457452

# Full
group group3 70
limits max_r=1000 max_c=1000
include_group group1
include_group group2
tc g3-1 gen_random r=123 c=985  percent_trees=0.01  seed=124571457
tc g3-2 gen_random r=333 c=1000 percent_trees=0.005 seed=35683856
tc g3-3 gen_random r=250 c=879  percent_trees=0.01  seed=2453246
tc g3-4 gen_random r=200 c=690  percent_trees=0.02  seed=1342613524
tc g3-5 gen_random r=24 c=500   percent_trees=0.05  seed=4356783
tc g3-6 gen_random r=69 c=539   percent_trees=0.06  seed=24572475
tc g3-7 gen_random r=290 c=950  percent_trees=0.002 seed=2455472
tc g3-8 gen_random r=150 c=792  percent_trees=0.01  seed=5634885
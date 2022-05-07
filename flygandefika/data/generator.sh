#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_n=5 max_m=5 max_l=25
sample_manual 1
sample_manual 2

# All left
group group1 15
limits max_n=100000 max_m=100000 max_l=1000000000
tc g1-1 gen_random left=1 l=1000000000 n=100000 m=100000 seed=69
tc g1-2 gen_random left=1 l=1000000000 n=5000 m=100000 seed=23456245
tc g1-3 gen_random left=1 l=1000000000 n=100000 m=5000 seed=5386635
tc g1-4 gen_random left=1 l=1000000000 n=10 m=20 seed=68521435

# Small l
group group2 15
limits max_n=1 max_m=100000 max_l=1000000000
tc g2-1 gen_random left=0 l=1000000000 n=1 m=20 seed=42457
tc g2-2 gen_random left=0 l=1000000000 n=1 m=100000 seed=2345245245
tc g2-3 gen_random left=0 l=1000000000 n=1 m=100000 seed=54768468
tc g2-4 gen_random left=0 l=1000000000 n=1 m=5000 seed=456824524
tc g2-5 gen_random left=0 l=1000000000 n=1 m=69696 seed=245753568
tc g2-6 gen_random left=0 l=1000000000 n=1 m=100000 seed=365341135

# Small l
group group3 30
limits max_n=100000 max_m=100000 max_l=500000
tc g3-1 gen_random left=0 l=500000 n=10 m=20 seed=245756
tc g3-2 gen_random left=0 l=500000 n=100000 m=100000 seed=36365
tc g3-3 gen_random left=0 l=500000 n=5000 m=100000 seed=35683568
tc g3-4 gen_random left=0 l=500000 n=100000 m=5000 seed=467946792
tc g3-5 gen_random left=0 l=500000 n=69696 m=69696 seed=357635
tc g3-6 gen_random left=0 l=499999 n=100000 m=100000 seed=357635

# Full
group group4 40
include_group group1
include_group group2
include_group group3
limits max_n=100000 max_m=100000 max_l=1000000000
tc g4-1 gen_random left=0 l=1000000000 n=100000 m=100000 seed=3144631
tc g4-2 gen_random left=0 l=1000000000 n=5000 m=100000 seed=2453245
tc g4-3 gen_random left=0 l=1000000000 n=100000 m=5000 seed=24572457
tc g4-4 gen_random left=0 l=1000000000 n=10 m=20 seed=46784876
tc g4-5 gen_random left=0 l=1000000000 n=69696 m=69696 seed=2457854
tc g4-6 gen_random left=0 l=1000000000 n=100000 m=100000 seed=356486853

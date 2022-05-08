#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_s=1000 max_b=300 max_k=10000
sample_manual 1
sample_manual 2

# B=120
group group1 50
limits max_s=1000 max_b=120 max_k=10000
tc g1-1 gen_random b120=1 s=1000 b=120 k=1000 seed=124468347
tc g1-2 gen_random b120=1 s=500 b=120 k=1000 seed=31463465
tc g1-3 gen_random b120=1 s=2 b=120 k=1000 seed=31463465
tc g1-4 gen_random b120=1 s=666 b=120 k=1000 seed=457234527
tc g1-5 gen_random b120=1 s=666 b=120 k=1000 seed=7649467
tc g1-6 gen_random b120=1 s=10  b=120 k=500 seed=786674


# Full
group group2 50
include_group group1
limits max_s=1000 max_b=300 max_k=10000
tc g2-1 gen_random b120=0 s=1000 b=300 k=10000 seed=2457325
tc g2-2 gen_random b120=0 s=1000 b=300 k=1000 seed=21341
tc g2-3 gen_random b120=0 s=1000 b=300 k=2000 seed=3685386
tc g2-4 gen_random b120=0 s=1000 b=300 k=4000 seed=435975
tc g2-5 gen_random b120=0 s=1000 b=300 k=8000 seed=254134413
tc g2-6 gen_random b120=0 s=1000 b=300 k=6969 seed=4268675
tc g2-7 gen_random b120=0 s=1000 b=300 k=100 seed=568457
tc g2-8 gen_random b120=0 s=1000 b=300 k=200 seed=24425586
tc g2-9 gen_random b120=0 s=1000 b=300 k=400 seed=134134

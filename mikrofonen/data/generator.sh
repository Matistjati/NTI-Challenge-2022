#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_n=5
sample_manual 1
sample_manual 2

# n=1
group group1 15
limits max_n=1
tc g1-1 gen_random n=1 l=30 h=140 within=0 seed=69
tc g1-2 gen_random n=1 l=100 h=180 within=0 seed=36735
tc g1-3 gen_random n=1 l=150 h=150 within=0 seed=35696
tc g1-4 gen_random n=1 l=200 h=201 within=0 seed=53646
tc g1-5 gen_random n=1 l=250 h=270 within=0 seed=760783


# All within
group group2 30
limits max_n=10000
tc g2-1 gen_random n=10 l=30 h=140  within=1 seed=235789
tc g2-2 gen_random n=100 l=100 h=180 within=1 seed=47563
tc g2-3 gen_random n=1000 l=150 h=150 within=1 seed=47976
tc g2-4 gen_random n=10000 l=200 h=201 within=1 seed=7876436
tc g2-5 gen_random n=197 l=250 h=270 within=1 seed=2456245
tc g2-6 gen_random n=6969 l=20 h=30   within=1 seed=4257524

# Full
group group3 55
include_group group1
include_group group2
limits max_n=10000
tc g3-1 gen_random n=10000 l=40 h=220  within=0 seed=76963552
tc g3-2 gen_random n=6972 l=90 h=297 within=0 seed=24576
tc g3-3 gen_random n=9789 l=50 h=237 within=0 seed=134624556
tc g3-4 gen_random n=2456 l=25 h=299 within=0 seed=764357
tc g3-5 gen_random n=5358 l=290 h=291 within=0 seed=2456876
tc g3-6 gen_random n=3496 l=57 h=58   within=0 seed=425712

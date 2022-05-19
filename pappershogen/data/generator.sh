#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution john.py

compile gen_random.py


# Sample
samplegroup
limits max_n=5
sample_manual 1
sample_manual 2

# N=1
group group1 10
limits max_n=1
tc_manual manual/g1/g1-manual-1.in
tc_manual manual/g1/g1-manual-2.in

# N=10 max 5 moves
group group2
limits max_n=10
include_group sample
include_group group1
tc_manual manual/g2/g2-manual-1.in
tc_manual manual/g2/g2-manual-2.in
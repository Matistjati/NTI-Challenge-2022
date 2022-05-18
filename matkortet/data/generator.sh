#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
sample_manual 1
sample_manual 2

# One wrong
group group1 15
tc g1-1 gen_random wrong=1 seed=45723425
tc g1-2 gen_random wrong=1 seed=769876
tc g1-3 gen_random wrong=1 seed=35673
tc g1-4 gen_random wrong=1 seed=13245
tc g1-5 gen_random wrong=1 seed=87643


# Full
group group2 85
include_group group1
tc g2-1 gen_random wrong=0 seed=69
tc g2-2 gen_random wrong=1 seed=4575742
tc g2-3 gen_random wrong=2 seed=2435754
tc g2-4 gen_random wrong=3 seed=67963
#!/usr/bin/env bash

REQUIRE_SAMPLE_REUSE=0

PPATH=$(realpath ..)
. ../../testdata_tools/gen.sh

use_solution joshua.py

compile gen_random.py


# Sample
samplegroup
limits max_n=5 max_t=1000000000 max_l=10
sample_manual 1
sample_manual 2
sample_manual 3

# One word
group group1 10
limits max_n=1 max_t=2000000000 max_l=10
tc g1-1 gen_random n=1 t=1 l=10 seed=69
tc g1-2 gen_random n=1 t=166207645 l=8 seed=69
tc g1-3 gen_random n=1 t=283843347 l=5 seed=3455476
tc g1-4 gen_random n=1 t=295486812 l=1 seed=45685634
tc g1-5 gen_random n=1 t=537874965 l=1 seed=2357865
tc g1-6 gen_random n=1 t=547127247 l=1 seed=3486523
tc g1-7 gen_random n=1 t=2000000000 l=10 seed=5473141

# Brute force
group group2 40
limits max_n=10000 max_t=10000000 max_l=10
tc g2-1 gen_random n=10000 t=4460077 l=10 seed=69420
tc g2-2 gen_random n=9243 t=6991684  l=1 seed=3737564
tc g2-3 gen_random n=8763 t=6271585  l=2 seed=4678946
tc g2-4 gen_random n=7000 t=5852451  l=3 seed=3245673576
tc g2-5 gen_random n=69 t=4639618    l=4 seed=2345742735
tc g2-6 gen_random n=677 t=2052823   l=5 seed=24572574
tc g2-7 gen_random n=3468 t=3276833  l=6 seed=5789255
tc g2-8 gen_random n=10000 t=5140917 l=7 seed=458561
tc g2-9 gen_random n=10000 t=8313889 l=8 seed=568213234
tc g2-10 gen_random n=10000 t=2712997 l=9 seed=2145856

# Modulo
group group3 50
limits max_n=10000 max_t=2000000000 max_l=10
include_group group1
include_group group2
tc g3-1 gen_random n=10000 t=2000000000 l=10 seed=2457245
tc g3-2 gen_random n=2647 t=252978587 l=10 seed=12345675
tc g3-3 gen_random n=5235 t=853996884 l=10 seed=2345246
tc g3-4 gen_random n=6553 t=179051461 l=10 seed=1235523
tc g3-5 gen_random n=7833 t=224098888 l=10 seed=2357523
tc g3-6 gen_random n=7123 t=873541185 l=9 seed=2547457
tc g3-7 gen_random n=6969 t=507374651 l=9 seed=4768467
tc g3-8 gen_random n=2252 t=908716573 l=9 seed=24572457
tc g3-9 gen_random n=2556 t=262667442 l=9 seed=4679679
tc g3-10 gen_random n=5970 t=958709819 l=9 seed=46796749
tc g3-11 gen_random n=2 t=2000000000 l=9 seed=873658
tc g3-12 gen_random n=3 t=2000000000 l=9 seed=46759421
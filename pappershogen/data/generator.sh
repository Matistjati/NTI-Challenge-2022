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
tc g1-1 gen_random n=0 mtc=10 seed=0
tc g1-2 gen_random n=0 mtc=11 seed=0

# N=10 max 5 moves
group group2 20
include_group sample
include_group group1
limits max_n=10
tc g2-1 gen_random  n=0 mtc=20 seed=0
tc g2-2 gen_random  n=0 mtc=21 seed=0
tc g2-3 gen_random  n=10 max_moves=5 seed=69
tc g2-4 gen_random  n=9  max_moves=5 seed=54542745
tc g2-5 gen_random  n=8  max_moves=5 seed=4586654
tc g2-6 gen_random  n=7  max_moves=5 seed=876232
tc g2-7 gen_random  n=6  max_moves=5 seed=7698765
tc g2-8 gen_random  n=5  max_moves=5 seed=245587
tc g2-9 gen_random  n=4  max_moves=5 seed=587913413
tc g2-10 gen_random n=3  max_moves=5 seed=7608734
tc g2-11 gen_random n=2  max_moves=5 seed=24588946
tc g2-12 gen_random n=10 max_moves=3 seed=2134654265
tc g2-13 gen_random n=10 max_moves=3 seed=679746542
tc g2-14 gen_random n=10 max_moves=3 seed=3412684
tc g2-15 gen_random n=10 max_moves=3 seed=7846763
tc g2-16 gen_random n=10 max_moves=3 seed=134243
tc g2-17 gen_random n=10 max_moves=3 seed=576834
tc g2-18 gen_random n=10 max_moves=3 seed=13463124
tc g2-19 gen_random n=10 max_moves=3 seed=23434567675
tc g2-20 gen_random n=10 max_moves=3 seed=3245423
tc g2-21 gen_random n=10 max_moves=3 seed=132436
tc g2-22 gen_random n=10 max_moves=3 seed=3658765

# 2 Wrong
group group3 10
include_group group1
limits max_n=100000
tc g3-1 gen_random  n=0 mtc=30 seed=0
tc g3-2 gen_random  n=0 mtc=31 seed=0
tc g3-3 gen_random  n=0 mtc=32 seed=0
tc g3-4 gen_random  n=100000 max_error=2 seed=376536
tc g3-5 gen_random  n=100000 max_error=2 seed=35684687
tc g3-6 gen_random  n=100000 max_error=2 seed=484673
tc g3-7 gen_random  n=100000 max_error=2 seed=23453546
tc g3-8 gen_random  n=100000 max_error=2 seed=35676484
tc g3-9 gen_random  n=100000 max_error=2 seed=2452376
tc g3-10 gen_random n=60000  max_error=1 seed=4768476
tc g3-11 gen_random n=60000  max_error=1 seed=2453657
tc g3-12 gen_random n=60000  max_error=1 seed=4768354
tc g3-13 gen_random n=60000  max_error=1 seed=245863
tc g3-14 gen_random n=60000  max_error=1 seed=36577864
tc g3-15 gen_random n=90009  max_error=1 seed=24536
tc g3-16 gen_random n=90009  max_error=1 seed=36784
tc g3-17 gen_random n=90009  max_error=1 seed=36843
tc g3-18 gen_random n=90009  max_error=0 seed=3654786
tc g3-19 gen_random n=90009  max_error=0 seed=3465878
tc g3-20 gen_random n=90009  max_error=0 seed=35847
tc g3-21 gen_random n=90009  max_error=0 seed=36345
tc g3-22 gen_random n=90009  max_error=0 seed=33663


# Odd-even
group group4 10
include_group group1
limits max_n=100000
tc g4-1 gen_random  n=0 mtc=40 seed=0
tc g4-2 gen_random  n=0 mtc=41 seed=0
tc g4-3 gen_random  n=0 mtc=42 seed=0
tc g4-4 gen_random  n=100000 odd_even=1 seed=14331246
tc g4-5 gen_random  n=100000 odd_even=1 seed=452536
tc g4-6 gen_random  n=100000 odd_even=1 seed=245653
tc g4-7 gen_random  n=100000 odd_even=1 seed=35656373675
tc g4-8 gen_random  n=100000 odd_even=1 seed=32647356
tc g4-9 gen_random  n=100000 odd_even=1 seed=474476
tc g4-10 gen_random n=60000  odd_even=1 seed=467886798597
tc g4-11 gen_random n=60000  odd_even=1 seed=47436
tc g4-12 gen_random n=60000  odd_even=1 seed=245367
tc g4-13 gen_random n=60000  odd_even=1 seed=76458795
tc g4-14 gen_random n=60000  odd_even=2 seed=454678
tc g4-15 gen_random n=90009  odd_even=2 seed=3654786
tc g4-16 gen_random n=90009  odd_even=2 seed=476476
tc g4-17 gen_random n=90009  odd_even=2 seed=24527
tc g4-18 gen_random n=90009  odd_even=2 seed=25488437
tc g4-19 gen_random n=90009  odd_even=2 seed=2546385
tc g4-20 gen_random n=90009  odd_even=2 seed=34876847
tc g4-21 gen_random n=90009  odd_even=2 seed=4784786
tc g4-22 gen_random n=90009  odd_even=2 seed=1234245

# n <= 1000
group group5 20
include_group sample
include_group group1
include_group group2
limits max_n=1000
tc g5-1 gen_random  n=1000 seed=35678365
tc g5-2 gen_random  n=1000 seed=3456245
tc g5-3 gen_random  n=1000 seed=2453658637585
tc g5-4 gen_random  n=1000 seed=8579678
tc g5-5 gen_random  n=1000 seed=2354653
tc g5-6 gen_random  n=1000 seed=4678467
tc g5-7 gen_random  n=1000 seed=4678674
tc g5-8 gen_random  n=1000 seed=2452457
tc g5-9 gen_random  n=1000 seed=567899587
tc g5-10 gen_random n=500  seed=68759578
tc g5-11 gen_random n=500  seed=238792387
tc g5-12 gen_random n=500  seed=3245673564
tc g5-13 gen_random n=500  seed=467245
tc g5-14 gen_random n=696  seed=356753647
tc g5-15 gen_random n=696  seed=134453
tc g5-16 gen_random n=696  seed=46735367
tc g5-17 gen_random n=696  seed=635653
tc g5-18 gen_random n=696  seed=47684
tc g5-19 gen_random n=696  seed=36546573
tc g5-20 gen_random n=696  seed=24554
tc g5-21 gen_random n=696  seed=746846
tc g5-22 gen_random n=696  seed=254678

# n <= 10^5
group group6 30
include_group sample
include_group group1
include_group group2
include_group group5
limits max_n=100000
tc g6-1 gen_random  n=100000 prob_right=100 seed=36577635
tc g6-2 gen_random  n=100000 prob_right=0   seed=356324
tc g6-3 gen_random  n=100000 prob_right=10  seed=1345342
tc g6-4 gen_random  n=100000 prob_right=20  seed=45677649
tc g6-5 gen_random  n=100000 prob_right=30  seed=1345341
tc g6-6 gen_random  n=100000 prob_right=40  seed=44684
tc g6-7 gen_random  n=100000 prob_right=50  seed=356735467
tc g6-8 gen_random  n=100000 prob_right=60  seed=2456245
tc g6-9 gen_random  n=100000 prob_right=70  seed=4764786
tc g6-10 gen_random n=60000  prob_right=80  seed=24536574
tc g6-11 gen_random n=60000  prob_right=90  seed=356357
tc g6-12 gen_random n=60000  prob_right=100 seed=43658743
tc g6-13 gen_random n=60000  prob_right=0   seed=74476
tc g6-14 gen_random n=60000  prob_right=10  seed=254532
tc g6-15 gen_random n=90009  prob_right=20  seed=3654768
tc g6-16 gen_random n=90009  prob_right=30  seed=2453568
tc g6-17 gen_random n=90009  prob_right=40  seed=2458365
tc g6-18 gen_random n=90009  prob_right=50  seed=2453657
tc g6-19 gen_random n=90009  prob_right=60  seed=24578
tc g6-20 gen_random n=90009  prob_right=70  seed=254794
tc g6-21 gen_random n=90009  prob_right=80  seed=2458704
tc g6-22 gen_random n=90009  prob_right=90  seed=807423
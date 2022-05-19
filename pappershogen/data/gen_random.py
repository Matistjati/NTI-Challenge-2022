#!/usr/bin/python3


import sys
import random
import math
import copy

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        exit(1)
    return default


def get_manual(id):
    g = str(id)[0]
    n = int(str(id)[1])
    manual_tc = {"1": ["1\nU", "1\nN"],
                 "2": ["9\nUUUUUUUUN", "8\nNNNUUNUN"],
                 "3": ["5\nNUUUU", "52\nUUUUUUUUUUNUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU", "172\n" + "U"*172],
                 "4": ["7\nUNUNUNU", "5\nNUNUN"]}

    return manual_tc[g][n]
    

def flip(l, m):
    for i in range(m):
        l[i] = not l[i]
    l = (l[:m])[::-1] + l[m:]

def judge_sol(b):
    moves = []
    parity = b[0]
    for pointer in range(len(b) - 1):
        if b[pointer] != b[pointer + 1]:
            moves.append(pointer+1)
            parity = not parity
    if not parity:
        moves.append(len(b))
    return len(moves)

def to_bin(tc):
    return [1 if i == 'U' else 0 for i in tc]

def Single_Random_Case(n_range, m_range, case_seed=0):
    if case_seed:
        random.seed(case_seed)
    n = random.randint(n_range[0],n_range[1])
    l = [True for i in range(n)]
    for i in range(random.randint(m_range[0], m_range[1])):
        flip(l,random.randint(1,n))
    return str(n) + "\n" + "".join("U" if l[i] else "N" for i in range(n))

def Big_n_single_tc(n_range, p):
    n = random.randint(n_range[0],n_range[1])
    return str(n) + "\n" + "".join(["U" if random.randint(0,100) < p else "N" for i in range(n)])

def G3_tc(n_range, errors):
    n = random.randint(n_range[0], n_range[1])
    c = "U" if random.randint(0,100) < 50 else "N"
    tc = [c for i in range(n)]
    for i in range(errors):
        tc[random.randint(0, len(tc)-1)] = "U" if c == "N" else "N"
    return str(n) + "\n"+"".join(tc)


def tc_odd_even(n_range, bit):
    n = random.randint(n_range[0],n_range[1])
    return str(n) + "\n" + "".join(["U" if i%2==bit else "N" for i in range(n)])


random.seed(int(cmdlinearg('seed')))
n = int(cmdlinearg('n'))
manual = int(cmdlinearg("mtc", default=0))
max_moves = int(cmdlinearg("max_moves", default=int(1e9)))
odd_even = int(cmdlinearg("odd_even", default=0))
prob = int(cmdlinearg("prob_right", default=-1))
max_errors = int(cmdlinearg("max_error", default=-1))

if manual != 0:
    print(get_manual(manual))
else:
    while True:
        if n < 2000:
            tc = Single_Random_Case([1,n], [0,n-1])
        elif max_errors!=-1:
            tc = G3_tc([0,n], max_errors)
        elif odd_even:
            tc = tc_odd_even([0,n], 1 if odd_even==1 else 0)
        else:
            tc = Big_n_single_tc([0,n],prob)

        if judge_sol(to_bin(tc)) <= max_moves:
            print(tc)
            break


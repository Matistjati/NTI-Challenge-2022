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


random.seed(int(cmdlinearg('seed')))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
percent_trees = float(cmdlinearg('percent_trees'))


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

def flip(l, m):
    for i in range(m):
        l[i] = not l[i]
    l = (l[:m])[::-1] + l[m:]

def Case1_Preprogrammed(): # 4 st
    return []

def Case1_Random(): # 24st - Har sett på datan och den ser ok ut
    cs = []
    random.seed(28246)
    for i in range(10): cs.append(Single_Random_Case([3,8], [1,4], 0))
    random.seed(1987)
    for i in range(14): cs.append(Single_Random_Case([8,10], [4,5], 0))
    return cs

def Case2_Preprogrammed(): # 3 st - Har specialfall med 1 och 0 "N"
    return ["5\nNUUUU", "52\nUUUUUUUUUUNUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU", "172\n" + "U"*172]

def Case2_Random(): # 7 st - Har bara fall där det finns 2 "N"
    def Case2_Single_Case(n_range):
        n = random.randint(n_range[0],n_range[1])
        l = [True for i in range(n)]
        for j in range(2): l[random.randint(0,n-1)] = False
        return str(n) + "\n" + "".join("U" if l[i] else "N" for i in range(n))
    cs = []
    random.seed(1298)
    for i in range(2): cs.append(Case2_Single_Case([10,100]))
    random.seed(8932)
    for i in range(4): cs.append(Case2_Single_Case([100,200]))
    cs.append(Case2_Single_Case([200,200]))
    return cs

def Case3_Preprogrammed(): # 4 st
    return ["1\nU", "1\nN", "7\nUNUNUNU", "5\nNUNUN"]

def Case3_Random(): # 6 st
    cs = []
    def Case3_Single_Case(n_range, bit):
        n = random.randint(n_range[0],n_range[1])
        return str(n) + "\n" + "".join(["U" if i%2==bit else "N" for i in range(n)])
    random.seed(1675)
    for i in range(2): cs.append(Case3_Single_Case([100,1000], i))
    for i in range(2): cs.append(Case3_Single_Case([1000,10000], i))
    for i in range(2): cs.append(Case3_Single_Case([10000,100000], i)) # This contains both ending in "U" and "N" bc that's an important detail
    return cs

def Case4_Preprogrammed(): # 2st + 4 st + 7 st = 13 st
    return Sample() + Case1_Preprogrammed() + Case2_Random()

def Case4_Random(): # 7 st
    cs = []
    random.seed(63832)
    for i in range(2): cs.append(Single_Random_Case([10,100], [10,100], 0))
    for i in range(2): cs.append(Single_Random_Case([100,1000], [100,200], 0)) # Sparse
    cs.append("123\n" + "".join(["U" if i%2 == 0 else "N" for i in range(123)])) # One from test case 3 for completeness
    for i in range(2): cs.append(Single_Random_Case([500,1000], [1000,2000], 0)) # So that it gets really scrambled
    return cs

def Case5_Preprogrammed(): # 2 st + 4 st + 6 st = 12 st
    return Sample() + Case1_Preprogrammed() + Case3_Random()

def Case5_Random(): # 18 st - Some scaling and then lots of difficult test cases
    def Case5_Single_Case(n_range, p):
        n = random.randint(n_range[0],n_range[1])
        return str(n) + "\n" + "".join(["U" if random.randint(0,100) < p else "N" for i in range(n)])
    cs = []
    random.seed(2678)
    for i in range(2): cs.append(Case5_Single_Case([100,10000],50))
    for i in range(2): cs.append(Case5_Single_Case([1000,100000],50))
    for i in range(2): cs.append(Case5_Single_Case([50000,100000],50))
    cs.append(Case3_Random()[4])
    cs.append(Case3_Random()[5])
    random.seed(29784)
    for i in range(2): cs.append(Case5_Single_Case([50000,100000],10))
    cs.append(Case5_Single_Case([50000,100000],2))
    for i in range(2): cs.append(Case5_Single_Case([50000,100000],90))
    cs.append(Case5_Single_Case([50000,100000],98))
    for i in range(4): cs.append(Case5_Single_Case([50000,100000],50))
    return cs

def Single_Random_Case(n_range, m_range, case_seed):
    if case_seed:
        random.seed(case_seed)
    n = random.randint(n_range[0],n_range[1])
    l = [True for i in range(n)]
    for i in range(random.randint(m_range[0], m_range[1])):
        flip(l,random.randint(1,n))
    return str(n) + "\n" + "".join("U" if l[i] else "N" for i in range(n))

def Case1(): return Sample() + Case1_Preprogrammed() + Case1_Random() # A total of 30 cases just bc

def Case2(): return Case2_Preprogrammed() + Case2_Random() # A total of 10 cases to fit with the points.

def Case3(): return Case3_Preprogrammed() + Case3_Random() # Has the LARGE cases mmm

def Case4(): return Case4_Preprogrammed() + Case4_Random() # Random stuff

def Case5(): return Case5_Preprogrammed() + Case5_Random() # 10 BIG ones

print(len(Case1()))
print(len(Case2()))
print(len(Case3()))
print(len(Case4()))
print(len(Case5()))
def Case5_Single_Case(n_range, p): # Kopia av den avancerade funtionen
        n = random.randint(n_range[0],n_range[1])
        return str(n) + "\n" + "".join(["U" if random.randint(0,100) < p else "N" for i in range(n)])

def lin(b): # Linjätlösningen för testning
    moves = []
    parity = b[0]
    for pointer in range(len(b) - 1):
        if b[pointer] != b[pointer + 1]:
            moves.append(pointer+1)
            parity = not parity
    if not parity:
        moves.append(len(b))
    return moves

def flip(l, m):
    for i in range(m):
        l[i] = not l[i]
    for i in range(m//2):
        l[i], l[m-i-1] = l[m-i-1], l[i]